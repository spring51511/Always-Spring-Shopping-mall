package product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO {

	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	private Context init;
	
	private ProductDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.out.println("생성자 예외 : " + e);
		}
	}
	
	// 목록 출력
	public List<ProductDTO> selectList() {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from Products order by pidx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setPidx(rs.getInt("pidx"));
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setPrice(rs.getInt("price"));
				dto.setImgPath(rs.getString("imgPath"));
				dto.setProduct_content(rs.getString("product_content"));
				
				list.add(dto);
			}
			
		} catch(SQLException e) {
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
	
	
	public List<ProductDTO> selectListKind(String kind) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from Products where kind='" + kind + "'";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setPidx(rs.getInt("pidx"));
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setPrice(rs.getInt("price"));
				dto.setImgPath(rs.getString("imgPath"));
				dto.setProduct_content(rs.getString("product_content"));
				
				list.add(dto);
			}
			
		} catch(SQLException e) {
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
	
	
	
	
	
	// 추가
	
	public int insert(ProductDTO dto) {
		int row = 0;
		String sql = "insert into Products (name, kind, price, imgPath, product_content) values (?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getKind());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getImgPath());
			pstmt.setString(5, dto.getProduct_content());
			
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
	
	// 목록 하나 선택
	
	public ProductDTO selectOne(int pidx) {
		String sql = "select * from Products where pidx=" + pidx;
		ProductDTO dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new ProductDTO();
				dto.setPidx(rs.getInt("pidx"));
				dto.setName(rs.getString("name"));
				dto.setKind(rs.getString("kind"));
				dto.setPrice(rs.getInt("price"));
				dto.setImgPath(rs.getString("imgPath"));
				dto.setProduct_content(rs.getString("product_content"));
				
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
	
	
	// 수정
	
	public int update(ProductDTO dto, int pidx) {
		int row = 0;
		String sql = "update Products set name=?, kind=?, price=?, imgPath=?, product_content=? where pidx=" + pidx;
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getKind());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getImgPath());
			pstmt.setString(5, dto.getProduct_content());
			
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
	
	
	
	// 삭제
	
	public int delete(int pidx) {
		int row = 0;
		
		String sql = "delete from Products where pidx=" + pidx;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
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
	
}
