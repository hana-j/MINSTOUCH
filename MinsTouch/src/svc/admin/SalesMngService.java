package svc.admin;

import java.sql.Connection;
import dao.AdminDAO;

import static db.JdbcUtil.*;



public class SalesMngService {

	public int getDayInfo(String or_date) {
		int dayMoney=-1;
		Connection con = null;
		AdminDAO adminDAO = null;
		
		try {
			con = getConnection();
			adminDAO=AdminDAO.getInstance();
			adminDAO.setConnection(con);
			dayMoney = adminDAO.getMoneyInfo(or_date);
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return dayMoney;
	}

}
