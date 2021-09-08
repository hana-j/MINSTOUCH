package svc.user;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.UserDAO;


public class UserDelService {

	public boolean delete(String u_id) {
		Connection con = null;
		UserDAO userDAO = null;
		boolean delok = false;
		
		try {
			con=getConnection();
			userDAO= UserDAO.getInstance();
			userDAO.setConnection(con);
			int delCount = userDAO.delete(u_id);
			
			if(delCount>0) { 
				delok = true;
				commit(con);
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return delok;
	}

}
