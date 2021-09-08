<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/user_img/민스탭.png">
<link rel="stylesheet" href="header1.css">

<title>MIN'S TOUCH</title>

<style>
	*{
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
	}
	#scrollmenu{
		
		width:100%;
		height:7%;
	}
	
	/* 헤더메뉴 부분*/
	.header1{
		width:1%;
		float:left;
		margin-left:1%;
		margin-top:1%;
	}
	
	/* 민스터치 로고이미지부분*/
	.header2{
		width:38%;
		float:left;
		margin-top:1%;
		margin-left:29.0%;
	}
	/* 헤더 회원가입 및 로그인부분*/
	.header3{
		float:right;
		margin-top:0.5%;
		margin-right:0.5%;
		width:30%;
	}
	.header3 a:hover{
		color:orange;
	}
	/*헤더 회원가입 및 로그인부분 ul li*/
	.header3 ul>li{
		font-size:0.5em;
		list-style-type: none;
		display:inline;
		position: relative;	
		text-decoration:none;
	}
	.header3 a{
		color:#993800;
		display:inline;
		text-decoration:none;
		font-family:'맑은고딕';
	}

	
	/*섹션 부분*/	
	section{
		clear:both;
	}
	section .main{
		
	}
	section .main #template_table{
		
	}
	.sec6{
		width:100%;
		margin:0;
		background-color:#e3d6bf;
		height:14%;
	}
		
	.sec5{
		background-color:#f5e6ca;
		width:100%;
		height:22%;
	}
	.sec5 img{
		margin:0;
	}
	.sec4{
		width:100%;
		height:20%;
	}
	.sec3{
		width:100%;
		height:30%;
	}
	.sec2{
		width:100%;
		height:25%;
	}
	.sec1{
		width:100%;
		background-color:#74685c;
		height:30%;
	}
	.secmenu{
		width:60%;
		height:10%;
		margin-top:1%;
		color:white;
		border-top:1px solid #f4efe5;
	}
	.secmenu td{
		width:10%;
		height:15%;
		font-size:0.8em;
		color:#f4efe5;
	}
	.secmenu a{
		color:white;
		text-decoration:none;
	}
	.secmenu td a{
		color:#f4efe5;
		text-decoration:none;
	}
	
	/*푸터부분*/	
	footer{
		width:100%;
		height:35%;
		background-color:#5e4e46;
		color:white;
	}
	.etc ul li{
		list-style-type: none;
		display: inline-block;
		position: relative;	
		text-decoration:none;
	}
	.etc ul a{
		list-decoration:none;
		width:100%;
		color:#f4efe5;
		text-decoration:none;
		font-size:0.8em;	
	}
	.etc ul a:hover{
		color:orange;
	}
	.customer {
		display: inline-block;
		position: relative;	
	}
	
	@media screen and (min-width:1242px){
		/* 헤더메뉴 부분*/
		.header1{
			width:1%;
			float:left;
			margin-left:1%;
			margin-top:1%;
		}
		
		/* 민스터치 로고이미지부분*/
		.header2{
			width:42%;
			float:left;
			margin-top:1%;
			margin-left:28.5%;
		}
		/* 헤더 회원가입 및 로그인부분*/
		.header3{
			float:right;
			margin-top:0.5%;
			margin-right:1%;
			width:172px;
		}
		/*헤더 회원가입 및 로그인부분 ul li*/
		.header3 ul>li{
			font-size:0.9em;
			list-style-type: none;
			display:inline;
			position: relative;	
			text-decoration:none;
		}
		.header3 a{
			display:inline;
			text-decoration:none;
			font-family:'맑은고딕';
		}
		
		#scrollmenu{
			height:8%;
		}
	}
	
	@media screen and (min-width:1360px){
		/* 헤더메뉴 부분*/
		.header1{
			width:1%;
			float:left;
			margin-left:1%;
			margin-top:1%;
		}
		
		/* 민스터치 로고이미지부분*/
		.header2{
			width:40%;
			float:left;
			margin-top:1%;
			margin-left:28%;
		}
		/* 헤더 회원가입 및 로그인부분*/
		.header3{
			float:right;
			margin-top:1%;
			margin-right:1%;
			width:320px;
		}
		/*헤더 회원가입 및 로그인부분 ul li*/
		.header3 ul>li{
			font-size:1.0em;
			list-style-type: none;
			display: inline-block;
			position: relative;	
			text-decoration:none;
		}
		.header3 a{
			display: inline-block;
			text-decoration:none;
			font-family:'맑은고딕';
		}
		#scrollmenu{
			height:10%;
		}
	}
</style>
<script>
//스크롤 200px이상일때 박스 상단 따라다니기 및 배경색 변경
$(window).scroll(  
    function(){  
        //스크롤의 위치가 상단에서 450보다 크면  
        if($(window).scrollTop() > 450){  
        	// if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){  
			$("#scrollmenu").css('background-color','white');
            $('#scrollmenu').addClass("fix");  
            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
			
        }else{  
            $('#scrollmenu').removeClass("fix");  
            //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
        }  
    }  
);  
</script>
</head>
<body>
	<header id ="head">
	<div class="backcolor">
		<div id="scrollmenu">
			<div class="header1" style="position: relative; z-index:2;">
				<input type="checkbox" class="" id="collapsible">
				<label for="collapsible"></label>
				<ul id="menuitems" class="menuitems">
        			<li><a href="${pageContext.request.contextPath}/userMain.jsp">HOME</a></li>
        			<li><a href="${pageContext.request.contextPath}/set.kiosk">주문하기</a></li>
        			<li><a href="#">메뉴</a></li>
			        <li><a href="#">프로모션</a></li>
			        <li><a href="#">이벤트</a></li>
			        <li><a href="${pageContext.request.contextPath}/chain.usr">가맹문의</a></li>
					<li></li>
				</ul>        
			</div>	
			<div class="header2">
				<a href="${pageContext.request.contextPath}/userMain.jsp"><img src="${pageContext.request.contextPath}/img/logo/minsLogo.png" width="50%"></a>
			</div>
			<div class="header3">
				<ul>
				<c:choose>
					<c:when test="${u_id eq null}">
						<li><a href="${pageContext.request.contextPath}/userLogin.usr">로그인</a></li>
						<li> | </li>
						<li><a href="${pageContext.request.contextPath}/userJoin.usr">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li>${u_name} 님 환영합니다.</li><br>
						<li><a href="${pageContext.request.contextPath}/userLogout.usr">로그아웃</a></li>
						<li> | </li>
						<li><a href="${pageContext.request.contextPath}/myOrder.kiosk">주문내역보기</a></li>
						<li> | </li>
						<li><a href="${pageContext.request.contextPath}/userView.usr">회원정보관리</a></li>
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
		</div>
	</div>	
	</header>
	
	<section>
		
		<div class="main">
		<img src="${pageContext.request.contextPath}/img/user_img/민스터치메뉴.png" width="80%" height="60%">
			<table id="template_table">
				
				<tr>
					<td>
						<jsp:include page="/user/menu1.jsp"></jsp:include>
					</td>
				</tr>
				<tr>
					<td>
						<jsp:include page="${showmenu }"/>
					</td>
				</tr>
				<tr style="text-align:center">
					<td><jsp:include page="/user/burgerCartList.jsp"/></td>
				</tr>
			</table>
		</div>
		
	
		<!--민스버거 홍보이미지-->
		<img src="${pageContext.request.contextPath}/img/sec_img/sec3.png" width="100%">
		<!--가까운 민스터치매장 및 앱 주문가능 이미지-->
		<img src="${pageContext.request.contextPath}/img/sec_img/sec2.png" width="100%">
		<!--민스터치 푸터위 메뉴부분-->
		<div class="sec1">
			<img src="${pageContext.request.contextPath}/img/sec_img/sec1.png" height="20%" width="100%">
			<table class="secmenu">
				<tr>
					<th><a href="${pageContext.request.contextPath}/userMain.jsp">HOME</a></th>
					<th><a href="${pageContext.request.contextPath}/set.kiosk">메뉴</a></th>
					<th><a href="#">이벤트</a></th>
					<th><a href="${pageContext.request.contextPath}/personal.usr">고객문의</a></th>
					<th><a href="${pageContext.request.contextPath}/headcenter.usr">매장오시는길</a></th>
					<th><a href="${pageContext.request.contextPath}/chain.usr">가맹문의</a></th>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/set.kiosk">세트메뉴</a></td>
					<td><a href="#">진행중이벤트</a></td>
					<td><a href="${pageContext.request.contextPath}/personal.usr">1:1문의</a></td>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/sangdam.usr">상담문의</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/burger.kiosk">버거</a></td>
					<td><a href="#">종료된이벤트</a></td>
					<td><a href="${pageContext.request.contextPath}/jaju.usr">자주하는질문</a></td>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/faq.usr">FAQ</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/side.kiosk">사이드</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/gameng.usr">개설절차</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/drink.kiosk">음료</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/dessert.kiosk">디저트</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</section>
	
	<!--푸터-->
	<footer>
		<br>
        <div class="inner">
        	<nav class="etc" >
                <ul>
                  	<li><a href="${pageContext.request.contextPath}/teamsOfService.usr">이용약관 &nbsp;&nbsp;</a></li>
                    <li><a href="${pageContext.request.contextPath}/privacy.usr">개인정보처리방침 &nbsp;&nbsp;</a></li>
                    <li><a href="${pageContext.request.contextPath}/emailCollect.usr">이메일 무단 수집거부</a></li>
                </ul>
        	</nav>
		</div>	
			
		<img src="${pageContext.request.contextPath}/img/footer_img/footer.png" width="100%">
			<div>
				<a href="#" onclick="window.open('https://www.instagram.com/thebluehouse_kr/?hl=ko')"><img src="${pageContext.request.contextPath}/img/footer_img/ins.png"></a>
				<a href="#" onclick="window.open('https://www.facebook.com/TheBlueHouseKR/')"><img src="${pageContext.request.contextPath}/img/footer_img/face.png"></a>
				<a href="#" onclick="window.open('https://www.youtube.com/channel/UC7WMB_czX5jF__5kqT4d9Ww')"><img src="${pageContext.request.contextPath}/img/footer_img/you.png"></a>
			</div>
		<img src="${pageContext.request.contextPath}/img/footer_img/footer2.png" width="100%">
	</footer>
</body>
</html>