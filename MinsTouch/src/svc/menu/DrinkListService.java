package svc.menu;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.BurgerDAO;
import vo.Burger;

public class DrinkListService {

	public ArrayList<Burger> getDrinkList() {
		Connection con=null;
		ArrayList<Burger> drinkList=null;
		
		try {
			con=getConnection();
			BurgerDAO burgerDAO=BurgerDAO.getInstance();
			burgerDAO.setConnection(con);
			drinkList=burgerDAO.selectDrinkList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return drinkList;
	}

}
