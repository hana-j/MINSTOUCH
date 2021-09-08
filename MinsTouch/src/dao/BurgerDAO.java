package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.Burger;

public class BurgerDAO {
	Connection con;
	private static BurgerDAO burgerDAO;
	
	private BurgerDAO() {}

	public static BurgerDAO getInstance() {
		if(burgerDAO==null) burgerDAO=new BurgerDAO();
		return burgerDAO;
	}

	public void setConnection(Connection con) {
		this.con=con;
	}

	public ArrayList<Burger> selectBurgerList() {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Burger> burgerList=null;
		
		try {
			pstmt=con.prepareStatement("select * from menu_table where category='burger'");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				burgerList=new ArrayList<Burger>();
				do {
					burgerList.add(new Burger(rs.getString("m_id"),
							rs.getString("category"),
							rs.getString("m_name"),
							rs.getInt("m_price"),
							rs.getString("m_detail"),
							rs.getString("m_status"),
							rs.getDate("m_date"),
							rs.getString("image")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return burgerList;
	}

	public Burger selectBurger(String menu_id) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Burger burger=null;
		
		try {
			pstmt=con.prepareStatement("select * from menu_table where m_id=?");
			pstmt.setString(1,menu_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				burger=new Burger(rs.getString("m_id"),
						rs.getString("category"),
						rs.getString("m_name"),
						rs.getInt("m_price"),
						rs.getString("m_detail"),
						rs.getString("m_status"),
						rs.getDate("m_date"),
						rs.getString("image")
						);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return burger;
	}

	public int insertBurger(String u_id,ArrayList<Burger> burgerList, int totalMoney) {
		PreparedStatement pstmt=null;
		int insertCount=0;
		String sql="";
		
		PreparedStatement pstmt2=null;
		String sql2="";
		
		PreparedStatement pstmt3=null;
		ResultSet rs3=null;
		
		try {
			sql2="insert into order_table (u_id,or_date,status,totalmoney) values (?,now(),'order',?)";
			pstmt2=con.prepareStatement(sql2);
			pstmt2.setString(1, u_id);
			pstmt2.setInt(2, totalMoney);
			pstmt2.executeUpdate();
			
			
			pstmt3=con.prepareStatement("select max(order_num) from order_table where u_id=?");
			pstmt3.setString(1, u_id);
			rs3=pstmt3.executeQuery();
			if(rs3.next()) {
				for(int i=0; i<burgerList.size(); i++) {
					sql="insert into ordetail_table (m_id,order_num,quantity,m_name,m_price) values (?,?,?,?,?)";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, burgerList.get(i).getM_id());
					pstmt.setInt(2, rs3.getInt("max(order_num)"));
					pstmt.setInt(3, burgerList.get(i).getQuantity());
					pstmt.setString(4, burgerList.get(i).getM_name());
					pstmt.setInt(5, burgerList.get(i).getM_price());
					insertCount=pstmt.executeUpdate();
				}
			}
			System.out.println("inserCount : " + insertCount);
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(pstmt3);
			close(pstmt2);
		}
		return insertCount;
	}

	public ArrayList<Burger> selectSideList() {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Burger> sideList=null;
		
		try {
			pstmt=con.prepareStatement("select * from menu_table where category='side'");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				sideList=new ArrayList<Burger>();
				do {
					sideList.add(new Burger(rs.getString("m_id"),
							rs.getString("category"),
							rs.getString("m_name"),
							rs.getInt("m_price"),
							rs.getString("m_detail"),
							rs.getString("m_status"),
							rs.getDate("m_date"),
							rs.getString("image")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return sideList;
	}

	public ArrayList<Burger> selectDrinkList() {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Burger> drinkList=null;
		
		try {
			pstmt=con.prepareStatement("select * from menu_table where category='drink'");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				drinkList=new ArrayList<Burger>();
				do {
					drinkList.add(new Burger(rs.getString("m_id"),
							rs.getString("category"),
							rs.getString("m_name"),
							rs.getInt("m_price"),
							rs.getString("m_detail"),
							rs.getString("m_status"),
							rs.getDate("m_date"),
							rs.getString("image")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return drinkList;
	}

	public ArrayList<Burger> selectDessertList() {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Burger> dessertList=null;
		
		try {
			pstmt=con.prepareStatement("select * from menu_table where category='dessert'");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dessertList=new ArrayList<Burger>();
				do {
					dessertList.add(new Burger(rs.getString("m_id"),
							rs.getString("category"),
							rs.getString("m_name"),
							rs.getInt("m_price"),
							rs.getString("m_detail"),
							rs.getString("m_status"),
							rs.getDate("m_date"),
							rs.getString("image")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return dessertList;
	}

	public ArrayList<Burger> selectSetList() {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Burger> setList=null;
		
		try {
			pstmt=con.prepareStatement("select * from menu_table where category='set'");
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				setList=new ArrayList<Burger>();
				do {
					setList.add(new Burger(rs.getString("m_id"),
							rs.getString("category"),
							rs.getString("m_name"),
							rs.getInt("m_price"),
							rs.getString("m_detail"),
							rs.getString("m_status"),
							rs.getDate("m_date"),
							rs.getString("image")
							));
				}while(rs.next());
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return setList;
	}

	
	public int deleteMenu(String m_id) {
		PreparedStatement pstmt=null;
		String sql="";
		int deleteCount=0;
		
		try {
			sql="delete from menu_table where m_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			deleteCount=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteCount;
	}

	public int updateMenu(Burger menu) {
		int updateCount=0;
		PreparedStatement pstmt=null;
		String sql="update menu_table set category=?,m_name=?,m_price=?,m_detail=?,m_status=?,m_date=now()";
		
		if(menu.getImage()!=null) {
			sql+=", image = '" + menu.getImage() + "'";
		}
		sql += " where m_id=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, menu.getCategory());
			pstmt.setString(2, menu.getM_name());
			pstmt.setInt(3, menu.getM_price());
			pstmt.setString(4, menu.getM_detail());
			pstmt.setString(5, menu.getM_status());
			pstmt.setString(6,menu.getM_id());
			
			updateCount=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return updateCount;
	}

	public int insertNewMenu(Burger newMenu) {
		int insertCount=0;
		PreparedStatement pstmt=null;
		String sql="insert into menu_table values (?,?,?,?,?,?,now(),?)";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, newMenu.getM_id());
			pstmt.setString(2, newMenu.getCategory());
			pstmt.setString(3, newMenu.getM_name());
			pstmt.setInt(4, newMenu.getM_price());
			pstmt.setString(5, newMenu.getM_detail());
			pstmt.setString(6, newMenu.getM_status());
			pstmt.setString(7, newMenu.getImage());
			insertCount=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return insertCount;
	}



}
