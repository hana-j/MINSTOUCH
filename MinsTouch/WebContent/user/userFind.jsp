<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 아이디찾기 -->
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
	
	/*메인 */
	#findForm{
		padding-top:50px;
		margin:0 auto;
			
	}
	.wrap{
		width:60%;
		height:80vh;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	.find{
		width:80%;
		height:600px;
		border-radius:10px;
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}
	h2{
		
		color:#5c4738;
		font-size:2em;
	}
	.email{
		margin-top:20px;
		width:80%;
		font-size:1.3em;
	}
	
	.email input{
		width:60%;
		height:50px;
		border-radius:10px;
		margin-top:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.submit{
		margin-top:30px;
		width:80%;
	}
	.submit input{
		width:50%;
		height:40px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
		background:#5c4738;
		color:white;
		font-size:0.8em;
		letter-spacing:2px;
		cursor:pointer;
	}
	.tex{
		
		width:100%;
		color:#a4948a;
		font-size:0.8em;
		margin-top:10px;
	}
	
	
	
	
</style>
</head>
<body>

<main id="findForm">
	<form action ="./userFindAction.usr" method="post">
		<div class="wrap">
			<div class="find">
				<h2>아이디찾기</h2>
				<span class="tex">이메일주소를 입력 해 주세요</span>
				<div class="email">
					<input type="text" name="u_email" id="u_email" placeholder="ex)aaa@aaa.com" required> 
				</div>
				<div class="submit">
					<input type="submit" value="확인">
				</div>
			</div>
		</div>
	</form>
</main>

</body>
</html>