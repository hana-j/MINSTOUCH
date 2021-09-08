<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 관리자메인 -->
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/user_img/민스탭.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/main.css" >
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a8e4307882.js" ></script>
<script src="${pageContext.request.contextPath}/admin/main.js" defer></script>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>MIN'S TOUCH 관리자</title>
<style>
/*헤더 */

.navbar__logo img{
	width:40%;
	margin-left:0px;
}
/*메인*/

#mainForm{
	width:100%;
	height:100%;
	padding-top:30px;
	height:100%;
	margin:0 auto;
	background-color:white;
	padding-bottom:20px;
}
.wrap{
	display:flex;
	algin-items:center;
	justify-content:center;
      
}
.box{   
	width:100%;
	height:100%;
	display:flex;
	justify-content:center;
	align-items:center;
	flex-direction:column;
}
li span{
   color:rgba(254, 222, 16, 0.95);
}
.none{
   height:100vh;
}
.hi{
	margin-bottom:20px;
}
</style>
</head>
<body>
<header>
 	<nav class="navbar">
        <div class="navbar__logo">
             <a href="adminMain.jsp"><img src="${pageContext.request.contextPath}/img/logo/민스터치로고.png"></a>
        </div>
        <ul class="navbar__menu">
            <li><a href="${pageContext.request.contextPath}/dayOrderManage.adm">실시간주문관리</a></li>
            <li><a href="${pageContext.request.contextPath}/orderManage.adm">전체주문관리</a>
            <li><a href="${pageContext.request.contextPath}/salesCal.adm">매출관리</a></li>
            <li><a href="${pageContext.request.contextPath}/set.adm">메뉴관리</a></li>
            <li><a href="${pageContext.request.contextPath}/service.adm">고객센터</a></li>
            <c:choose>
            <c:when test="${a_id eq null}">
            	<li><a href="${pageContext.request.contextPath}/adminLogin.adm">로그인</a></li>
				<li>|</li>
				<li><a href="${pageContext.request.contextPath}/adminJoin.adm">관리자등록</a></li>
            </c:when>
            <c:otherwise>
            	<li><span>${a_name} 입니다   &nbsp;</span> | </li>
				<li><a href="${pageContext.request.contextPath}/adminLogout.adm">로그아웃</a></li>
			</c:otherwise>
            </c:choose>
             
        </ul>
        <a href="#" class="navbar__toogleBtn"><i class="fas fa-bars"></i></a>
    </nav>
</header>
<main id="mainForm">
	<div class="wrap">
      <div class="box">
         <jsp:include page="${showadmin}"/>   
      
         <c:choose>
            <c:when test="${a_id eq null and showadmin eq null}">
               <jsp:include page="admin/adminLogin.jsp"></jsp:include>   
            </c:when>
            <c:otherwise>
               <div class="hi">${a_name} 오늘하루도 화이팅!</div>
            </c:otherwise>
         </c:choose>
      
      </div>
      
   </div>
</main>
<footer>
	<div id="foot">
		<br>
        <div class="inner">
        	<nav class="etc">
                <ul>
                  	<li><a href="${pageContext.request.contextPath}/teamsOfService.adm">이용약관 &nbsp;&nbsp;</a></li>
                    <li><a href="${pageContext.request.contextPath}/privacy.adm">개인정보처리방침 &nbsp;&nbsp;</a></li>
                    <li><a href="${pageContext.request.contextPath}/emailCollect.adm">이메일 무단 수집거부</a></li>
                </ul>
        	</nav>
		</div>	
			
		<img src="${pageContext.request.contextPath}/img/footer_img/footer.png" width="100%">
			<div>
				<a href="#"><img src="${pageContext.request.contextPath}/img/footer_img/ins.png"></a>
				<a href="#"><img src="${pageContext.request.contextPath}/img/footer_img/face.png"></a>
				<a href="#"><img src="${pageContext.request.contextPath}/img/footer_img/you.png"></a>
			</div>
		<img src="${pageContext.request.contextPath}/img/footer_img/footer2.png" width="100%">
	</div>
</footer>
</body>
</html>