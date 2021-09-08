<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page import="java.util.ArrayList" %>
    <%@page import="vo.Ordetail" %>
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
	.wrap{
		margin-top:50px;
	}
	.view{
		margin:auto;
		border-radius:40px;
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}
	.view table{
		margin-top:5px;
		border-collapse:collapse;
		margin-bottom:40px;
		border-radius: 10px;
	}
	.view table th{
		
		background-color: #5c4738;
		color:white;
	}
	.view table tr td{
		border:1px solid gray;
		width:200px;
		line-height:25px;
		white-space:nowrap;
		
	}
	h2{
		color:#5c4738;
		font-size:1.8em;
		padding:5px;
	}
	.h3{
		width:100%;
		color:#a4948a;
		font-size:1em;
		margin-top:10px;
	}
	#price{
		line-height:25px;
		font-weight:bold;
		margin-bottom:60px;
	}
	#price h2{
		margin-top:10px;
		padding-top:10px;
		border-top:3px solid #660033;
		width:60%;
	}
	
	#myOrderViewArea .empty{
		display:inline-block;
		width:0;
		height:200px;
		vertical-align:middle;
		
	}
	@media screen and (max-width:740px){
		.view table tr td{
			border:1px solid #FF5E00;
			width:200px;
			line-height:25px;
			
		}
	}
	
</style>
</head>
<body>
	<main id="myOrderViewArea">
		<br><br>
		<img src="${pageContext.request.contextPath}/img/user_img/mypage.png" width="70%" height="16%">
		<div class="succ1">
			<img src="${pageContext.request.contextPath}/img/chain/hr.png" width="80%">
		</div>
	
		<div class="wrap">
			<div class="view">
			<h2>내 주문 상세내역</h2>
				<a class="h3">주문상세내역 페이지 입니다</a>
				<c:if test="${myOrdetailList ne null }">
				<br><br>
				
				<strong style="float:center">주문번호: ${myOrdetailList.get(0).order_num }</strong>
				<table>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>주문수량</th>
						<th>금액</th>
					</tr>
					<tr>
						<c:forEach var="ordetail" items="${myOrdetailList }" varStatus="status">
						<td>${status.index+1 }</td>
						<td>${ordetail.m_name }</td>
						<td>${ordetail.quantity }개</td>
						<td>${ordetail.m_price * ordetail.quantity }원</td>
							<c:if test="${((status.index+1) mod 1) eq 0 }">
					</tr>
					<tr>
							</c:if>
						</c:forEach>
					</tr>
				</table>
				<section id="price">
				합계 금액: ${beforeSaleMoney }원<br>
				할인: -${beforeSaleMoney-totalMoney }원<br>
				<h2>총 결제 금액<img src="${pageContext.request.contextPath}/img/sec_img/w.png"> ${totalMoney }원</h2>
				</section>
				</c:if>
				
				
				
				<c:if test="${myOrdetailList eq null }">
					<br><br>	
					주문이 없습니다.
				</c:if>
			</div>
		</div>
	</main>
</body>
</html>