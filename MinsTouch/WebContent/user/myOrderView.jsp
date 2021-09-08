<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page import="java.util.ArrayList" %>
    <%@page import="vo.Order" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32" href="./user_main/민스탭.png">
<title>MIN'S TOUCH</title>
<style>
	*{
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
		box-sizing:border-box;
	}
	
	/*메인 부분*/
	#myOrderViewArea{
		margin:0 auto;
	}
	#orderButton{
		position:absolute;
		top:0;
		left:0;
		width:100%;
		height:100%;
		text-align:center;
		margin: auto;
		margin-bottom:20px;
	}
	#myOrderViewArea table{
		width:100%;
		height:100%;
		clear:both;
		color:#5c4738;
		
	}
	#myOrderViewArea table th{
		height:100%;
		clear:both;
		color:white;
		background-color: #5c4738;
		
	}
	#myOrderViewArea table a{
		color:#5c4738;
	}
	.view{
		width:80%;
		height:100%;
		margin-bottom:20px;
	}
	.none{
		height:10vh;
	}
	h2{
		color:#5c4738;
		font-size:2em;
	}
	h3{
		width:100%;
		color:rgba(238, 73, 47, 0.83);
		font-size:1.5em;
		
	}
	.h3{
		width:100%;
		color:#a4948a;
		font-size:1em;
		margin-top:10px;
	}
	
	@media screen and (min-width:1200px){
		.wrap{
			display:flex;
			algin-items:center;
			justify-content:center;
		}
	}

	#myOrderViewArea table{
		border-collapse:collapse;
	}
	#myOrderViewArea table tr td{
		padding:10px;
		border:1px solid #993800;
	}
</style>
</head>
<body>
	<br><br>
	<main id="myOrderViewArea">
	<img src="${pageContext.request.contextPath}/img/user_img/mypage.png" width="70%" height="16%">
		<div class="succ1">
			<img src="${pageContext.request.contextPath}/img/chain/hr.png" width="80%">
		</div>
	
		<div class="wrap">
			<div class="view">
				<c:if test="${myOrderList ne null }">
				<h2>내 주문 내역</h2>
				<a class="h3">주문번호를 클릭하시면 주문상세정보를 확인하실 수 있습니다!</a>
				<br>
				<br>
				<table style="width:100%">
					<tr>
						<th>주문번호</th><th>주문시간</th><th>주문상태</th><th>구매액</th>
					</tr>
					<tr>	
						<c:forEach var="order" items="${myOrderList }" varStatus="status">
						<td><a href="myOrderDetail.kiosk?order_num=${order.order_num }&totalMoney=${order.totalMoney}"><strong>${order.order_num }</strong></a></td>
						<td>${order.or_date }</td>
						<td>${order.status }</td>
						<td>${order.totalMoney }</td>
							<c:if test="${((status.index+1) mod 1) eq 0 }">
					</tr>
					<tr>
							</c:if>
						</c:forEach>
					</tr>
				</table>	
				</c:if>
			</div>
		</div>
		<div class="none">
		<c:if test="${myOrderList eq null }">
			<div>주문이 없습니다ㅠㅠ!</div>
		</c:if>
		</div>
	</main>
</body>
</html>