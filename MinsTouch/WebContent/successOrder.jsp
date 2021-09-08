<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.*, dao.BurgerDAO, java.util.*, java.text.SimpleDateFormat" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/user_img/민스탭.png">
<link rel="stylesheet" href="header1.css">
<style>
	body{
		
	}
	*{
		margin: 0 auto;
		float:center;
		text-align:center;
		padding: 0;
	}
	#scrollmenu{
		position:fixed;
		width:100%;
		height:7%;
		background-color:#D6C8A1;
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

	section{
		width:100%;
		
	}

	#outline{
		
		width:100%;
		
		margin:0 auto;
		padding-top:150px;
		padding-bottom:100px;
	}
	#outline h2{
		color:#544A00;
		font-size:1.2em;
	}
	#outline .inline{
		padding:5px;
		margin:10px auto;
		width:100%;
		
		
	}
	#outline .inline table{
		width:80%;
		margin:10px auto;
		border-collapse:collapse;
	}
	#outline .inline table tr td{
		padding:5px;
		border:1px solid #AE6D48;
	}
	
	/*섹션 부분*/	
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
			margin-left:26.5%;
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
			color:#993800;
			display:inline;
			text-decoration:none;
			font-family:'맑은고딕';
		}
		
		#scrollmenu{
			height:8%;
		}
		#outline .inline table{
			width:60%;
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
			color:#993800;
			display: inline-block;
			text-decoration:none;
			font-family:'맑은고딕';
		}
		#scrollmenu{
			height:10%;
		}
		#outline .inline table{
			width:60%;
		}
	}
	
	.tr_top td{
		color:white;
	}
</style>
<meta charset="UTF-8">
<title>MIN'S TOUCH</title>
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

	
	<section id="outline">
	<img src="${pageContext.request.contextPath}/img/user_img/ordersuccess.png" width="70%" height="16%">
	<div class="succ1">
		<img src="${pageContext.request.contextPath}/img/chain/hr.png" width="80%">
	</div>
		<c:if test="${burgerList != null && burgerList.size()>0 }">
		<h2><b>${u_name }</b> 님의 주문내역</h2>
		<form method="post">
		<div class="inline">
			<table>
				<tr class="tr_top" style="background-color:#5c4738; color:white; border-radius: 10px;">
					<td>번호</td>
					<td>제품명</td>
					<td>가격</td>
					<td>수량</td>
				</tr>
				<c:forEach var="burger" items="${burgerList }" varStatus="status">
				<tr>
					<td>${status.index+1 }</td>
					<td>${burger.m_name }</td>
					<td>${burger.m_price }</td>
					<td>${burger.quantity }</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4" style="text-align:right"><b>합계 금액:</b> ${totalMoney } 원</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:right"><b>할인:</b> -${totalMoney-saleTotalMoney } 원</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:right; font-size: 1.5em;">
					<img src="${pageContext.request.contextPath}/img/sec_img/w.png">
					<b>결제 금액:</b> ${saleTotalMoney } 원
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align:center">
						<jsp:include page="/user/orderStatus.jsp"/>
					</td>
				</tr>
			</table>
		</div>
		</form>
		</c:if>
	</section>
	
	<section>
		
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
					<th><a href="#">고객문의</a></th>
					<th><a href="#">매장오시는길</a></th>
					<th><a href="${pageContext.request.contextPath}/chain.usr">가맹문의</a></th>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/set.kiosk">세트메뉴</a></td>
					<td><a href="#">진행중이벤트</a></td>
					<td><a href="#">1:1문의</a></td>
					<td></td>
					<td><a href="#">상담문의</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/burger.kiosk">버거</a></td>
					<td><a href="#">종료된이벤트</a></td>
					<td><a href="#">자주하는질문</a></td>
					<td></td>
					<td><a href="#">FAQ</a></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="${pageContext.request.contextPath}/side.kiosk">사이드</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="#">개설절차</a></td>
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
                  	<li><a href="#">이용약관 &nbsp;&nbsp;</a></li>
                    <li><a href="#">개인정보처리방침 &nbsp;&nbsp;</a></li>
                    <li><a href="#">이메일 무단 수집거부</a></li>
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
	</footer>
</body>
</html>