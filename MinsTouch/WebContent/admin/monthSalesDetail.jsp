<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 일매출 조회 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/user_img/민스탭.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/main.css" >
<title>MIN'S TOUCH 관리자</title>
</head>
<style>
	*{
		font-family: 'Montserrat';
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
		box-sizing:border-box;
	}
	header{
		width:100%;
		height:100px;
		background-color:rgba(81, 61, 61, 1);
	}
	#view{
		padding-top:40px;
		margin:0 auto;
		background-color:white;
	}
	.wrap{
		
		width:70%;
		height:50vh;
		display:flex;
		align-items:center;
		justify-content:center;
		flex-direction:column;
	}
	h2{
		color:rgba(234, 70, 11, 1);
		font-size:2em;
	}
	.m{
		width:80%;
		height:100px;
		border-radius:5px;
		margin-top:10px;
	}
	h3{
		font-size:1.6em;
	}
</style>
<body>
<header>
	<div class="navbar__logo">
             <a href="#"><img src="${pageContext.request.contextPath}/img/logo/민스터치로고.png" width="40%"></a>
        </div>
</header>
<main id="view">
<div class="wrap">
	<h2>${month}월 매출</h2>
	<div class="m"><h3>총 금액 : ${monthMoney}</h3></div>
</div>
</main>
<footer>
		<br>
        <div class="inner">
        	<nav class="etc" >
                <ul>
                  	<li><a href="#">이용약관 &nbsp;&nbsp;</a></li>
                    <li><a href="#">개인정보처리방침 &nbsp;&nbsp;</a></li>
                    <li><a href="#">이메일 무단 수집거부</a></li>
                </ul>
        	</nav>
		</div>	
			
		<img src="${pageContext.request.contextPath}/img/footer_img/footer.png" width="100%">
			<div>
				<a href="#"><img src="${pageContext.request.contextPath}/img/footer_img/ins.png"></a>
				<a href="#"><img src="${pageContext.request.contextPath}/img/footer_img/face.png"></a>
				<a href="#"><img src="${pageContext.request.contextPath}/img/footer_img/you.png"></a>
			</div>
		<img src="${pageContext.request.contextPath}/img/footer_img/footer2.png" width="100%">
</footer>
</body>
</html>