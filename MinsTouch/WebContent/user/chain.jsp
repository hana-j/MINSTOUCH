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
				
		<!--민스터치 시스템-->		
				<div class="succ2">
					<br>
					<img src="${pageContext.request.contextPath}/img/logo/민스터치로고.png" width="10%" height="10%"><span class="h2color">와 함께해야하는 이유!</span>
					<br><br>
					수 많은 점주님들이 민스터치를 성공파트너로<br>
						선택한 이유를 확인해보세요!
					
				</div>
		<!--민스터치 시스템 이미지-->
			<div class="succ3">
				<img src="${pageContext.request.contextPath}/img/chain/success1.png" width="80%" height="100%">
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


