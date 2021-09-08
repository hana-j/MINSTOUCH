package svc.menu;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.BurgerDAO;
import vo.Burger;

public class BurgerViewService {

	public Burger getBurgerView(String burger_id) {
		Burger burger=null;
		Connection con=null;
		BurgerDAO burgerDAO=BurgerDAO.getInstance();
		try {
			con=getConnection();
			burgerDAO.setConnection(con);
			burger=burgerDAO.selectBurger(burger_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return burger;
	}

}
