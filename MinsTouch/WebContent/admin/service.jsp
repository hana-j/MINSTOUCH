<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>
<style>
	
	.box{width:80%; height:60vh;}
	.box img{width:80%;}
	
	@media screen and (min-width:880px){
		.box{margin-top:2%;}
		body{height:80vh;}
	}
</style>
</head>
<body>
<div class="box">
	<div><img src="${pageContext.request.contextPath}/img/user_img/service.png" width="80%"></div>
	<div><img src="${pageContext.request.contextPath}/img/sec_img/hr.png" width="80%"></div>
	<div class="c"><img src="${pageContext.request.contextPath}/img/user_img/center.png" width="80%"></div>
</div>
</body>
</html>