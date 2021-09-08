<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보보기</title>
<style>
	#InfoformArea{
		width:80%;
		margin:0 auto;
		text-align:center;
		padding:0;
		color:#5c4738;
	}
	.wrap{
		width:100%;
		height:100%;
		display:flex;
		align-items:center;
		justify-content:center;
	}

	.info{
		padding-top:25px;
		width:100%;
		height:80%;
		display:flex;
		justify-content:center;
		align-items:center;
		flex-direction:column;
	}
	.h2{
		color:#5c4738;
		font-size:2em;
		font-family: '맑은고딕';
		font-weight: bolder;
	}
	.h3{
		width:100%;
		color:#a4948a;
		font-size:1em;
		margin-top:10px;
	}
	.h4{
		width:100%;
		color:#a4948a;
		font-size:0.8em;
		margin-top:10px;
	}
	.id, .email, .call, .name, .addr{
		margin-top:20px;
		width:50%;
		font-size:1.1em;
	}
	.id input, .email input, .call input, .name input, .addr input{
		width:100%;
		height:40px;
		margin-top:10px;
		border-radius:10px;
		padding:0 20px;
		border:1px solid lightgray;
		outline:none;
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
	.addr #address1, .addr #address2, .addr #find_zip{
		width:100%;
		height:40px;
		border-radius:10px;
		padding:0px 20px;
		border:1px solid lightgray;
		outline:none;
		margin-top:10px;
	}
	.addr #find_zip{
		width:130px;
		height:30px;
		margin-top:10px;
		border:1px solid lightgray;
		border-ragius:10px;
		background-color:#decdb9;
		cursor:pointer;
		color:#5c4738;
		float:left;
		
	}
	.submit{
		margin-top:40px;
		width:100%;
		padding:0 20px;
		padding-bottom:20px;
		display:flex;
		flex-direction:row;
	}
	.submit input{
		height:40px;
		width:40%;
		border:0;
		border-radius:10px;
		background:#5c4738;
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
		cursor:pointer;
	}
	.submit a{
		width:40%;
		height:30px;
		border:0;
		outline:none;
		border-radius:10px;
		background:#5c4738;
		color:white;
		font-size:1.2em;
		letter-spacing:2px;
		cursor:pointer;
		text-decoration:none;
		display:block;
		padding-top:10px;
		
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
</head>
<body>
<br><br><br><br><br>
<main id ="InfoformArea">
	<form action="./userModify.usr" method="post" name="f" onsubmit="return check()">
		<div class="wrap">
			<div class="info" >
				<div class="h2">마이페이지</div>
				<div class="grade">
					<div class="h3">회원님의 등급은 <b>${user.u_grade}</b> 입니다</div>
					<div class="h4">*기본 등급 Family. 이전달 기준 주문 총 금액이 60,000원 이상이면 VIP등급으로 변경*</div>
				</div>
				<br>
				<table style="width:60%">
					<tr class="id">
						<td style="width:40%"><b>아이디 :</b></td>
						<td><input type="text" id="u_id" value="${user.u_id}" readonly/></td>
						
					</tr>
					<tr class="email">
						<td><b>이메일 :</b></td>
						<td><input type="text" id="u_email" name="u_email" value="${user.u_email}" placeholder="ex)aaa@naver.com" required />
						</td>
					</tr>
					<tr class="name">
						<td><b>이름 :</b></td>
						<td><input type="text" id="u_name" name="u_name" value="${user.u_name}" readonly/></td>
					</tr>
					<tr class="call">
						<td><b>전화번호 :</b></td>
						<td><input type="text" id="u_call" name="u_call" value="${user.u_call}" required placeholder="(-)없이 숫자만 입력하세요." required/></td>
					</tr>
					<tr class="addr">
						<td><b>주소 :</b></td>
						<td>
							<input type="text" id="zip" name="zip" placeholder="우편번호" value="${addr.zip}" required>
							<input type="button" onclick="findAddr()" value="우편번호 찾기" id="find_zip"><br>
							<input type="text" id="address1" name="address1" placeholder="주소" value="${addr.address1}" required><br>
							<input type="text" id="address2" name="address2" placeholder="상세주소" value="${addr.address2}" required>
								
							<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>						
						</td>
						
					</tr>
					<tr>
						<td colspan="2">
							<div class="submit">
								<input type="submit" value="변경"/>
								<a href="./userDelete.usr?id=${u_id}">회원탈퇴</a>
							</div>
						</td>
					</tr>
				</table>
				
			
			
			</div>
		</div>
		
	</form>
</main>
</body>
</html>