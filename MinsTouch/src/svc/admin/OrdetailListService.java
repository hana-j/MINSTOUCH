package svc.admin;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.OrderDAO;
import vo.Ordetail;

public class OrdetailListService {

	public ArrayList<Ordetail> getOrdetailList(int order_num) {
		Connection con=null;
		ArrayList<Ordetail> ordetailList=null;
		
		try {
			con=getConnection();
			OrderDAO orderDAO=OrderDAO.getInstance();
			orderDAO.setConnection(con);
			ordetailList=orderDAO.selectOrdetailList(order_num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return ordetailList;
	}

}
