package svc.user;

import java.sql.Connection;

import dao.UserDAO;

import static db.JdbcUtil.*;

import vo.Address;
import vo.UserBean;

public class UserViewService {
	//User table에 있는 회원정보 
	public UserBean getUser(String viewId) {
		Connection con = null;
		UserDAO userDAO = null;
		UserBean user= null;
		try {
			con = getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			user = userDAO.getUserInfo(viewId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return user;
	
	}
	//주소정보 
	public Address getAddress(String viewId) {
		Connection con = null;
		UserDAO userDAO = null;
		Address addr = new Address();
		try {
			con = getConnection();
			userDAO = UserDAO.getInstance();
			userDAO.setConnection(con);
			addr = userDAO.getUserAddr(viewId);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return addr;
	}

}
