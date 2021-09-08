<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	
	body{
		margin:auto;
		height:80%;
		width:100%;
	}
	.wrap{
		display:flex;
		flex-direction:column;
		width:100%
	}
	.none{
		height:70vh;
	}
	.menu1{
		width:80%;
	}
	.menu2{
		width:80%;
	}
	/*데스크탑*/
	@media screen and (min-width:769px){
		.wrap{
			display:flex;
			
		}
		.none{
			width:50vh;
		}
	}
</style>
<meta  charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<div class="menu1">
			<jsp:include page="admin_menu1.jsp"/>
		</div>
		<br>
		<br>
		<br>
		<div class="menu2">
		
			<jsp:include page="${admin_showmenu }"/>
		</div>
	</div>
		<c:if test="${admin_showmenu eq null }">
			<div class="none">
			</div>
		</c:if>
	
</body>
</html>