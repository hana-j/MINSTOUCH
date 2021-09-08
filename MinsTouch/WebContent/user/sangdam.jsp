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
		height:1800px;
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
			<img src="${pageContext.request.contextPath}/img/chain/chain.png" width="70%" height="16%">
			<div class="succ1">
					<img src="${pageContext.request.contextPath}/img/chain/hr.png">
				</div>
				
		<!--상담문의 헤드-->		
				<div class="succ2">
					<br>
					<span class="h2color">상담문의</span>
					<br><br>
					지역별 개설문의 등 가맹에 대한 온라인 상담입니다.
					
					
				</div>
		<!--민스터치 온라인상담 폼-->
			<div class="succ3">
			<br><br><br><br>
			<table class="sangdam">
			<br>
			*는 필수 입력 항목입니다.
			<br>문의 내용을 자세히 기입해 주실수록 상담에 도움이 됩니다. 
			<br><br><br><br><br>
				<tr>
					<td class="sangdamf"><b>성명</b>*</td>
					<td><input type="text" name="name" id="name"/></td>
				</tr>
				<tr>
				<tr>
					<td class="sangdamf"><b>이메일*</b></td>
					<td>
						<input type="text" name="emailid" id="emailid"/>@<select name="email">
	    				<option value="">이메일선택</option>
					    <option value="gmail">gmail.com</option>
					    <option value="naver">naver.com</option>
					    <option value="daum">daum.net</option>
					    <option value="hanmail">hanmail.net</option>
					    <option value="nate">nate.com</option>
					    <option value="yahoo">yahoo.co.kr</option>
					    <option value="paran">paran.com</option>
					    <option value="freechal">freechal.com</option>
					    <option value="lycos">lycos.com</option>
					    <option value="korea">korea.com</option>
					    <option value="dreamwiz">dreamwiz.com</option>
					    <option value="hanafos">hanafos.com</option>
					    <option value="hanmir">hanmir.com</option>
					    <option value="msn">msn.com</option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의사항에 대한 답변은 메일로 발송됩니다. 정확한 이메일 주소를 입력해주세요!</td>
				</tr>
				<tr>
					<td class="sangdamf"><b>연락처</b>*</td>
					<td><input type="text" name="tel1" id="tel1">-<input type="text" name="tel2" id="tel2">-<input type="text" name="tel3" id="tel3">
					</td>
				
				</tr>
				<tr>
					<td class="sangdamf"><b>희망지역</b>*</td>
					<td>
						<select name="city">
	    				<option value="">지역선택</option>
					    <option value="kangwon">강원도</option>
					    <option value="kyungki">경기도</option>
					    <option value="gyungsangbukdo">경상북도</option>
					    <option value="gyungsangnamdo">경상남도</option>
					    <option value="gwangju">광주광역시</option>
					    <option value="daegu">대구광역시</option>
					    <option value="daejeon">대전광역시</option>
					    <option value="pusan">부산광역시</option>
					    <option value="seoul">서울특별시</option>
					    <option value="sejong">세종특별자치시</option>
					    <option value="ulsan">울산광역시</option>
					    <option value="incheon">인천광역시</option>
					    <option value="jullanamdo">전라남도</option>
					    <option value="jullabukdo">전라북도</option>
					    <option value="jeju">제주특별자치도</option>
					    <option value="chungcheongnamdo">충청남도</option>
					    <option value="chungcheongbukdo">충청북도</option>					
					</select></td>
				</tr>
			
				<tr>
					<td class="sangdamf"><b>점포 소유 여부</b>*</td>
					<td>
					<input type="radio" name="chk_jumpo" value="jumpoyes">소유
					<input type="radio" name="chk_jumpo" value="jumpono">미소유</td>
					<br>
				</tr>
					<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
			
					<td class="sangdamf"><b>내용</b>*</td>
					<td><input type="text" placeholder="자세히 기입해주시면 상담하는데 많은 도움이 됩니다!" style="width:90%;height:150%;font-size:5px;"></td>
				</tr>
				</table>
				<br><br><br><br>
				<div class="box1">
					개인정보취급 방침*
					<br>
					'㈜민스터치앤컴퍼니'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, '정보통신망 이용촉진 및 정보보호'에 관한 법률을준수하고 있습니다.
					<br><br>
					회사는 개인정보취급방침을 통하여 고객님께서 제공하시는개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.
					회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여공지할 것입니다.
					<br><br>
					ο 본 방침 시행일 : 2017 년 02 월 10 일<br>
					ο 본 방침 개정일 : 2017 년 02 월 10 일<br>
					<br>
					■ 수집하는 개인정보 항목<br>
					ο 수집항목<br>
					1) 회원정보 : 이름 , 이메일 ,휴대폰 전화번호,주소정보<br>
					2) 고객문의 : 이름, 이메일, 휴대전화번호,주소정보 (내용변경)<br>
					3) 비회원 주문정보 : 이름 , 휴대폰 전화번호 , 주소정보<br>
					<br><br>
					■ 개인정보 수집방법<br>
					ο 개인정보 수집방법 : 온라인/모바일 홈페이지 및 맘스터치 앱<br>
					<br>
					■ 개인정보의 수집 및 이용목적<br>
					회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
					ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 <br>
					ο 회원 관리<br>
					회원제 서비스 이용에 따른 본인확인, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달<br>
					ο 마케팅 및 광고에 활용<br>
					신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달<br>
					<br>
					■ 개인정보의 제 3자 제공<br>
					딜리버리 주문품의 배달서비스를 위해 가맹점주 및 배달대행 업체에게 개인정보 (배달주소지/연락처)가 제공될 수 있습니다.<br>
					[개인정보를 제공받는자] 가맹점주/ 배달대행업체<br>
					[개인정보 이용목적] 딜리버리 배달서비스<br>
					[개인정보 제공항목] 연락처, 주소지<br>
					<br>
					■ 개인정보의 보유 및 파기<br>
					이용자로부터 제공된 모든 정보는 보관 목적 또는 관련법의 준수 목적 이외의 용도로 사용되는 것이 금지되며, 개인정보 수집 및 이용목적이 달성된 후에는예외 없이 해당 정보를 지체 없이 파기합니다.<br>
					그러나, 이용자가 개인정보 파기를 요청하는 경우, 관련 법률이 그러한 정보를 보유할 것을 요구하는 일정 기간이 파기 요청 시점보다 뒤에 종료하는 경우가 아닌 한, 해당 요청이 접수된 즉시 이용자의 정보는 일체파기되며 어떠한 보관 정보도 남지 않으며, 파기 절차 및 방법은 다음과 같습니다.
					<br><br>
					가. 보유 및 이용기간<br>
					1) 회원가입/등록/조회<br>
					- 보유항목 : 이름, 생년월일, 성별, 이메일, 비밀번호, 배달 주소, 휴대전화번호,, 뉴스레터 수신여부<br>
					- 보유기간 : 온라인 홈페이지 및 모바일 홈페이지 탈퇴 시 24시간 이내 삭제<br>
					- 보유이유 : 배달 정보 조회를 위한 정보 조회<br>
					- 보유항목 : 접속 로그, 접속 IP 정보 (내용 변경)<br>
					- 보유기간 : 3년<br>
					- 보유이유 : 사용자의 서비스 이용 통계 수집<br>
					2) 고객문의<br>
					- 보유항목 : 이름, 이메일, 휴대전화번호<br>
					- 보유기간 : 1년<br>
					- 보유이유 : 사용자 문의/요청 관리, 사용자 식별 등<br>
					- 보유항목 : 접속 로그, 접속 IP 정보<br>
					- 보유기간 : 3년<br>
					- 보유이유 : 사용자의 서비스 이용 통계 수집<br>
					3) 개인 정보 취급 위탁에 대한 안내 (추가) 회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.<br>
					수탁업체 위탁업무내용 개인정보의 보유 및 이용기간<br>
					㈜씨엔티테크 콜센터 위탁업무<br>
					정보안내 및 대응업무 위탁계약 종료시까지<br>
					<br>
					나. 파기절차<br>
					회원님이 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유 되어지는 이외의 다른 목적으로 이용되지 않습니다.
					<br><br>
					다. 파기방법<br>
					전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br>
					<br>
					쿠키(Cookie) (추가)<br>
					- 회사는 웹사이트에서 고객의 정보를 수시로 저장하고 찾아내는 개인정보 자동수집 장치인 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 회사 웹사이트를 운영하는데 이용되는 서버가 고객의 브라우저에 보내는 아주 작은텍스트 파일로서 고객의 컴퓨터 하드디스크에 저장됩니다.<br>
					- 고객은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 고객은 사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.<br>
					개인정보보호 관련 불만이나 질의 사항 문의<br>
					- 회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보관리책임자를 지정하고 있습니다. 고객은 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을개인정보관리책임자에게 신고하실 수 있습니다. 회사는 고객의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br>
					- 개인정보보호 담당자: 송 영<br>
					- 소속: 영남민스터치앤컴퍼니<br>
					- 직위: 이사<br>
					- 전화번호: 1661-4205<br>
					- 이메일: it@minstouch.co.kr<br>
					- 이름: 송 영<br>
					- 소속: 제이에스피실<br>
					- 직위: 티쳐<br>
					- 전화번호: 02-6933-7149<br>
					- 이메일: youngnam@minstouch.co.kr<br>
					신고나 상담 기관<br>
					기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br>
					- 개인정보침해신고센터 (www.118.or.kr / 118)<br>
					- 정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)<br>
					- 대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000)<br>
					- 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330) <br>
	
  				</div>
  				<br>
  				<div>
  					개인정보의 수집 및 이용에 관한 사항에 동의하십니까?
  				</div>
  				<div>
  					<input type="radio" name="chk_agree" value="agree">동의합니다.&nbsp;&nbsp;
					<input type="radio" name="chk_agree" value="disagree">동의하지않습니다.
  				</div>
  				<div>
  				<br><br>
  				<a href="${pageContext.request.contextPath}/success.usr"><img src="${pageContext.request.contextPath}/img/user_img/ok.png" width="10%" height="15%"></a>
  				</div>
  				</div>
				
			
			<br><br>
		
		
	</body>
	</main>
	</html>


