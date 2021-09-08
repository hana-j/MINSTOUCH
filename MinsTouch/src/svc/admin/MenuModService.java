package svc.admin;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BurgerDAO;
import vo.Burger;

public class MenuModService {

	public boolean updateMenu(Burger menu) {
		boolean isModSuccess=false;
		Connection con=null;
		
		try {
			con=getConnection();
			BurgerDAO burgerDAO=BurgerDAO.getInstance();
			burgerDAO.setConnection(con);
			
			int updateCount=burgerDAO.updateMenu(menu);
			
			if(updateCount>0) {
				commit(con);
				isModSuccess=true;
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
