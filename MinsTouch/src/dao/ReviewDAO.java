package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import vo.Review;

public class ReviewDAO {
	Connection con;
	private static ReviewDAO reviewDao;

	private ReviewDAO() {

	}

	public static ReviewDAO getInstance() {
		if (reviewDao == null) {
			reviewDao = new ReviewDAO();

		}
		return reviewDao;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<Review> selectReviewList(String m_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Review> reviewList=null;
		
		try {
			pstmt=con.prepareStatement("select * from review where m_id=?");
			pstmt.setString(1, m_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				reviewList=new ArrayList<Review>();
				do {
					reviewList.add(new Review(rs.getInt("review_num"),
							rs.getString("u_id"),
							rs.getString("m_id"),
							rs.getInt("rating"),
							rs.getString("text")));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return reviewList;
	}

	public int insertReview(String u_id,String m_id,int rating, String text) {
		int insertCount=0;
		PreparedStatement pstmt=null;
		String sql="insert into review (u_id,m_id,rating,text) values (?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setString(2, m_id);
			pstmt.setInt(3, rating);
			pstmt.setString(4, text);
			insertCount=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return insertCount;
	}

	

	public int deleteReview(String u_id,int renum) {
		int deleteCount=0;
		PreparedStatement pstmt=null;
		String sql="delete from review where review_num =? and u_id=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, renum);
			pstmt.setString(2, u_id);
			deleteCount=pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteCount;
	}

	

	public Review selectReview(int renum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Review review=null;
		
		try {
			pstmt=con.prepareStatement("select * from review where review_num=?");
			pstmt.setInt(1, renum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				review=new Review(rs.getInt("review_num"),
							rs.getString("u_id"),
							rs.getString("m_id"),
							rs.getInt("rating"),
							rs.getString("text"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return review;
	}

	public int updateReview(String u_id,String m_id,int renum, int rating, String text) {
		int updateCount=0;
		PreparedStatement pstmt=null;
		String sql="update review set u_id=?,m_id=?,rating=?,text=? where review_num=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setString(2, m_id);
			pstmt.setInt(3, rating);
			pstmt.setString(4, text);
			pstmt.setInt(5, renum);
			
			updateCount=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateCount;
	}
}
