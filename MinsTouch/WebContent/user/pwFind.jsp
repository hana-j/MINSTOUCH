<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호변경</title>
<style>
	*{
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
		box-sizing:border-box;
		color:#5c4738;
	}
	
	#formArea{
		padding-top:50px;
		margin:0 auto;
		
	}
	#formArea .wrap{
		width:60%;
		height:80vh;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	#formArea .wrap .box{
		width:90%;
		height:600px;
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}
	#formArea h2{
		color:#5c4738;
		font-size:1.8em;
	}
	#formArea h4{
		font-size:1.2em;
	}
	#formArea .id,#formArea .email{
		margin-top:20px;
		width:80%;
	}
	.id input, .email input{
		width:100%;
		height:50px;
		border-radius:10px;
		margin-top:10px;
		padding:0 20px;
		border:1px solid lightgray;
		outline:none;
	}
	#formArea .submit{
		margin-top:50px;
		width:80%;
	}
	.submit input{
		width:60%;
		height:50px;
		border:0;
		outline:none;
		border-radius:10px;
		background:#5c4738;
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
		cursor:pointer;
	}
	
	.h3{
		width:100%;
		color:#a4948a;
		font-size:1em;
		margin-top:10px;
	}
	
</style>
</head>
<body>
<main id="formArea">
	<form action="./findPwMail.usr" name="mail" method="post">
		<div class="wrap">
			<div class="box">
				<h2>비밀번호 변경</h2>
				<a class="h3">비밀번호 변경 페이지 입니다</a>
				<br>
				<table>
					<tr class="id">
						<td width="30%"><h4>아이디 </h4></td>
						<td><input type="text" id="u_id" name="u_id" required></td>
					</tr>
					<tr class="email">
						<td><h4>이메일</h4></td> 
						<td><input type="text" id="u_email" name="u_email" required></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="submit">
						<td colspan="2"><input type="submit" value="비밀번호변경"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</main>
</body>
</html>