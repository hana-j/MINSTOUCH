package svc.user;

import java.sql.Connection;
import static db.JdbcUtil.*;
import dao.UserDAO;
import vo.UserBean;

public class gradeService {


	public static UserBean updateGrade(UserBean user) {
		Connection con = null;
		UserDAO userDAO = null;
		int gradeok=0;
		int lastMonthMoney=0;
		String grade=user.getU_grade();
		
		try {
			con=getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			lastMonthMoney=userDAO.getLastMonthMoney(user.getU_id());

			if(grade.trim().equals("Family") && lastMonthMoney>=60000) {
				gradeok=userDAO.upGrade(user);
				if(gradeok > 0) {
					commit(con);
				}else {
					rollback(con);
				}
			}else if(grade.trim().equals("Vip") && lastMonthMoney<60000) {
				gradeok=userDAO.downGrade(user);
				if(gradeok > 0) {
					commit(con);
				}else {
					rollback(con);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
			
		
		return user;
		
	}

	public double getSaleRate(String u_grade) {
		Connection con=null;
		double saleRate=1.0;
		
		try {
			con=getConnection();
			UserDAO userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			saleRate=userDAO.selectSaleRate(u_grade);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return saleRate;
	}
}