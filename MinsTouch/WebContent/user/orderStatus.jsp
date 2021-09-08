<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="vo.Order, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
	function window_onload(){
		setInterval('win_refresh()',10000);
	}
	function win_refresh(){
		location.href="realtimeOrder.kiosk";
	}
</script>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body onload="javascript:window_onload()">
	<c:if test="${latestOrder ne null }">
		<br>
		

		<c:if test="${latestOrder.u_id eq u_id }">
			
			<b>주문번호:</b> ${latestOrder.order_num }<br>
			<b>주문시간:</b> ${latestOrder.or_date }<br>
			<b>주문상태:</b> ${latestOrder.status }<br>
			
		</c:if>

	</c:if>
	
	<c:if test="${latestOrder eq null }">
		<b>주문을 아직 확인하지 않았습니다.</b>
	</c:if>
</body>
</html>