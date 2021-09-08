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
		<span class="font">개인정보 처리방침</span>
		<br><br><br>
		<div class="box1">
<b>제 1 조 약관의 승낙</b>
<br>㈜민스터치앤컴퍼니(이하 '당사')는 귀하가 본 약정(이하 '본 약관') 내용에 동의하는 것을 조건으로 귀하에게 본 서비스를 제공할 것이며, 귀하가 본 약관의 내용에 동의하는 경우 당사의 본 서비스 제공 행위 및 귀하의 본 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다.
본 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법, 정보통신 윤리위원회 심의규정, 정보통신 윤리강령, 프로그램 보호법 및 관계규정에 의합니다.
<br><br>
<b>제 2 조 사용자의 의무</b>
<br>회원 가입시에 요구되는 귀하에 대한 정보는 진실하고, 정확하여야 합니다. 또한, 귀하는 이미 제공된 귀하에 대한 정보가 진실하고, 정확한 정보가 되도록 유지, 갱신하여야 합니다.

제 3 조 사용자의 행동규범
(1) 귀하가 제공하는 정보의 내용이 허위(차명, 비실명 등)인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 당사는 귀하의 본 서비스 사용을 일부 또는 전부 중지할 수 있습니다.
(2) 귀하가 본 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 기타 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 귀하가 모든 책임을 부담하며 당사는 어떠한 책임도 부담하지 아니합니다.
(3) 당사는 당사가 제공한 서비스가 아닌 가입자 또는 기타 제휴사가 제공하는 서비스의 내용상의 정확성, 완전성 및 질에 대하여 보장하지 않습니다. 따라서 당사는 귀하가 위 내용을 이용함으로 인하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.
(4) 귀하는 본 서비스를 통하여 다음과 같은 행동을 하지 않는데 동의합니다.
가. 타인의 ID와 Password, 주민번호를 도용하는 행위
나. 저속, 음란, 모욕적, 위협적이거나 타인의 프라이버시를 침해할 수 있는 내용을 전송, 게시, 게재, 전자 메일 또는 기타의 방법으로 전송하는 행위
		</div>
	</main>	
</body>
</html>