package svc.admin;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.AdminDAO;
import vo.Address;
import vo.UserBean;

public class AdminJoinService {

	public boolean join(UserBean admin, Address addr) {
		Connection con = null;
		AdminDAO adminDAO = null;
		boolean joinok = false;
		
		try {
			con=getConnection();
			adminDAO= AdminDAO.getInstance();
			adminDAO.setConnection(con);
			
			int infoCount = adminDAO.join(admin);
			int addrCount = adminDAO.joinAddr(admin, addr);
			
			if(infoCount>0 && addrCount>0) {
				joinok=true;
				commit(con);
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return joinok;
	}

}
