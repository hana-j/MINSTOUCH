package svc.admin;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.OrderDAO;

public class OrderCancelService {

	public boolean cancelOrder(int order_num) {
		boolean cancelSuccess=false;
		Connection con=null;
		
		try {
			con=getConnection();
			OrderDAO orderDAO=OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			int updateCount=orderDAO.updateCancelOrder(order_num);
			
			if(updateCount>0) {
				commit(con);
				cancelSuccess=true;
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return cancelSuccess;
	}

}
