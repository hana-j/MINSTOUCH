package svc.menu;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.BurgerDAO;
import dao.OrderDAO;
import vo.Burger;
import vo.Order;

public class BurgerCartOrderService {

	public boolean orderBurger(String u_id, ArrayList<Burger> burgerList,int totalMoney) {
		boolean isOrderSuccess=false;
		
		BurgerDAO burgerDAO=BurgerDAO.getInstance();
		Connection con=null;
		int insertCount=0;
		
		try {
			con=getConnection();
			burgerDAO.setConnection(con);
			insertCount=burgerDAO.insertBurger(u_id,burgerList,totalMoney);
			
			if(insertCount>0) {
				commit(con);
				isOrderSuccess=true;
//				if(isOrderSuccess==true) {
//					burgerDAO.insertOrder(totalMoney);
//				}
				
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isOrderSuccess;
	}

	public Order customerOrder(String u_id) {
		Connection con=null;
		Order latestOrder=null;
		try {
			con=getConnection();
			OrderDAO orderDao=OrderDAO.getInstance();
			orderDao.setConnection(con);
			latestOrder=orderDao.getLatestOrder(u_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		
		return latestOrder;
	}

}
