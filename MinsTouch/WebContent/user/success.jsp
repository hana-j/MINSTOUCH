<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
		*{
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
		
		}
		.a{
		width:"80%";
		height:1000px;
		}
		
		.succ2{
			font-family:"맑은고딕";
			font-size:1em;
			color:#a4948a;
		}
		.h2color{
			font-weight:bold;
			font-family:"맑은고딕";
			font-size:2em;
			color:#5c4738;
		}
		.succ3{
			background-image: url('${pageContext.request.contextPath}/img/user_img/form.png');
			background-size : 100% 75% ;
			color:#a48856;
			width:80%;
			height:100%;
		}
		.succ3 img{
			width:"100%";
			height:"100%";
			
		}
		.text{
			width:80%;
			font-family:"맑은고딕";
			font-size:2em;
			font-weight:bold;
			color:#5c4738;
		}
		.box1 {
  		width:65%;
	    height:20%;
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
		.succ3 table{
			
			width:65%;
		}
		.succ3 td{
			text-align: left;
			height:50px;
			
		}
		
		@media(max-width:767px){
				/*모바일 */
					.a img{
					
					width:90%;
					height:35%;
					
						}
						}
		@media(min-width:777px,max-width:1200px){
				/*테블릿 */
					.a img{
					
					width:90%;
					height:35%;
					
						}
						}
	</style>
</head>


	<body>
	<br><br><br><br>
	<main class="a">
		<!--가맹안내 메인이미지-->
			<img src="${pageContext.request.contextPath}/img/chain/chain.png" width="70%" height="40%">
			<div class="succ1">
					<img src="${pageContext.request.contextPath}/img/chain/hr.png">
				</div>
				
		<!--상담문의 헤드-->		
				<div class="succ2">
					<br>
					<img src="${pageContext.request.contextPath}/img/user_img/check.png" width="10%">
					<br>
					<span class="h2color">가맹문의가 완료되었습니다!</span>
					<br><br>
					빠른시일 내 상담일정에 관해 연락드리겠습니다!<br>
					예비 창업주님의 관심에  감사드립니다!
					
					
				</div>
				<br>
				<br>
				<div>
					<a href="userMain.jsp"><img src="${pageContext.request.contextPath}/img/user_img/gohome.png"></a>
				</div>
			
			<br><br>
		
		
	</body>
	</main>
	</html>


