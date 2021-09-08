package svc.user;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.UserDAO;
import vo.UserBean;

public class FindPwMailService {

	public UserBean psFind(String id, String email) {
		Connection con = null;
		UserDAO userDAO = null;
		UserBean user = null;
		try {
			con = getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			
			user=userDAO.findPw(id, email);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return user;
	}

}
