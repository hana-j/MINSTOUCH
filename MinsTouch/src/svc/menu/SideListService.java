package svc.menu;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BurgerDAO;
import vo.Burger;

public class SideListService {

	public ArrayList<Burger> getSideList() {
		Connection con=null;
		ArrayList<Burger> sideList=null;
		
		try {
			con=getConnection();
			BurgerDAO burgerDAO=BurgerDAO.getInstance();
			burgerDAO.setConnection(con);
			sideList=burgerDAO.selectSideList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return sideList;
	}

}
