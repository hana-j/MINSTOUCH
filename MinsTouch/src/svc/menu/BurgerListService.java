package svc.menu;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BurgerDAO;
import vo.Burger;

public class BurgerListService {

	public ArrayList<Burger> getBurgerList() {
		Connection con=null;
		ArrayList<Burger> burgerList=null;
		
		try {
			con=getConnection();
			BurgerDAO burgerDAO=BurgerDAO.getInstance();
			burgerDAO.setConnection(con);
			burgerList=burgerDAO.selectBurgerList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return burgerList;
	}
	

}
