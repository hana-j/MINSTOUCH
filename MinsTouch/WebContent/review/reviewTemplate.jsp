<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#template_table{
		margin:auto;
		width:90%;
		
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
	<c:when test="${m_id ne '' }">
	<table id="template_table">
		<tr>
			<td>
				<jsp:include page="writeReview.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="${showReview }"/>
			</td>
		</tr>
	</table>
	</c:when>
	<c:otherwise>
		&nbsp;
	</c:otherwise>
	</c:choose>
	
</body>
</html>