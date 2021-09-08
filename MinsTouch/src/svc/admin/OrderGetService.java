package svc.admin;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.OrderDAO;

public class OrderGetService {

	public boolean getOrder(int order_num) {
		boolean getSuccess=false;
		Connection con=null;
		
		try {
			con=getConnection();
			OrderDAO orderDAO=OrderDAO.getInstance();
			orderDAO.setConnection(con);
			
			int updateCount=orderDAO.updateGetOrder(order_num);
			
			if(updateCount>0) {
				commit(con);
				getSuccess=true;
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return getSuccess;
	}

}
