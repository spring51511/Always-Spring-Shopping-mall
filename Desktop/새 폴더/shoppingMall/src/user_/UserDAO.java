package user_;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class UserDAO {

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private DataSource ds;
	private Context init;

	public UserDAO() {

		try {

			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {

			System.out.println("생성자 예외 :" + e);

		}

	}

	private UserDTO mapping(ResultSet rs) throws SQLException {

		UserDTO dto = new UserDTO();

		dto.setIdx(rs.getInt("idx"));
		dto.setUserid(rs.getString("userid"));
		dto.setPw(rs.getString("pw"));
		dto.setName(rs.getString("name"));
		dto.setPhone(rs.getString("phone"));
		dto.setAddress(rs.getString("address"));
		dto.setEmail(rs.getString("email"));
		dto.setJoindate(rs.getDate("joindate"));

		return dto;
	}

	public void close() {

		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원 목록 조회
	public ArrayList<UserDTO> showList() {

		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		String sql = "select * from USER_ order by idx";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				UserDTO ob = mapping(rs);
				list.add(ob);
			}
		} catch (SQLException e) {

		} finally {
			close();
		}
		return list;
	}

	// 선택 조회
	public UserDTO selectOne(String userid) {
		UserDTO dto = null;
		String sql = "select * from USER_ where userid ='" + userid + "'";

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
	public int join(UserDTO dto) {
		int row = 0;
		String sql = "insert into USER_ (userid, pw, name, phone, email, address) values (?, ?, ?, ?, ?, ?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());

			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;

	}

	// 탈퇴
	public int delete(int idx) {
		int row = 0;
		String sql = "delete from USER_ where idx =" + idx;

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

//	private int idx;
//	private String userid;
//	private String pw;
//	private String name;
//	private String phone;
//	private Date joindate;
//	private String email;
//	private String address;

	//// 수정
	public int modify(UserDTO dto, int idx) {
		int row = 0;

		String sql = "update USER_ set pw=?, name=?, phone=?, email=?, address=? where idx=" + idx;

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());

			row = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;

	}

	public UserDTO login(UserDTO user) {
		UserDTO dto = null;
			
		String sql = "select * from USER_ where userid = ? and pw =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getPw());
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
