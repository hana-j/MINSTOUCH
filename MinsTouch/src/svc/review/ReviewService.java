package svc.review;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.Review;

public class ReviewService {

	public ArrayList<Review> showReview(String m_id) {
		Connection con=null;
		ArrayList<Review> reviewList=null;
		try {
			con=getConnection();
			ReviewDAO reviewDao=ReviewDAO.getInstance();
			reviewDao.setConnection(con);
			reviewList=reviewDao.selectReviewList(m_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close(con);
		}	
		return reviewList;
	}
	
	
	
	
	
	

	public boolean postReview(String u_id,String m_id,int rating, String text) {
		boolean reSuccess=false;
		int insertCount=0;
		Connection con=null;
		try {
			con=getConnection();
			ReviewDAO reviewDao=ReviewDAO.getInstance();
			reviewDao.setConnection(con);
			insertCount=reviewDao.insertReview(u_id,m_id,rating,text);
			
			if(insertCount>0) {
				reSuccess=true;
				commit(con);
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return reSuccess;
	}

}
