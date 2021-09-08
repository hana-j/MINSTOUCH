package dao;

import java.sql.*;
import static db.JdbcUtil.*;

import Util.SHA256;
import vo.Address;
import vo.UserBean;

public class AdminDAO {
	private static AdminDAO adminDAO;
	Connection con;
	
	
	private AdminDAO() {}
	
	public static AdminDAO getInstance() {
		if(adminDAO == null) {
			adminDAO = new AdminDAO();
		}
		return adminDAO;
	}
	public void setConnection(Connection con) {
		this.con=con;
	}
	
	
	//관리자 로그인 
	public int login(UserBean admin) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String login ="select u_password from user_table where u_id=?";
		int loginok=0;
		try {
			pstmt=con.prepareStatement(login);
			pstmt.setString(1, admin.getU_id());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String pass= admin.getU_password();
				String f_pass = SHA256.endcodSha256(pass);
				if(rs.getString("u_password").equals(f_pass)) {
					loginok=1;
				}else {
					loginok=0;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return loginok;
	}
	
	
	//관리자등록 - User table
	public int join(UserBean admin) {
		PreparedStatement pstmt=null;
		
		String join_a="insert into user_table(u_id, u_grade,u_password,u_email,u_name,u_call, u_date) values(?,?,?,?,?,?,?)";
		int joinok =0;
		try {
			pstmt=con.prepareStatement(join_a);
			pstmt.setString(1, admin.getU_id());
			pstmt.setString(2, admin.getU_grade());
			pstmt.setString(3, admin.getU_password());
			pstmt.setString(4, admin.getU_email());
			pstmt.setString(5, admin.getU_name());
			pstmt.setString(6, admin.getU_call());
			pstmt.setString(7, admin.getU_date());
			joinok=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return joinok;
	}
	//관리자등록 - Address table
	public int joinAddr(UserBean admin, Address addr) {
		PreparedStatement pstmt=null;
		
		String join_a="insert into address_table(u_id, zip, address1, address2) values(?,?,?,?)";
		int addrok = 0;
		try {
			pstmt = con.prepareStatement(join_a);
			pstmt.setString(1, admin.getU_id());
			pstmt.setInt(2, addr.getZip());
			pstmt.setString(3, addr.getAddress1());
			pstmt.setString(4, addr.getAddress2());
			addrok = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return addrok;
	}
	//하루 매출 조회 
	public int getMoneyInfo(String or_date) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int dayMoney=-1;
		
		try {
			
			pstmt=con.prepareStatement("select sum(totalmoney) from order_table where date(or_date) = ? and status='get'");
			pstmt.setString(1, or_date);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dayMoney=rs.getInt("sum(totalmoney)");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return dayMoney;
	}
	//월매출 조회 
	public int getMoneyInfo_m(String month) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int monthMoney=-1;
		
		try {
			pstmt= con.prepareStatement("select sum(totalmoney) from order_table where or_date like? and status='get'");
			pstmt.setString(1, month+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				monthMoney = rs.getInt("sum(totalmoney)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return monthMoney;
	}
}
