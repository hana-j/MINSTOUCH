<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
	body{
		margin:0;
		padding:0;
	}
	.adminMenu{
		margin:auto;
		background-color:#DB0000;
		width:110px;
		/*border:5px solid blue;*/
		padding-right:40px;
		float:left;
	}
	.adminMenu > ul > li > a{
		text-decoration:none;
		
		color:#FFFF24;
	}
	.adminMenu > ul > li{
		
		margin-top:5px;
	}
	.adminMenu > ul{
		list-style:none;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="adminMenu">
		<ul>
			<li><a href="${pageContext.request.contextPath }/orderManage.adm">주문관리</a></li>
			<li><a href="${pageContext.request.contextPath }/menuManage.adm">메뉴관리</a></li>
			<li><a href="${pageContext.request.contextPath }/salesCal.adm">매출관리</a></li>
			<li><a href="${pageContext.request.contextPath }/placeManage.adm">발주요청</a></li>
			<li><a href="${pageContext.request.contextPath }/soldOut.adm">품절설정</a></li>
			<li><a href="${pageContext.request.contextPath }/service.adm">고객센터</a></li>
			
			<c:choose>
            <c:when test="${admin_grade ne 'Admin' }">
            <li><a href="${pageContext.request.contextPath}/adminLogin.adm">로그인</a></li>
					<li>|</li>
					<li><a href="${pageContext.request.contextPath}/adminJoin.adm">관리자등록</a></li>
            </c:when>
            <c:otherwise>
					<li><a href="${pageContext.request.contextPath}/adminLogout.adm">로그아웃</a></li>
			</c:otherwise>
            </c:choose>
		</ul>
	</div>
</body>
</html>