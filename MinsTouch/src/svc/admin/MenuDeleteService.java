package svc.admin;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BurgerDAO;

public class MenuDeleteService {

	public boolean menuRemove(String m_id) {
		boolean delSuccess=false;
		Connection con=null;
		BurgerDAO burgerDAO=BurgerDAO.getInstance();
		int deleteCount=0;
		
		try {
			con=getConnection();
			burgerDAO.setConnection(con);
			
			deleteCount=burgerDAO.deleteMenu(m_id);
			
			if(deleteCount>0) {
				delSuccess=true;
				commit(con);
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return delSuccess;
	}

}
