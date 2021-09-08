<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 회원가입 -->
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
	
	/*메인 부분*/
	#joinformArea{
		margin:0 auto;
	}
	.wrap{
		width:70%;
		height:140vh;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	.join{
		width:80%;
		height:140vh;
		border-radius:10px;
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}
	
	h3{
		width:100%;
		color:#5c4738;
		font-size:1.5em;
	}
	.id{
		margin-top:20px;
		width:80%;
		font-size:1.1em;
	}
	.id #u_id{
		width:100%;
		height:40px;
		border-radius:10px;
		margin-top:10px;
		margin-right:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.id #u_idck{
		width:150px;
		height:30px;
		padding:0px 20px;
		margin-top:5px;
		border:1px solid lightgray;
		border-ragius:5px;
		background-color:#5c4738;
		color:white;
		cursor:pointer;
	}
	.pass{
		margin-top:20px;
		width:80%;
		font-size:1.1em;
	}
	.pass input{
		width:100%;
		height:40px;
		margin-top:10px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.name{
		margin-top:20px;
		width:80%;
		font-size:1.1em;
	}
	.name input{
		width:100%;
		height:40px;
		margin-top:10px;
		border-radius:10px;
		padding:0 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.email{
		margin-top:20px;
		width:80%;
		font-size:1.1em;
	}
	.email input{
		width:100%;
		height:40px;
		margin-top:10px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.phone{
		margin-top:20px;
		width:80%;
		font-size:1.1em;
	}
	.phone input{
		width:100%;
		height:40px;
		margin-top:10px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.addr{
		margin-top:20px;
		width:80%;
		font-size:1.1em;
	}
	.addr #zip{
		width:100%;
		height:40px;
		margin-top:10px;
		border-radius:10px;
		padding:0 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.addr #address1{
		width:100%;
		height:40px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
		margin-top:10px;
	}
	.addr #find_zip{
		width:150px;
		height:30px;
		padding:0px 20px;
		margin-top:5px;
		border:1px solid lightgray;
		border-ragius:5px;
		background-color:#5c4738;
		cursor:pointer;
		color:white;
	}
	.addr #address2{
		width:100%;
		height:40px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
		margin-top:10px;
	}
	.submit{
		margin-top:50px;
		width:80%;
	}
	.submit input{
		width:100%;
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
	
	.customer {
		display: inline-block;
		position: relative;	
	}
	@media screen and (min-width:1100px){
		.wrap{
		width:40%;
		height:120vh;
		display:flex;
		algin-items:center;
		justify-content:center;
		}
		.submit input{
			width:60%;
		}
	}
	
</style>
<!-- 아이디 중복화인 창 열기  -->
<script>
var chkId = false;
var idcheck;
function chkForm(f){
	alert(chkId);
	if(!chkId||idcheck!=f.u_id.value.trim()){
		alert("아이디 중복을 확인하세요 !");
		return false;
	}
}
</script>

<!-- 다음API 적용부분 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address1").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address2").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<!-- 유효성 검사-->
<script>
function check(){
	var email = document.f.u_email.value.trim();
	var reg_mail=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(document.f.u_id.value.length<8|| document.f.u_id.value.lenth>12){
		alert("ID는 8~12자 이내로 입력해주세요.");
		document.f.u_id.select();
		return false;
		
	}
	else if(document.f.u_password.value.length<8|| document.f.u_id.value.lenth>12){
		alert("Password는 8~12자 이내로 입력해주세요.");
		document.f.u_password.select();
		return false;
		
	}else if(reg_mail.test(email)==false){
		alert('이메일 형식이 올바르지 않습니다.');
		document.f.u_email.focus();
		return false;
	}
	/*정규표현식*/
	else if(!/^\d{3}\d{3,4}\d{4}$/.test(document.f.u_call.value)){
		alert('숫자만 입력해주세요');
		document.f.u_call.focus();
		return false;
	}
	else if(document.f.address2.value.trim()==''){
		alert("상세주소를 입력 해 주세요.");
		document.f.address2.focus();
		return false;
		
	}else if(document.f.u_email.value.trim()==''){
		alert("이메일을 입력해 주세요.");
		document.f.u_email.focus();
		return false;
	}
	document.f.submit();       
}
		
	
</script>
</head>
<body>

<main id ="joinformArea">
	<br><br><br>
	<img src="${pageContext.request.contextPath}/img/user_img/join.png" width="70%" height="16%">
			<div class="succ1">
				<img src="${pageContext.request.contextPath}/img/chain/hr.png" width="80%">
			</div>
	<form  action="./userJoinAction.usr" method="post" name="f" onsubmit="return check();">
	<div class="wrap">
		<div class="join">
			<div class="grade">
				<h3>기본등급은 Family 입니다.</h3><input type="hidden" name="u_grade" id="u_grade" value="Family"/>
			</div>
			<div class="id">
				<p>아이디</p>
				<input type="text" name="u_id" id="u_id"  required placeholder="8-12자 영문과 숫자조합을 입력하세요."/>
				<input type="button" name="u_idck" id="u_idck" value="아이디 중복확인 "  onclick="window.open('common/idCheck.jsp?openInit=true','','width=500, height=300')"/>
			</div>
			<div class="pass">
				<p>비밀번호</p>
				<input type="password" name="u_password" id="u_password" required placeholder="8-12자 영문과 숫자조합을 입력하세요."/>
			</div>
			<div class="name">
				<p>이름</p>
				<input type="text" name="u_name" id="u_name" required/>
			</div>
			<div class="email">
				<p>이메일</p>
				<input type="text" name="u_email" id="u_email" placeholder="ex)aaa@naver.com" required />
			</div>
			<div class="phone">
				<p>휴대전화</p>
				<input type="text" name="u_call" id="u_call" required placeholder="(-)없이 숫자만 입력하세요.">
			</div>
			<div class="addr">
				<p>주소</p>
				<input type="text" id="zip" name="zip" placeholder="우편번호" required="required">
				<input type="button" onclick="findAddr()" value="우편번호 찾기" id="find_zip"><br>
				<input type="text" id="address1" name="address1"placeholder="주소"><br>
				<input type="text" id="address2" name="address2" placeholder="상세주소">
						
				<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
			</div>
			<div class="submit">
				<input type="button" value="가입하기"  onclick="check();" />
			</div>
		</div>
	</div>
	</form>
</main>

</body>
</html>