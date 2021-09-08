package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Order;
import vo.Ordetail;

public class OrderDAO {
	Connection con;
	private static OrderDAO orderDAO;
	
	private OrderDAO() {}
	
	public static OrderDAO getInstance() {
		if(orderDAO==null) orderDAO=new OrderDAO();
		return orderDAO;
	}
	
	public void setConnection(Connection con) {
		this.con=con;
	}

	public ArrayList<Order> selectOrderList() {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Order> orderList=null;
		
		try {
			pstmt=con.prepareStatement("select * from order_table order by or_date desc");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				orderList=new ArrayList<Order>();
				do {
					orderList.add(new Order(rs.getInt("order_num"),
							rs.getString("u_id"),
							rs.getTimestamp("or_date"),
							rs.getString("status"),
							rs.getInt("totalmoney")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return orderList;
	}

	public ArrayList<Ordetail> selectOrdetailList(int order_num) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Ordetail> ordetailList=null;
//		Ordetail ordetail=null;
		
		try {
			pstmt=con.prepareStatement("select * from ordetail_table where order_num=?");
			pstmt.setInt(1, order_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ordetailList=new ArrayList<Ordetail>();
				do {
					ordetailList.add(new Ordetail(rs.getInt("detail_index"),
							rs.getString("m_id"),
							rs.getInt("order_num"),
							rs.getInt("quantity"),
							rs.getString("m_name"),
							rs.getInt("m_price")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return ordetailList;
	}

	public int updateGetOrder(int order_num) {
		int updateCount=0;
		PreparedStatement pstmt=null;
		String sql="update order_table set status='get' where order_num=?";

		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, order_num);
			updateCount=pstmt.executeUpdate();
			
			if(updateCount>0) commit(con);
			else rollback(con);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}

	public int updateCancelOrder(int order_num) {
		int updateCount=0;
		PreparedStatement pstmt=null;
		String sql="update order_table set status='cancel' where order_num=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, order_num);
			updateCount=pstmt.executeUpdate();
			
			if(updateCount>0) commit(con);
			else rollback(con);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateCount;
	}

	public ArrayList<Order> selectMyOrderList(String u_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Order> myOrderList=null;
		
		try {
			pstmt=con.prepareStatement("select * from order_table where u_id=? order by or_date desc");
			pstmt.setString(1, u_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				myOrderList=new ArrayList<Order>();
				do {
					myOrderList.add(new Order(rs.getInt("order_num"),
							rs.getString("u_id"),
							rs.getTimestamp("or_date"),
							rs.getString("status"),
							rs.getInt("totalmoney")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return myOrderList;
	}

	public ArrayList<Order> selectdayOrderList(String s_date) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Order> dayorderList=null;
		
		try {
			pstmt=con.prepareStatement("select * from order_table where date(or_date)=? order by or_date desc");
			
			pstmt.setString(1, s_date);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dayorderList=new ArrayList<Order>();
				do {
					dayorderList.add(new Order(rs.getInt("order_num"),
							rs.getString("u_id"),
							rs.getTimestamp("or_date"),
							rs.getString("status"),
							rs.getInt("totalmoney")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return dayorderList;
	}

	
	
	//customer
	public Order getLatestOrder(String u_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Order latestOrder=null;
		try {
			pstmt=con.prepareStatement("select * from order_table where u_id=? order by or_date desc limit 1");
			pstmt.setString(1, u_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				latestOrder=new Order(rs.getInt("order_num"),
						rs.getString("u_id"),
						rs.getTimestamp("or_date"),
						rs.getString("status"),
						rs.getInt("totalmoney")
						);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return latestOrder;
		
	}
	
	
}
