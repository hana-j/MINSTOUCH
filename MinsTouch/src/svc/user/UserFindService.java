package svc.user;

import vo.UserBean;
import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;
public class UserFindService {

	public UserBean findId(String email) {
		Connection con = null;
		UserDAO userDAO = null;
		UserBean user = null;
		
		try {
			con= getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			user=userDAO.findId(email);
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close(con);
		}
		return user;
	}

}
