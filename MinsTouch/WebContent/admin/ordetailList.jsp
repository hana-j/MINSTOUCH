<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="vo.Ordetail" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#listForm{
		width:100%;
		height:100%;
	}
	.wrap{
		width:100%;
		height:100%;
	}
	#listForm .wrap h2{
		font-size:2em;
		color:#5c4738;
		margin-bottom:20px;
	}
	h3{
		font-size:1.5em;
		color:navy;
	}
	
	.order ul{
		
		border:1px solid #5c4738;
		width:80%;
	}
	.order ul li{
		display:block;
		list-style-type:none;
		margin:20px 0px;
		font-weight:bold;
	}
	.info{
		margin-top:50px;
	}
	.info ul li{
		list-style-type:none;
		margin:10px 0px;
		font-weight:bold;
	}
	form{
		width:90%;
	}
	.t {
		width:100%;
		border:1px solid gray;
	}
	.t tr th{
		background-color:#5c4738;
		color:white;
	}
	.t tr td{
		bolder:1px solid gray;
	}
	
	@media screen and (min-width:880px){
		
		.order ul li{
			float:left;
			display:inline-block;
			margin:20px;
		}
		.order ul{
			
			margin-left:5%;
			float:left;
			width:90%;
			border-left:5px solid #5c4738;
		}
		.info{
			clear:left;
			padding-top:50px;
		}
		.t {
			width:80%;
		}
	}
</style>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<img src="${pageContext.request.contextPath}/img/user_img/jumun.png" width="80%">

<img src="${pageContext.request.contextPath}/img/sec_img/hr.png" width="80%">
	<section id="listForm">
		<div class="wrap">
			<c:if test="${ordetailList ne null }">
			<form method="post">
				<h2>주문번호: ${ordetailList.get(0).order_num }</h2>
				<c:forEach var="ordetail" items="${ordetailList }" varStatus="status">
				<div class="order">
				
					<ul>
					
						<li>메뉴번호: ${status.index+1 }</li>
						<li>제품ID: ${ordetail.m_id }</li>
						<li>제품명: ${ordetail.m_name }</li>
						<li>주문수량: ${ordetail.quantity }</li>
					
					</ul>
				
				</div>
				</c:forEach>
				<div class="info">
				<hr color="#decdb9">
				<br>
					<h2>고객정보</h2>
					<table class="t">
						<tr>
							<th>이름</th>
							<th>전화번호</th>
							<th>주소</th>
						</tr>
						<tr>
							<td>${user.u_name}</td>
							<td>${user.u_call}</td>
							<td>${addr.zip }&nbsp;${addr.address1 }&nbsp;${addr.address2 }</td>
						</tr>
					</table>
				
				</div>
			</form>
			</c:if>
		</div>
		
		<c:if test="${ordetailList eq null }">
			주문이 없습니다.
		</c:if>
	</section>
</body>
</html>