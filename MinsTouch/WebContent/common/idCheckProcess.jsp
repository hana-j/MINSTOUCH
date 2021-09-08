<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import=" java.sql.*, javax.sql.*, javax.naming.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String idCheck = request.getParameter("idCheck");
	
	if (idCheck != null &&  ! idCheck.trim().equals("")) {//id는 항상 null먼저 확인    
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLdb");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select * from user_table where u_id=?");
		pstmt.setString(1, idCheck);
		rs=pstmt.executeQuery();
		if(rs.next()){
			response.sendRedirect("idCheck.jsp?chk_id="+idCheck+"&useable=no");
			
		}else{
			response.sendRedirect("idCheck.jsp?chk_id="+idCheck+"&useable=yes");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
	if (rs!=null) rs.close();
	if (pstmt != null) pstmt.close();
	if (conn != null)conn.close();
		} catch (Exception e) {
	e.printStackTrace();
		}
	}

} else {
	out.println("<script>");
	out.println("alert('확인할 아이디를 입력하세요')");
	out.println("location.href='idCheck.jsp';");
	out.println("</script>");
}
%>