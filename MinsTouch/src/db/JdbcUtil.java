package db;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class JdbcUtil {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds= (DataSource)envCtx.lookup("jdbc/MySQLdb");
			con = ds.getConnection();
			con.setAutoCommit(false);
//			System.out.println("connection success");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static void close(Connection con) {
		try {
			if(con!=null)con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt!=null)stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs!=null)rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void commit (Connection con) {
		try {
			con.commit();
			System.out.println("commit success");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection con) {
		try {
			con.rollback();
			System.out.println("rollback");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}