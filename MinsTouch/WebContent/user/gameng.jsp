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
		.succ1{
		
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
		.text{
			width:80%;
			font-family:"맑은고딕";
			font-size:2em;
			font-weight:bold;
			color:#5c4738;
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
			<img src="${pageContext.request.contextPath}/img/chain/chain.png" width="80%" height="40%">
			<div class="succ1">
					<img src="${pageContext.request.contextPath}/img/chain/hr.png">
				</div>
				
		<!--개설절차 폰트-->		
				<div class="succ2">
					<br>
					<span class="h2color">개설절차</span>
					<br><br>
					많은 분들이 민스터치와 함께 성공을 만들어가고 있습니다.
					
					
				</div>
		<!--민스터치 개설절차 이미지-->
			<div class="succ3">
				<img src="${pageContext.request.contextPath}/img/chain/gameng1.jpg" width="70%" height="100%">
			</div>
			<br><br>
		<!--민스터치 인테리어 이미지-->
			<div>
				<img src="${pageContext.request.contextPath}/img/chain/gameng2.png" width="65%" height="100%">
			</div>
			<br><br>
			<div>
				<img src="${pageContext.request.contextPath}/img/chain/gameng4.png" width="60%" height="100%">
			</div>
			<div class="text">
			<br>
			
			<img src="${pageContext.request.contextPath}/img/logo/민스터치로고.png" width="20% height="10%">
			<br><br>
			
			민스터치는 가맹점주님들의 성공의 길로 이끌겠습니다!</div>
			<br><br>
			<img src="${pageContext.request.contextPath}/img/chain/success.jpg" width="80%" height="45%">
			<br><br>
			<img src="${pageContext.request.contextPath}/img/chain/call.png" width="40%" height="15%">
		<br><br><br><br><br><br>
		
		
	</body>
</main>
	</html>


