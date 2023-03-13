package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import user_.UserDTO;

public class ManagerDAO {
	
	private static ManagerDAO instance = new ManagerDAO();
	
	public static ManagerDAO getInstance() {
		
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	private Context init;
	
	public ManagerDAO() {

		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		}catch(NamingException e) {
			System.out.println("생성자 예외 "+e);
		}
	
	}
	
	private ManagerDTO mapping(ResultSet rs) throws SQLException {
		
		ManagerDTO dto = new ManagerDTO();
		
		dto.setMgidx(rs.getInt("Mgidx"));
		dto.setMgid(rs.getString("mgid"));
		dto.setMgpw(rs.getString("mgpw"));
		dto.setManame(rs.getString("maname"));
		dto.setMgphone(rs.getString("mgphone"));
		dto.setMgaddress(rs.getString("mgaddress"));
		dto.setMgEmail(rs.getString("mgEmail"));
		dto.setMgjoindate(rs.getDate("mgjoindate"));
		return dto;
	}
	
	public void close() {
		
			try {
				if(rs != null)
				rs.close();
				if(pstmt != null)
				pstmt.close();
				if(conn != null)
				conn.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	
	
	
	
	// 관리자 리스트
	public ArrayList<ManagerDTO> showList() {

		ArrayList<ManagerDTO> list = new ArrayList<ManagerDTO>();
		String sql = "select * from manager order by mgidx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ManagerDTO ob = mapping(rs);
				list.add(ob);
			}
		} catch (SQLException e) {

		} finally {
			close();
		}
		return list;
	}
	
	// 선택 조회
	public ManagerDTO selectOne(String mgid) {
		ManagerDTO dto = null;
		String sql = "select * from manager where mgid =" + mgid;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = mapping(rs);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return dto;
	}

	// 가입
	public int join(ManagerDTO dto) {
		int row = 0;
		String sql = "insert into manager (mgid,mgpw,mgname,mgphone,mgemail,mgaddress)values (?,?,?,?,?,?)";

		try {
			conn = pstmt.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMgid());
			pstmt.setString(2, dto.getMgpw());
			pstmt.setString(3, dto.getManame());
			pstmt.setString(4, dto.getMgphone());
			pstmt.setString(5, dto.getMgEmail());
			pstmt.setString(6, dto.getMgaddress());

			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;

	}

	// 탈퇴
	public int delete(int mgidx) {
		int row = 0;
		String sql = "delete from manager where mgidx =" + mgidx;

		try {
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;

	}



	//// 수정
	public int modify(ManagerDTO dto, int mgidx) {
		int row = 0;

		String sql = "update from manager set mgpw=?, mgname=?, mgphone=?, mgemail=?, mgaddress=? where mgidx=" + mgidx;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMgpw());
			pstmt.setString(2, dto.getManame());
			pstmt.setString(3, dto.getMgphone());
			pstmt.setString(4, dto.getMgEmail());
			pstmt.setString(5, dto.getMgEmail());

			row = pstmt.executeUpdate();

		} catch (SQLException e) {

		} finally {
			close();
		}
		return row;

	}

	public ManagerDTO login(ManagerDTO user) {
		ManagerDTO dto = null;
			
		String sql = "select * from manager where mgid = ? and mgpw =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getMgid());
			pstmt.setString(2, user.getMgpw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto = mapping(rs);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return dto;

	
	}

}

