package svc.user;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.UserDAO;
import vo.UserBean;

public class ChangePwService {

	public boolean chPw(UserBean user) {
		Connection con = null;
		UserDAO userDAO = null;
		boolean chOk = false;
		
		try {
			con = getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int chOkCount=userDAO.changePw(user);
			
			if(chOkCount>0) {
				commit(con);
				chOk = true;
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return chOk;
	}

}
