package svc.user;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.UserDAO;
import vo.Address;
import vo.UserBean;

public class UserModService {

	public boolean modInfo(UserBean user, Address addr) {
		Connection con=null;
		UserDAO userDAO = null;
		boolean isModSuccess = false;
		
		try {
			con=getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			int modCount_a = userDAO.modAddr(user, addr);
			int modCount_u = userDAO.modInfo(user);
			
			if(modCount_a>0 && modCount_u>0) {
				commit(con);
				isModSuccess = true;
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return isModSuccess;
	}

}
