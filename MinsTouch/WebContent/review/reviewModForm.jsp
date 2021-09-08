<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.reMod{
		color:#664a39;
	}
	.img-button {
		border: none;
        border-radius:10px;
        width: 100px;
        height: 40px;
        cursor: pointer;
        content-align:center;
	}
</style>
</head>
<body>
	<form action="modReview.re" method="post">
	리뷰수정페이지 입니다!
	<table class="reMod">
		<tr>
			<td><input type="hidden" name="u_id" value="${review.u_id }"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="m_id" value="${review.m_id }"></td>
		</tr>
		<tr>
			<td style="margin-top:1%;" width="10%">
				한줄평<img src="${pageContext.request.contextPath}/img/user_img/commant.png" width="18%" height="1%">
			</td>
			<td>
				<textarea name="text" style="resize:none; margin-top:1%; float:left; width:80%;">${review.text }</textarea>
			</td>
		</tr>
		<tr>
			<td style="margin-top:1%;" width="10%">
				
				<img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="18%" height="2%">평점
			</td>
			<td>
				<select name="rating" style="width:40%; height:4%; float:left;">
			    	<option value="0">평점선택</option>
			    	<option value="5" selected="selected" style="font-family:돋움; color: orange;">★★★★★</option>
			    	<option value="4" style="font-family: 돋움; color: orange;">★★★★</option>
			    	<option value="3" style="font-family: 돋움; color: orange;">★★★</option>
			    	<option value="2" style="font-family: 돋움; color: orange;">★★</option>
			    	<option value="1" style="font-family: 돋움; color: orange;">★</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="hidden" name="renum" value="${review.review_num }">
			</td>
		</tr>
	</table>
	<section id="commandCell">
		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;
		<button onclick="modReview.re" class="img-button"><img src="${pageContext.request.contextPath}/img/user_img/ok.png"></button>
	</section>
	</form>
</body>
</html>