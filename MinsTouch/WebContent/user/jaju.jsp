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
		
		.container{
			width: 60%;
			color:#5c4738;
			padding: 0 40px;
		
		}
		.container img{
			float:left;
		}
		input[id*="answer"]{
			display:none;
		}
		input[id*="answer"] + label {
			font-size:1.5em;
			display:flex;
			line-height :4em;
			justify-content : space-between;
			position: relative;
			border-bottom: 1px solid #d5d5d5;
			cursor:pointer;
		}
		input[id*="answer"] + label i{
		position: absolute;
		top: 50%;
		right: 0;
		transform: translateY(-50%);
		transition: all .3s;
		}
		input[id*="answer"] +label +div {
		overflow: hidden;
		height: 0;
		display:flex;
		align-items: center;
		transition: all .3s;
		}
		input[id*="answer"]+ label +div p{
		display: inline-block;
		padding: 20px 0;
		}
		input[id*="answer"]:checked +label +div{
		height: 150px;
		border-bottom: 2px solid #d5d5d5;
		
		}
		input[id*="answer"]:checked + label i{
		transform: rotate(180deg);
		}
		.left{
			text-align: left;
			width:90%;
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
			<img src="${pageContext.request.contextPath}/img/user_img/customer.png" width="80%" height="40%">
			<div class="succ1">
					<img src="${pageContext.request.contextPath}/img/chain/hr.png">
				</div>
				
		<!--개설절차 폰트-->		
				<div class="succ2">
					<br>
					<span class="h2color">자주하는 질문</span>
					<br><br>
					민스터치에 궁금한 사항을 확인해보세요
					
					
				</div>
				<br>
				<hr color="#5c4738" width="60%">
				
		<!--민스터치 개설관련 질문 -->
			<div class="container">
					<input type="radio" name="accordion" id="answer1">
					<label for="answer1">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">신제품의 개발은 어떻게 하나요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>10여년의 패스트푸드 운영 Know-how를 바탕으로 메뉴의 Bank화를 수립하고
							고객 미각의 변화에 따른 신중한 신제품 Launching을 준비하고,
							항상 새로운 Seasoning개발로 인한 원료육의 차별화로
							운영의 편리와 고객의 만족을 위해 앞장서고 있습니다.</p>
					</div>	
					
					<input type="radio" name="accordion" id="answer2">
					<label for="answer2">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">계약 후 매장오픈은 얼마나 걸리나요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>매장형태에 따라 다소 차이는 있으나, 점포선정 후 오픈까지 약 60일 (공사기간 30일) 이 소요됩니다</p>
					</div>	
					
					
					<input type="radio" name="accordion" id="answer3">
					<label for="answer3">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">투자비용은 얼마나 드나요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>민스터치의 카페형 매장은 상권의 정도에 따라 매장의 규모를 달리 할 수 있으며 실평수 66㎡(20평) 이상의 매장이 개설되고 있습니다.<br>
							66㎡(20평) 기준으로 투자내역은 가맹비, 계약이행보증금, 기기설비, 주방장비, 인테리어 등에 투자되는 비용은 약 1억 4,800만원 입니다.<br><br>
							 
							해당 투자비용은 매장의 조건에 따라 다소 차이가 발생할 수 있습니다.</p>
					</div>	
					
					
					<input type="radio" name="accordion" id="answer4">
					<label for="answer4">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">본사의 지원사항은 어떤것이 있나요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>계약부터 오픈까지 개발팀요원이 one stop 서비스로 가맹점주님의 업무를 지원할 것입니다.<br>
							<br>
							점포의 유무에 따른 개발요원의 점포입지 선정 및 상권분석에서부터 교육, 인테리어, 설비 시공등의 매장 오픈전 일체의 업무진행에 대하여 업무를 지원하고 있으며, 특히 교육은 4일간 본사 및 교육매장에서 실시되며 제조 및 운영 매뉴얼에 의한 체계화된 교육을 통해 현장에서의 어려움을 최소화 시키고, 매장 오픈시 3일간의 실매장의 SOM 운영인원지원을 통해 영업 컨설팅을 지원하고 있습니다.
							<br>
							가맹점 오픈 후 지속적인 수퍼바이져의 영업 컨설팅을 통해 품질 및 서비스 교육을 통한 안정적인 매출을 유도해 상권내 진입을 꾀하고 있으며, 본사의 매뉴얼 준수 및 매출실적에 따른 다양한 지원정책을 시행하고 있습니다.</p>
												</div>	
					
					
					<input type="radio" name="accordion" id="answer5">
					<label for="answer5">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">매장영업을 위한 교육에는 어떤것들이 있나요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>
						가맹 후보자님의 본계약이 체결된 후, 기타 매장이 영업을 하기 위한 준비 작업을 슈퍼바이져의 지도아래
						진행하며 매장의 공사기간 중 직영매장 및 기타 본사가 지정한 교육 매장에서 4일간 제조, 운영에 대한
						교육과 실매장에서 3일간 실무교육을 진행합니다.<br>
						<br>
						
						체계적인 제조, 운영 매뉴얼을 기초로한 상세 교육으로 초보자도 쉽게 Know – How를 습득할 수 있으며,
						원·부재료가 반가공되어 쉽게 제조할 수 있는 상태로 입고되기 때문에 운영의 큰 어려움이 없습니다.</p>
					</div>	
					
					<input type="radio" name="accordion" id="answer6">
					<label for="answer6">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">민스터치의 경쟁력은 무엇인가요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>민스터치는 높은 품질의 원재료 사용 및
							품질대비 저렴한 가격대<br>
							치킨, 버거, 음료의 트랜디한 다양한 메뉴
							주문 즉시 제조하는 볼륨 가득한 수제버거,
							고객의 높은 재방문율
							깔끔하고 트렌디한 인테리어 입니다.</p>
					</div>	
					
					
					<input type="radio" name="accordion" id="answer7">
					<label for="answer7">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">민스터치의 주 고객층은 어떻게 되나요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>중, 고, 대학생의 한끼 식사로도 대체 가능한 영양간식 수제버거이기 때문에

						20대~30대가 편하게 즐길 수 있으며 또한 다양한 음료 및
						
						엄마, 아빠가 좋아하는 치킨메뉴도 있어 전연령이 즐길 수 있습니다.</p>
					</div>	
					
					
					<input type="radio" name="accordion" id="answer8">
					<label for="answer8">
						<table width="100%"><tr>
						<td><img src="${pageContext.request.contextPath}/img/user_img/qmark.png" width="50%" height="5%"></td><td width="90%"  class="left">주문 및 배송은 어떻게 하나요?</td>
						</tr></table>
						<i class="fas fa-angle-down"></i>
					</label>	
					<div>
						<p>민스터치의 주문은 온라인 상에서 주문전용 홈페이지를 이용합니다.<br>
							<br>

							원료의 신선도를 유지하기 위해 매장에서 2일전 주문을 시행하고 있으며,<br>
							상온, 냉장, 냉동에 이르기까지 300여가지의 다양한 품목을 구비하여
							매장에서 원스톱으로 편리하게 이용하실 수 있습니다.<br><br>
							
							
							민스터치의 배송시스템은 신선물류 시스템을 상용하고 있으며

								상온, 냉장, 냉동 품목을 분리 탑재하여 신선도를 유지 공급하고 있습니다</p>
					</div>	
					
					
					
					
					
				
					</label>	
			
		
		<br><br><br><br><br><br>
		
		
	</body>
</main>
	</html>


