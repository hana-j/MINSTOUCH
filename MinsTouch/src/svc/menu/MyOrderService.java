package svc.menu;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.Order;

public class MyOrderService {

	public ArrayList<Order> getMyOrder(String u_id) {
		Connection con=null;
		ArrayList<Order> myOrderList=null;
		try {
			con=getConnection();
			OrderDAO orderDao=OrderDAO.getInstance();
			orderDao.setConnection(con);
			myOrderList=orderDao.selectMyOrderList(u_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return myOrderList;
	}

}
