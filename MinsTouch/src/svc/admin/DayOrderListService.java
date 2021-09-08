package svc.admin;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;
import dao.OrderDAO;
import vo.Order;

public class DayOrderListService {

	public ArrayList<Order> getOrderList(String s_date) {
		Connection con = null;
		ArrayList<Order> dayOrderList = null;
		
		try {
			con =getConnection();
			OrderDAO orderDAO = OrderDAO.getInstance();
			orderDAO.setConnection(con);
			dayOrderList = orderDAO.selectdayOrderList(s_date);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return dayOrderList;
	}

}
