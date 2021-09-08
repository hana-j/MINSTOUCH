package svc.user;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.UserDAO;
import vo.UserBean;


public class UserLoginService {

	public boolean login(String c_id, String c_password) {
		Connection con = null;
		UserDAO userDAO = null;
		boolean loginResult = false;
		try {
			con = getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			
			String loginId= userDAO.selectLoginId(c_id, c_password);
			
			if(loginId!=null) {
				loginResult = true;
			}else {
				loginResult=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return loginResult;
	}
    //등급 변경 
	public UserBean getOrder(String c_id) {
		Connection con = null;
		UserDAO userDAO = null;
		UserBean user = null;
		
		try {
			con = getConnection();
			userDAO =UserDAO.getInstance();
			userDAO.setConnection(con);
			user = userDAO.getUserInfo(c_id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return user;
	}

}
