<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.* ,javax.sql.*, javax.naming.*"%>
<%
	String openInit="false";
	if(request.getParameter("openInit")!=null){
	openInit=request.getParameter("openInit");
	}%>

<!DOCTYPE html>
<html>
<head>
<style>
	 #id{
		width:160px;
		height:50px;
		border-radius:10px;
		margin-top:20px;
		padding:0px 20px;
		border:1px solid orange;
		outline:none;
	}
	#submit{
		width:130px;
		height:40px;
		border-radius:10px;
		padding:0 20px;
		background:rgba(238, 73, 47, 0.83);
		color:white;
		font-size:1.1em;
		letter-spacing:2px;
		cursor:pointer;
	}
	a{
		text-decoration:none;
		color:rgba(238, 73, 47, 0.83);
		font-size:1.5em;
	}
</style>
<meta charset="UTF-8">
<title>중복확인</title>
</head>
<script>
function init(){
	if(<%=openInit%>){
		document.getElementById("id").value=opener.document.getElementById("id").value;
	}
}
	
function useId(v){
	opener.chkId=true;
	opener.idcheck=v.trim();
	opener.document.getElementById("u_id").value=v;
	window.close();
}
</script>
<body onload="init()">
	<form name="f" action="idCheckProcess.jsp" method="post">
		<input type="text" name="idCheck" id="id">&nbsp;&nbsp;
		<input type="submit" id="submit" value="중복확인">
	</form>		
</body>
</html>
<% request.setCharacterEncoding("utf-8");           //html밑에 써야함 그래야 순서대로 출력 

if(request.getParameter("chk_id")!=null
	&&!request.getParameter("chk_id").trim().equals("")){
	String id=request.getParameter("chk_id");
	String useable = request.getParameter("useable");
	out.println("<hr>");
	
	if(useable.equals("no")){
		out.println("<h3>"+id+"는 사용 불가능한 아이디 입니다. 다시 시도</h3>");
	}else{
		out.println("<h3>"+id+"는 사용가능한 아이디 입니다.");
		out.println("<a href ='javascript:useId(\""+id+"\")'>사용하기</a></h3>");
	}
	
}
%>

