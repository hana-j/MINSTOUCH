<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String cookie="";
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0)
	for(int i = 0;i<cookies.length;i++){
		if(cookies[i].getName().equals("u_id")){
			cookie=cookies[i].getValue();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>MIN'S TOUCH 관리자</title>
</head>
<style>
	form{
		width:100%;
		height:100vh;
	}
	h2{
		color:rgba(234, 70, 11, 1);
		font-size:2em;
	}
	.id, .pass {
		margin-top:20px;
		width:80%;
	}
	.id input, .pass input{
		width:100%;
		height:50px;
		border-radius:10px;
		margin-top:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.login_etc{
		display:flex;
		padding:10px;
		width:100%;
		font-size:14px;
		flex-direction:row;
		justify-content: space-between;
		align-items:center;
		font-weight:bold;
		float:center;
	}
	.login_etc a{
		color:black;
	}
	.submit{
		margin-top:30px;
		width:80%;
	}
	.submit input{
		width:100%;
		height:50px;
		border:0;
		outline:none;
		border-radius:10px;
		background:rgba(238, 73, 47, 0.83);
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
		cursor:pointer;
	}
	@media screen and (min-width:1200px){
		.wrap{
		width:40%;
		height:80vh;
		display:flex;
		algin-items:center;
		justify-content:center;
		}
	}
</style>
<body>
<main id="mainForm">
<form action="./adminLoginAction.adm" method="post">
	<div class="wrap">
		<div class="box">
			<h2>관리자 로그인</h2>
			<div class=id>
				<h3>아이디</h3> 
				<input type="text" value="<%=cookie%>" name="u_id" id="u_id" required>
			</div>
			<div class="pass">
				<h3>비밀번호</h3>
				<input type="password" name="u_password" id="u_password" required>
			</div>
			<div class="login_etc">
					<div class="checkbox"><label style="cursor:pointer;"><input type="checkbox" type="submit" name="remember" >&nbsp;아이디저장</label></div> 
					 <div class="find"><a href="userFindForm.usr">아이디 찾기</a></div>
				</div>
			<div class="submit">
				<input type="submit" value="로그인"/>
			</div>
		</div>
	</div>
</form>
</main>
</body>

</html>