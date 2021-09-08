<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 이용약관 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32" href="./user_main/민스탭.png">
<link rel="stylesheet" href="./user_main/header1.css">
<title>MIN'S TOUCH</title>
<style>
	*{
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
		box-sizing:border-box;
	}
	#teamsOfService{
		margin-top:120px;
		margin-bottom:50px;
		width:100%;
		height:600px;
	}

	/*메인 부분*/
	
	.box1 {
  		width:65%;
	    height:80%;
	    overflow:auto;  
	    border:1px solid #efede6;
	    padding: 0 0.5em;
	    background-color: #f9f8f6;
	    color:#92816d;
	    border-radius: 10px;
	    text-align:left;
	
	webkit-scrollbar{width: 20px;}

::webkit-scrollbar-track {background-color:#f9f8f6;}

::webkit-scrollbar-thumb {background-color:black;border-radius: 6px;}

::-webkit-scrollbar-thumb:hover {background: black;}

::webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {

width:20px;height:6px;background:#f9f8f6;} 
}
	
	.font{
		font-size: 2em;
		font-family: "맑은고딕";
		color:#4f382a;
	}
	
	

	@media screen and (min-width:1200px){
		.wrap{
		width:40%;
		height:100vh;
		display:flex;
		algin-items:center;
		justify-content:center;
		}
	}
	
</style>

</head>
<body>

<!-- 섹션부분 -->	
	<br><br>
	<main id ="teamsOfService">
		<span class="font">이메일 무단수집거부</span>
		<br><br><br>
		<div class="box1">
			
본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,
<br>이를 위반 시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.
		</div>
	</main>	
</body>
</html>