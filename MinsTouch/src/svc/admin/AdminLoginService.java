package svc.admin;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.AdminDAO;
import vo.UserBean;

public class AdminLoginService {

	public boolean login(UserBean admin) {
		Connection con = null;
		AdminDAO adminDAO = null;
		boolean loginok = false;
		
		try {
			con =getConnection();
			adminDAO = AdminDAO.getInstance();
			adminDAO.setConnection(con);
			int loginCount = adminDAO.login(admin);
			
			if(loginCount>0) {
				loginok=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return loginok;
	}

}
