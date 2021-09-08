package svc.menu;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.BurgerDAO;
import vo.Burger;

public class SetListService {

	public ArrayList<Burger> getSetList() {
		Connection con=null;
		ArrayList<Burger> setList=null;
		
		try {
			con=getConnection();
			BurgerDAO burgerDAO=BurgerDAO.getInstance();
			burgerDAO.setConnection(con);
			setList=burgerDAO.selectSetList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return setList;
	}

}
