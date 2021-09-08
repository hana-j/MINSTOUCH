<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	.reWrite{
		color:#664a39;
	}
	.reWrite ul li{
		list-style-type:none;
		float:center;
	
	}
	.reWrite ul {
		list-style-type:none;
		float:center;
	
	}
	.img-button {
    	border: none;
        border-radius:10px;
        width: 30%;
        height:60%;
        cursor: pointer;
	}
	.t{
  		text-align: center;
  		width:100%;
  	}
  	.ok_img{
  		width:160%;
  	}
  	
  	@media screen and (min-width:1200px){
		.ok_img{
  			width:110%;
  		}
	}
</style>
</head>
<body>
	
<form action="reviewPost.re" method="post">
	<div class="reWrite">
	<input type="hidden" name="u_id" value="${u_id }">
		
			<input type="hidden" name="m_id" value="${m_id }">
	<ul>
		<li>
			<c:if test="${u_name ne null }"><b>${u_name}</b>님의 평점<img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="1.5%" height="2%"> :</c:if> 
			<select name="rating" style="width:10%;height:4%;">
	    	<option value="0">평점선택</option>
	    	<option value="5" selected="selected"  style="font-family: 돋움; color: orange;">★★★★★</option>
	    	<option value="4" style="font-family: 돋움; color: orange;">★★★★</option>
	    	<option value="3" style="font-family: 돋움; color: orange;">★★★</option>
	    	<option value="2" style="font-family: 돋움; color: orange;">★★</option>
	    	<option value="1" style="font-family: 돋움; color: orange;">★</option>
			</select>
		</li>
	</ul>
		</div>
		<table class="t">
		<tr>
		<td style="padding-left:5%" width="15%">
			한줄평
		</td>
		<td width="80%" style="float:left">
			<textarea name="text" placeholder="한줄평을 입력해주세요" style="resize: none;  width:100%"></textarea>
		</td>
		<td width="35%"><button onclick="reviewPost.re" class="img-button"><img src="${pageContext.request.contextPath}/img/user_img/ok.png" class="ok_img"></button>
		</td>
		</tr>
		</table>	
		<hr color="#decdb9">
		

</form>

</body>
</html>