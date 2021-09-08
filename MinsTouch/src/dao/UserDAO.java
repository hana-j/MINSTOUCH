package dao;


import java.sql.*;

import static db.JdbcUtil.*;


import Util.SHA256;
import vo.Address;
import vo.UserBean;

public class UserDAO {

	public static UserDAO instance;
	Connection con;
	
	
	//데이터 베이스 객체는 공유해서 사용함으로 싱글톤으로 생성 
	private UserDAO() {}
	
	public static UserDAO getInstance() {
		if(instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	//로그인 아이디 확인 
	public String selectLoginId(String c_id, String c_password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String dbPw = null;
		String ok_Id = "";
		try {
			pstmt=con.prepareStatement("select u_password from user_table where u_id=?");
			pstmt.setString(1, c_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dbPw = rs.getString("u_password");
				String cc_password = SHA256.endcodSha256(c_password);
				
				if(dbPw.equals(cc_password)) {
					ok_Id=c_id;
				}else {
					ok_Id=null;
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return ok_Id;
	}
	
	//회원가입 -User table
	public int insertUser(UserBean user) {
		PreparedStatement pstmt=null;
		
		String sql_u="insert into user_table(u_id, u_grade,u_password,u_email,u_name,u_call, u_date) values(?,?,?,?,?,?,?)";
		int insertUser = 0;
		
		try {
			pstmt =con.prepareStatement(sql_u);
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, user.getU_grade());
			pstmt.setString(3, user.getU_password());
			pstmt.setString(4, user.getU_email());
			pstmt.setString(5, user.getU_name());
			pstmt.setString(6, user.getU_call());
			pstmt.setString(7, user.getU_date());
			System.out.println(user.getU_date());
			insertUser=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertUser;
	}
	//회원가입 - Address table 
	public int insertAddr(Address addr, UserBean user) {
		PreparedStatement pstmt=null;
		
		String sql_a="insert into address_table(u_id, zip, address1, address2) values(?,?,?,?)";
		int insertAddr =0;
		
		try {
			
			pstmt=con.prepareStatement(sql_a);
			pstmt.setString(1, user.getU_id());
			pstmt.setInt(2, addr.getZip());
			pstmt.setString(3, addr.getAddress1());
			pstmt.setString(4, addr.getAddress2());
			insertAddr= pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertAddr;
	}
	//회원정보 가져오기 
	public UserBean getUserInfo(String viewId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql_g="select * from user_table where u_id=?";
		UserBean info=null;
		try {
			pstmt = con.prepareStatement(sql_g);
			pstmt.setString(1, viewId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				info = new UserBean();
				info.setU_id(rs.getString("u_id"));
				info.setU_grade(rs.getString("u_grade"));
				info.setU_email(rs.getString("u_email"));
				info.setU_name(rs.getString("u_name"));
				info.setU_call(rs.getString("u_call"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		return info;
	}
	
	
	//회원 주소 가져오기 
	public Address getUserAddr(String viewId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql_a ="select zip, address1, address2 from address_table where u_id=?";
		Address info_a= null;
		
		try {
			pstmt = con.prepareStatement(sql_a);
			pstmt.setString(1, viewId);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				info_a =new Address();
				info_a.setZip(rs.getInt("zip"));
				info_a.setAddress1(rs.getString("address1"));
				info_a.setAddress2(rs.getString("address2"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return info_a;
	}
	//회원정보 수정 - User
	public int modInfo(UserBean user) {
		PreparedStatement pstmt=null;
		
		String m_u ="update user_table set u_email=?, u_call=? where u_id=?";
		int modok=0;
		
		try {
			pstmt = con.prepareStatement(m_u);
			pstmt.setString(1, user.getU_email());
			pstmt.setString(2, user.getU_call());
			pstmt.setString(3, user.getU_id());
			modok=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return modok;
	}
	//회원정보 수정 - Address
	public int modAddr(UserBean user, Address addr) {
		PreparedStatement pstmt=null;
	
		String m_a= "update address_table set zip=?, address1=?, address2=? where u_id=?";
		int modok = 0;
		
		try {
			pstmt = con.prepareStatement(m_a);
			pstmt.setInt(1, addr.getZip());
			pstmt.setString(2, addr.getAddress1());
			pstmt.setString(3, addr.getAddress2());
			pstmt.setString(4, user.getU_id());
			modok = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return modok;
	}
	//아이디 찾기 
	public UserBean findId(String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String findId = "select * from user_table where u_email=?";
		UserBean user = null;
		try {
			pstmt=con.prepareStatement(findId);
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserBean();
				user.setU_id(rs.getString("u_id"));
				user.setU_email(rs.getString("u_email"));
			}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
		return user;
	}
	//임시비번 메일전송 확인  
	public UserBean findPw(String id, String email) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String findpw ="select u_name from user_table where u_id=? and u_email=? ";
		UserBean user = null;
		try {
			pstmt = con.prepareStatement(findpw);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				user = new UserBean();
				user.setU_id(rs.getString("u_id"));
				user.setU_email(rs.getString("u_email"));
				user.setU_name(rs.getString("u_name"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return user;
	}
	
	
	
	//등급관련
	public int upGrade(UserBean user) {
		PreparedStatement pstmt=null;
		
		String ch_grade="update user_table set u_grade ='Vip' where u_id=?";
		int ok = 0;
		try {
			pstmt = con.prepareStatement(ch_grade);
			pstmt.setString(1, user.getU_id());
			ok = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return ok;
	}
	public int downGrade(UserBean user) {
		PreparedStatement pstmt=null;
		
		String sql="update user_table set u_grade='Family' where u_id=?";
		int ok=0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, user.getU_id());
			ok=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return ok;
	}
	public int getLastMonthMoney(String u_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int lastMonthMoney=0;
		try {
			String sql="select sum(totalmoney) from order_table where month(or_date)=month(now())-1 and u_id=? and status='get'";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				lastMonthMoney=rs.getInt("sum(totalmoney)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return lastMonthMoney;
	}
	
	public double selectSaleRate(String u_grade) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		double saleRate=1.0;
		try {
			String sql="select salerate from grade_table where grade=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, u_grade);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				saleRate=rs.getInt("salerate")/100.0;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return saleRate;
	}
	
	
	//비밀번호 변경 
	public int changePw(UserBean user) {
		PreparedStatement pstmt=null;
		
		String ch_password ="update user_table set u_password =? where u_id=?";
		int chOk = 0;
		try {
			pstmt = con.prepareStatement(ch_password);
			pstmt.setString(1, user.getU_password());
			pstmt.setString(2, user.getU_id());
			chOk = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return chOk;
	}
	//유저삭제 
	public int delete(String u_id) {
		PreparedStatement pstmt = null;
		int delCount = 0;
		
		try {
			pstmt = con.prepareStatement("delete from user_table where u_id=?");
			pstmt.setString(1, u_id);
			delCount = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return delCount;
	}

	
	
	
}
