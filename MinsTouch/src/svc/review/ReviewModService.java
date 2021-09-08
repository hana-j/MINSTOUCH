package svc.review;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.ReviewDAO;
import vo.Review;

public class ReviewModService {

	

	public Review getReview(int renum) {
		Connection con=null;
		Review review=null;
		
		try {
			con=getConnection();
			ReviewDAO reviewDao=ReviewDAO.getInstance();
			reviewDao.setConnection(con);
			review=reviewDao.selectReview(renum);
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			close(con);
		}	
		return review;
	}

	public boolean modReview(String u_id,String m_id,int renum, int rating, String text) {
		boolean modSuccess=false;
		int updateCount=0;
		Connection con=null;
		
		try {
			con=getConnection();
			ReviewDAO reviewDao=ReviewDAO.getInstance();
			reviewDao.setConnection(con);
			updateCount=reviewDao.updateReview(u_id,m_id,renum,rating,text);
			
			if(updateCount>0) {
				commit(con);
				modSuccess=true;
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return modSuccess;
	}

}
