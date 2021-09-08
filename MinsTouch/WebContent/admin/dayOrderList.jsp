<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="vo.Order" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="refresh" content="10">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
#list {
	width:100%;
	height: 100%;
}

#listForm {
	height: 100%;
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	align-content: stretch;
}

.box {
	margin-top: 10px;
	height: 80%;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	margin-bottom: 10px;
}

.box1 {
	border: 1px solid black;
	outline: none;
	border-radius: 3px;
	width: 80%;
}

ul li {
	list-style: none;
}
#list #listForm .box1{
	border-collapse:collapse;
}
#list #listForm .box1 tr td{
	border: 1px solid gray;
	padding:0.4em;
}

.a {
	text-decoration:none;
	color: #5c4738;
	font-size: 2em;
}

.tr a {
	color: #5c4738;
}
.btn a{
	text-decoration:none;
	color: rgba(238, 73, 47, 0.83);
	font-size: 1em;
	font-weight:bold;
	cursor:pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<main id="list">
		<section id="listForm">
			<c:if test="${dayOrderList ne null }">
				<div class="a" style="width: 100%">
					<h3>주문 확인 대기</h3>
				</div><br>
				<table class="box1" style="width: 100% border:1px solid black">

					<tr style="background-color: #5c4738; color: white">
						<th>주문번호</th>
						<th>고객ID</th>
						<th>주문시간</th>
						<th>주문상태</th>
						<th>총 가격</th>
						<th></th>
					</tr>
					<c:forEach var="order" items="${dayOrderList }" varStatus="status">
						<c:if test="${order.status eq 'order' }">
							<form method="post">
							<tr class="tr">
								<td>
									<strong><a href="orderDetail.adm?order_num=${order.order_num }&u_id=${order.u_id }">${order.order_num }</a></strong>
								</td>
								<td>${order.u_id }</td>
								<td>${order.or_date }</td>
								<td>${order.status }</td>
								<td>${order.totalMoney }</td>
								<td class="btn">
									<a href="orderGet.adm?order_num=${order.order_num }">주문승인</a>&nbsp;&nbsp;&nbsp;
									<a href="orderCancel.adm?order_num=${order.order_num }">주문취소</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				</form>
				<div class="a" style="width: 100%">
					<h3>주문 승인</h3>
				</div>

				<table class="box1" style="width: 100% border:1px solid black">
					<tr style="background-color: #5c4738; color: white">

						<th>주문번호</th>
						<th>고객ID</th>
						<th>고객ID</th>
						<th>주문상태</th>
						<th>총 가격</th>
					</tr>
					<form method="post">
						<c:forEach var="order" items="${dayOrderList }" varStatus="status">
							<c:if test="${order.status eq 'get' }">
								<tr class="tr">
									<td><strong><a
											href="orderDetail.adm?order_num=${order.order_num }&u_id=${order.u_id }">${order.order_num }</strong></a></td>
									<td>${order.u_id }</td>
									<td>${order.or_date }</td>
									<td>${order.status }</td>
									<td>${order.totalMoney }</td>

								</tr>

							</c:if>
						</c:forEach>
				</table>
				</form>



				<div class="a" style="width: 100%">
					<h3>주문 취소</h3>
				</div>
				<table class="box1" style="width: 100% border:1px solid black">

					<tr style="background-color: #5c4738; color: white">
						<th>주문번호</th>
						<th>고객ID</th>
						<th>고객ID</th>
						<th>주문상태</th>
						<th>총 가격</th>
					</tr>
					<c:forEach var="order" items="${dayOrderList }" varStatus="status">
						<c:if test="${order.status eq 'cancel' }">
							<form method="post">
								<tr class="tr">

									<td><strong><a
											href="orderDetail.adm?order_num=${order.order_num }&u_id=${order.u_id }">${order.order_num }</strong></a></td>
									<td>${order.u_id }</td>
									<td>${order.or_date }</td>
									<td>${order.status }</td>
									<td>${order.totalMoney }</td>
								</tr>
						</c:if>
					</c:forEach>
				</table>
				</form>
			</c:if>

			<c:if test="${dayOrderList eq null }">
				<p>아직 주문이 없네요 ㅠㅠ~</p>
			</c:if>
		</section>
	</main>
</body>
</html>