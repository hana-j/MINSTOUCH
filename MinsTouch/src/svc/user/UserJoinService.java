package svc.user;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.UserDAO;
import vo.Address;
import vo.UserBean;

public class UserJoinService {

	public boolean join(UserBean user, Address addr) {
		Connection con = null;
		UserDAO userDAO = null;
		boolean joinSuccess = false;
		try {
			con = getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			
			int insertUser = userDAO.insertUser(user);
			int insertAddr = userDAO.insertAddr(addr ,user);
			
			if(insertUser>0 &&insertAddr >0) {
				joinSuccess = true;
				commit(con);
			
			}else {
				rollback(con); //회원가입실패시 롤백 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return joinSuccess;
	}

}
