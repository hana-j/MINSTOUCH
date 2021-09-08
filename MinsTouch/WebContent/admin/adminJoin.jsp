<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>MINS'S TOUCH관리자</title>
<style>
	
	.wrap{
		height:100%;
	}
	h2{
		color:rgba(234, 70, 11, 1);
		font-size:1.8em;
	}
	h4{
		font-size:1.2em;
	}
	.id, .pass, .email, .name, .call, .addr{
		margin-top:20px;
		width:80%;
		font-size:1.1em;
	}
	.id #u_id, .pass input, .email input, .name input, .call input{
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
		background-color:rgba(223, 142, 1, 1);
		cursor:pointer;
	}
	.addr #zip{
		width:100%;
		height:40px;
		margin-top:8px;
		border-radius:10px;
		padding:0 20px;
		border:1px solid lightgray;
		outline:none;
	}
	.addr #address1, .addr #address2{
		width:100%;
		height:40px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
		margin-top:8px;
	}
	.addr #find_zip{
		width:150px;
		height:30px;
		padding:0px 20px;
		margin-top:5px;
		border:1px solid lightgray;
		border-ragius:5px;
		background-color:rgba(223, 142, 1, 1);
		cursor:pointer;
	}
	.submit{
		margin-top:50px;
		width:80%
	}
	.submit input{
		width:100%;
		height:50px;
		border:0;
		outline:none;
		border-radius:10px;
		background:rgba(238, 73, 47, 0.83);
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
		cursor:pointer;
	}
	@media screen and (min-width:1200px){
		.wrap{
		padding-top:50px;
		width:100%;
		height:1100px;/*height:100vh;*/
		display:flex;
		algin-items:center;
		justify-content:center;
		}
	}
</style>

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
<!-- 유효성 검사 -->
<script>
function EmailChk(){
	var email = document.f.u_email.value.trim();
	var reg_mail=/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
		if(reg_mail.test(email)==false){
			alert('이메일 형식이 올바르지 않습니다.');
			document.f.u_email.focus();
			return false;
		}else{
			return true;
		}
		document.f.submit();
	}
</script>
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
	else if(!/^\d{2,3}\d{3,4}\d{4}$/.test(document.f.u_call.value)){
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
	<form  action="./adminJoinAction.adm" method="post" name="f" onsubmit="return check();">
		<div class="wrap">
			<div class="join">
				<input type="hidden" name="u_grade" id="u_grade" value="Admin"/>
				<h2>관리자 등록</h2>
				<div class="id">
					<h4>아이디</h4>
					<input type="text" name="u_id" id="u_id"  required/>
					<input type="button" name="u_idck" id="u_idck" value="아이디 중복확인 "  required placeholder="8-12자 영문과 숫자조합을 입력하세요." onclick="window.open('common/idCheck.jsp?openInit=true','','width=500, height=300')"/>
				</div>
				<div class="pass">
					<h4>비밀번호</h4>
					<input type="password" name="u_password" id="u_password" required placeholder="8-12자 영문과 숫자조합을 입력하세요." required/>
				</div>
				<div class="email">
					<h4>이메일</h4>
					<input type="text" name="u_email" id="u_email" placeholder="ex)aaa@naver.com"/>
				</div>
				<div class="name">
					<h4>지점명</h4>
					<input type="text" name="u_name" id="u_name" required/>
				</div>
				<div class="call">
					<h4>지점번호</h4>
					<input type="text" name="u_call" id="u_call" placeholder="(-)를 제외한 숫자만 입력하세요." required>
				</div>
				<div class="addr">
				<h4>주소</h4>
					<input type="text" id="zip" name="zip" placeholder="우편번호" required="required">
					<input type="button" onclick="findAddr()" value="우편번호 찾기" id="find_zip"><br>
					<input type="text" id="address1" name="address1"placeholder="주소"><br>
					<input type="text" id="address2" name="address2" placeholder="상세주소">
						
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
				</div>
				<div class="submit">
				<input type="button" value="가입하기" onclick="check();" />
			</div>
			</div>
		
		</div>
	</form>
</main>
</body>
</html>