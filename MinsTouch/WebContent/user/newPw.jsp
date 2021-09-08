<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
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
	.wrap{
		width:60%;
		height:80vh;
		diplay:flex;
		align-itmes:center;
		justify-content:center;
	}
	.box{
		 width:80%;
		 height:600px;
		 display:flex;
		 justify-content:center;
		 align-items:center;
		 flex-direction:column;
	}
	h2{
		color:#5c4738;
		font-size:2em;
	}
	h4{
		font-size:1.2em;
	}
	.h3{
		width:100%;
		color:#a4948a;
		font-size:1em;
		margin-top:10px;
	}
	.id, .pass, .c_pass{
		margin-top:20px;
		width:80%;
	}
	.id input, .pass input, .c_pass input{
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
		width:80%;
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
	

	
</style>
<title>비밀번호변경</title>
<script>
function chk(f){

   if(f.u_password.value.trim() != f.con_password.value.trim()){
      alert('비밀번호확인이 비밀번호와 같지않습니다.');
      f.con_password.focus();
      return false;
   }
   if(f.u_password.value.trim().length<8 || f.con_password.value.trim().length>12){
      alert("비밀번호는 8~12자 이내로 입력해주세요");
      f.u_password.focus();
      return false;
   }
   
}
</script>
</head>
<body>
<main id="formArea">   
   <form action="changePw.usr" name="f" method="post" onsubmit="return chk(this);">
      <div class="wrap">
         <div class="box">
            <h2>비밀번호 변경</h2>
            <div class="h3">비밀번호 변경 페이지 입니다.</div>
            <div class="id">
               <h4>아이디 </h4>
                <input type="text" name="u_id" required/>
            </div>
            <div class="pass">
               <h4>비밀번호</h4>
               <input type="password" name="u_password" id="u_password" maxlength="12" required/>
            </div>
            <div class="c_pass">
               <h4>비밀번호 확인</h4>
               <input type="password" name="con_password" id="con_password" maxlength="12" placeholder="비밀번호와 동일하게 입력 해 주세요" required/>
            </div>
            <div class="submit">
               <input type="submit" value="변경">
            </div>   
         </div>
      </div>
   </form>
</main>
</body>
</html>