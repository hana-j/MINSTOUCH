<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin:0;
		padding:0;
		height:100%;
	}
	.menu1{
		display:block;
		margin:auto;
		background-color:white;
		width:100%;
		text-align:center;
	}
	.menu1 > ul > li > a{
		text-decoration:none;
		text-align:center;
		color:#5c4738;
		font-size:1.5em;
		font-weight:bolder;
	}
	.menu1 > ul > li > a:hover{
		color:orange;
	}
	.menu1 > ul > li{
		margin-top:10px;
		display:inline-block;
		margin-left:5px;
		margin-right:5px;
		text-decoration: underline;
	}
	.menu1 > ul{
		list-style:none;
	}
	.menuAddButton{
		font-size:1.5em;
		text-decoration:none;
		color:black;
		padding:5px;
	}
	
	
	@media screen and (min-width:1200px){
		.menu1{
			float:left;
		}
	}
</style>
</head>
<body>
	<img src="${pageContext.request.contextPath }/img/user_img/menu.png" width="80%">
	<img src="${pageContext.request.contextPath }/img/sec_img/hr.png" width="80%">
	<br>
	<br>
	<div class="menu1">
		<ul>
			<li><a href="${pageContext.request.contextPath }/set.adm">세트메뉴</a></li>
			<li><a href="${pageContext.request.contextPath }/burger.adm">버거</a></li>
			<li><a href="${pageContext.request.contextPath }/side.adm">사이드</a></li>
			<li><a href="${pageContext.request.contextPath }/drink.adm">음료</a></li>
			<li><a href="${pageContext.request.contextPath }/dessert.adm">디저트</a></li>
			<li><a href="${pageContext.request.contextPath }/menuAddForm.adm" class="menuAddButton">메뉴추가</a></li>
		</ul>
	</div>
</body>
</html>