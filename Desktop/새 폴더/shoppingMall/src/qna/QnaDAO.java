package qna;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class QnaDAO {

	private static QnaDAO instance = new QnaDAO();
	
	public static QnaDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	private Context init;
	
	private QnaDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.out.println("생성자 예외 : " + e);
		}
	}
	
	// 목록 출력
	public List<QnaDTO> selectList() {
		ArrayList<QnaDTO> list = new ArrayList<QnaDTO>();
		String sql = "select * from qna order by QnAidx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				
				dto.setQnAidx(rs.getInt("QnAidx"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setUserid(rs.getString("userid"));
				dto.setQnaDate(rs.getDate("qnaDate"));
				
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
	
	public int insert(QnaDTO dto) {
		int row = 0;
		String sql = "insert into qna (userid, subject, content) values (?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			
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
	
	public QnaDTO selectOne(int QnAidx) {
		String sql = "select * from qna where QnAidx=" + QnAidx;
		QnaDTO dto = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new QnaDTO();
				dto.setQnAidx(rs.getInt("QnAidx"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setUserid(rs.getString("userid"));
				dto.setQnaDate(rs.getDate("qnaDate"));
				
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
	
	public int update(QnaDTO dto, int QnAidx) {
		int row = 0;
		String sql = "update qna set subject=?, content=? where QnAidx=" + QnAidx;
		
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			
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
	
	public int delete(int QnAidx) {
		int row = 0;
		
		String sql = "delete from qna where QnAidx=" + QnAidx;
		
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