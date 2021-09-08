package svc.admin;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.AdminDAO;

public class MonthSalesMngService {

	public int getMonthInfo(String month) {
		
		int monthMoney = -1;
		Connection con = null;
		AdminDAO adminDAO = null;
		
		try {
			con = getConnection();
			adminDAO =AdminDAO.getInstance();
			adminDAO.setConnection(con);
			monthMoney = adminDAO.getMoneyInfo_m(month);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return monthMoney;
	}

}
