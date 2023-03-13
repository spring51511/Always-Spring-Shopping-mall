package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO {
	
	private static OrderDAO instance = new OrderDAO();
	
	public static OrderDAO getInstance() {
		return instance;
	};
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	private Context init;
	
	
	public OrderDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생성자 예외" + e);
		} 

	}
	
	public List<OrderDTO> selectList() {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from order_ order by oridx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				
				dto.setOridx(rs.getInt("oridx"));
				dto.setUserid(rs.getString("userid"));
				dto.setOrderDate(rs.getDate("orderDate"));
				dto.setPidx(rs.getInt("pidx"));
				
				list.add(dto);
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {}	
		}	
		return list;		
	}
	
	
	public int insert(OrderDTO dto) {
		int row = 0;
		String sql = "insert into order_ (userid, pidx) values (?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserid());
			pstmt.setInt(2, dto.getPidx());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {}
		}
		
		return row;
	}
	
	public OrderDTO selectOne(int idx) {
		OrderDTO dto = null;
		String sql = "select * from order_ where oridx=" + idx;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				dto = new OrderDTO();
				dto.setOridx(rs.getInt("oridx"));
				dto.setUserid(rs.getString("userid"));
				dto.setOrderDate(rs.getDate("orderDate"));
				dto.setPidx(rs.getInt("pidx"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {}
		}

		return dto;
	}
	
	public List<OrderDTO> selectListUser(String userid) {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from order_ where userid='" + userid + "'";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				
				dto.setOridx(rs.getInt("oridx"));
				dto.setUserid(rs.getString("userid"));
				dto.setOrderDate(rs.getDate("orderDate"));
				dto.setPidx(rs.getInt("pidx"));
				
				list.add(dto);
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {}	
		}	
		return list;		
	}
	
	
//	public int getTotal() {
//		OrderDTO dto = null;
//		String sql = "select sum(Total) from order_";
//		int total = 0;
//		
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//				
//			while(rs.next()) {
//				dto = new OrderDTO();
//				dto.setOridx(rs.getInt("oridx"));
//				dto.setUserid(rs.getString("userid"));
//				dto.setOrderDate(rs.getDate("orderDate"));
//				dto.setPidx(rs.getInt("pidx"));
//				dto.setTotal(rs.getInt("total"));
//				total = pstmt.executeUpdate();
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs != null) rs.close();
//				if(pstmt != null) pstmt.close();
//				if(conn != null) conn.close();
//			} catch (Exception e) {}
//		}
//
//		return total;
//	}
	
}
