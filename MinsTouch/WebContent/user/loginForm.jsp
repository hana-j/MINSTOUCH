<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String cookie="";
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0)
	for(int i = 0;i<cookies.length;i++){
		if(cookies[i].getName().equals("u_id")){
			cookie=cookies[i].getValue();
		}
	}
%>
<!-- 회원 로그인  -->
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
		color:#5c4738;
	}
	

	/*메인부분*/
	a{
		text-decoration:none;
		color:black;
	}
	
	#loginformArea{
		margin:0 auto;
			
	}
	.wrap{
		width:80%;
		height:70vh;
		display:flex;
		algin-items:center;
		justify-content:center;
		
	}
	.login{
		width:100%;
		height:70vh;
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:row;
	}
	h2{
		color:#5c4738;
		font-size:2em;
	}
	.login_id{
		margin-top:20px;
		width:100%;
		font-size:1.1em;
	}
	.login_id input{
		width: 100%;
		height:50px;
		border-radius:10px;
		margin-top:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
		margin-bottom:10px;
	}
	.login_pw{
		margin-top:20px;
		width:100%;
		font-size:1.1em;
	}
	.login_pw input{
		width:100%;
		height:50px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
		margin-bottom:20px;
	}
	.login_etc{
		width:100%;
		font-size:1em;
		flex-direction:row;
		font-weight:bold;
		float:center;
	}
	.login_etc label{
		cursor:pointer;
	}
	.submit{
		margin-top:50px;
		width:80%;
	}
	
	.submit input{
		width:50%;
		height:50px;
		border:0;
		outline:none;
		border-radius:10px;
		background:#5c4738;
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
		cursor:pointer
	}
	.event_img{
		width:100%;
		margin-top:80px;
	}
	.customer {
		display: inline-block;
		position: relative;	
	}
	.h3{
		width:100%;
		color:#a4948a;
		font-size:1em;
		margin-top:10px;
	}
	#event{
		display:none;
	}
	@media screen and (min-width:1000px){
		#event{
		display:block;
		}
	}
	
	
	
</style>
</head>
<body>

<main id="loginformArea">
<form name="loginform" action="userLoginAction.usr" method="post">
<input type="hidden" name="u_grade"/>
<br><br><br>
<img src="${pageContext.request.contextPath}/img/user_img/login.png" width="70%" height="16%">
			<div class="succ1">
					<img src="${pageContext.request.contextPath}/img/chain/hr.png" width="80%">
				</div>
<div class="wrap">

	<div class="login">
			<div><a href="#"><img src="${pageContext.request.contextPath}/img/sec_img/login_event.png" width="120%" height="600px" id="event"></a></div>
			<table style="width:100%">
				<tr>
					<td style="width:50%" ><h2>로그인<img src="${pageContext.request.contextPath}/img/user_img/hbg.png" width="3%"></h2>
						<a class="h3">세상에서 제일 맛있는 버거! 민스터치에 오신 걸 환영합니다!</a>
						<br><br>
					<table>
						<tr class="login_id">
							<td><h4>아이디  </h4></td>
							<td><input type="text" value="<%=cookie%>" name="u_id" id="u_id" placeholder="이이디입력(필수)"/></td>
						</tr>
						
						<tr class="login_pw">
							<td><h4>비밀번호</h4></td>
							<td><input type="password" name="u_password" id="u_password" placeholder="비밀번호입력(필수)"/></td>
						</tr>
						<tr class="login_etc">
							<td class="checkbox"><label><input type="checkbox" type="submit" name="remember" >&nbsp;아이디저장</label></td>
							<td class="find"><a href="userFindForm.usr">아이디 찾기</a></td>
						</tr>
						
					</table>
						<div>
							<div><label style="cursor:pointer;"></label></div> 
							 <div></div>
						</div>
						
					
					<div class="submit">
						<input type="submit" value="로그인">
					</div></td>
						</tr>
			</table>	
    </div>
</div>
</form>
<br>
<br>

<!--움직이는 이벤트 배너-->
<div class="sec5">
	<img src="${pageContext.request.contextPath}/img/sec_img/sec5.gif" width="100%"/>
</div>
<!--가맹점 점주모집-->
<img src="${pageContext.request.contextPath}/img/sec_img/sec4.png" width="100%">
<!--민스버거 홍보이미지-->
<img src="${pageContext.request.contextPath}/img/sec_img/sec3.png" width="100%">
<!--가까운 민스터치매장 및 앱 주문가능 이미지-->
<img src="${pageContext.request.contextPath}/img/sec_img/sec2.png" width="100%">
</main>
</body>
</html>