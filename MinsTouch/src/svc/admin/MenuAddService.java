package svc.admin;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BurgerDAO;
import vo.Burger;

public class MenuAddService {

	public boolean addMenu(Burger newMenu) {
		boolean isAddSuccess=false;
		Connection con=null;
		int insertCount=0;
		
		try {
			con=getConnection();
			BurgerDAO burgerDAO=BurgerDAO.getInstance();
			burgerDAO.setConnection(con);
			
			insertCount=burgerDAO.insertNewMenu(newMenu);
			
			if(insertCount>0) {
				commit(con);
				isAddSuccess=true;
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isAddSuccess;
	}
	

}
