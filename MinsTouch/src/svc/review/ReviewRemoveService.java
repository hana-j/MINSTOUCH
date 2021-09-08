package svc.review;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.ReviewDAO;

public class ReviewRemoveService {

	public boolean removeReview(String u_id,int renum) {
		Connection con = null;
		int deleteCount =0;
		
		boolean removeSuccess =false;
		try {
			con=getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			
			deleteCount =reviewDAO.deleteReview(u_id,renum);
			
			if(deleteCount>0) {
				commit(con);
				removeSuccess=true;
			}else {
				rollback(con);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return removeSuccess;
	}

}
