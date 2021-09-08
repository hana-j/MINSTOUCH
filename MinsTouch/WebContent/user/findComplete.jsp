<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32" href="./user_main/민스탭.png">
<link rel="stylesheet" href="./user_main/header1.css">
<title>아이디 찾기</title>
<style>
	*{
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
		box-sizing:border-box;
		color:#5c4738;
	}
	
	#findArea a{
		text-decoration:none;
		color:white;
	}
	#findArea{
		padding-top:50px;
		margin:0 auto;
		
	}
	#findArea .wrap{
		width:70%;
		height:78vh;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	#findArea .wrap .box{
		width:90%;
		height:600px;
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}
	#findArea h3{
		color:#5c4738;
		font-size:1.4em;
	}
	span{
		color:rgba(238, 73, 47, 0.83);
		font-size:1.3em;
	}
	#findArea .btn{
		margin-top:40px;
		width:100%;
		display:flex;
		flex-dirction:row;
		justify-content:space-between;
		align-items:center;
	}
	#findArea .login a{
		padding:14px;
		
		
		border:0;
		outline:none;
		border-radius:12px;
		background:#5c4738;
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
	}
	#findArea .pass a{
		padding:14px;
		
		
		border:0;
		outline:none;
		border-radius:12px;
		background:#5c4738;
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
	}
	
	@media screen and (min-width:1200px){
		#findArea .btn{
			width:45%;
		}
		#findArea .login{
			width:45%;
		}
		#findArea .pass{
			width:55%;
		}
		
	}
</style>
</head>
<body>
<main id="findArea">
	<div class="wrap">
		<div class="box">
			<h3>회원님의 아이디는 <span>${pre_id}</span>입니다.</h3>
			<div class="btn">
				<div class="login"><a href="userLogin.usr">로그인</a></div>
				<div class="pass"><a href="userPwFind.usr">비밀번호 찾기</a></div>
			</div>
		</div>
	</div>	
</main>
</body>
</html>