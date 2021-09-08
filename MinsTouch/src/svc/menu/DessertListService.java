package svc.menu;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BurgerDAO;
import vo.Burger;

public class DessertListService {

	public ArrayList<Burger> getDessertList() {
		Connection con=null;
		ArrayList<Burger> dessertList=null;
		
		try {
			con=getConnection();
			BurgerDAO burgerDAO=BurgerDAO.getInstance();
			burgerDAO.setConnection(con);
			dessertList=burgerDAO.selectDessertList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return dessertList;
	}

}
