package svc.admin;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;


import dao.OrderDAO;
import vo.Order;

public class OrderListService {

	public ArrayList<Order> getOrderList() {
		Connection con=null;
		ArrayList<Order> orderList=null;
		
		try {
			con=getConnection();
			OrderDAO orderDAO=OrderDAO.getInstance();
			orderDAO.setConnection(con);
			orderList=orderDAO.selectOrderList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return orderList;
	}

}
