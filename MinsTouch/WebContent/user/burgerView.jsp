<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.Burger" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#Form{
		width:760px;
		
		margin:auto;
		padding:5px;
		margin:10px auto;
		width:80%;
		height:80%;
		
		border-radius: 5px;
		border:1px solid #decdb9;
	}
	.content_right{
		text-align: :center;
	}
	.content_left img{
		width:100%;
		height:25%;
		float:left;
	}
	.detailpagesec2{
		
		width:100%;
		height:7%;
		float:left;
	}
	.prodname{
		font-size:3em;
		font-family:"맑은고딕";
	
	}
	.detailpagesec3{
		width:100%;
		height:8%;
	}
	/*메뉴정보 및 수량 장바구니 및 구매버튼 들어가는 자리 */
	
	.detailpagesec4{
		width:100%;
		height:15%;
		
	}
	.detailpagesec4 tr{
		width:100%;
		height:25%;
		text-align:right;
		align:right;
		font-size:0.8em;
	}
	.detailpagesec6{
		width:100%;
		height:100%;
		
	}
	.prenext{
		width:100%;
		height:100%;
		float:center;
	}
	.prenext img{
		
		width:35%;
		height:9%;
		
	}
	.menuimg{
		width:50%;
		height:100%;
		
	}
	.menuimg img{
		width:80%;
		height:95%;
	}
	.detailpagesec5{
		width:100%;
		height:25%;
		align:right;
		text-align:right;
		font-size:1.5em;
		font-weight:bold;
		
		
	
	}
	.result{
		color:#664a39;
		font-weight:bolder;
		font-size:1.5em;
	
	}
	.detailpagesec5 span{font-size:0.5em; margin-right:10%;}
	.pricefont{
		color:#664a39;
		font-weight:bolder;
		font-size:1.5em;
	}
	.detailpagesec6{
		width:100%;
		height:1%;
	}
	.detailanno{
		width:100%;
		height:10%;
		font-family:"맑은고딕";
		color:#4f382a;
		text-align:left;
	}
	.detailanno1{
		font-size:1.5em;
		
	}
		.detailanno2 a{
		text-decoration:none;
		color:#4f382a;
		
	}
	.detailanno2 a:hover{
		color:orange;
	}
	
	.detailpagesec8{
		width:100%;
		height:20%;
		text-align:left;
		font-size:2em;
		
	}
	.detatailpagesec7{
		width:50%;
	}
	.detailpagesec8 table{
		border:1px solid gray;
		width:100%;
		height:100%;

	}
	.detailpagesec8 table img{
		width:100%;
		height:100%;
	}
	.detailpagesec8 table tr{
		border:1px solid gray;
		height:100%;
		
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
	#listBtn{
		width:20%;
	}
	.cart_img{
		width:42%;
	}
	@media screen and (min-width:1000px){
		.cart_img{width:20%;}
		#listBtn{width:7%;}
		
		.detailpagesec4 tr{
			font-size:1.2em;
		}
	}
	
	
</style>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<section id="Form">
	
		<div class="detailpagesec2">
			<br>
			<img src="${pageContext.request.contextPath}/img/sec_img/new.png">		
		</div>
		
		<!-- 메뉴이름 들어가는 곳 -->
		<div class="detailpagesec3">	
			<a class="prodname">${burger.m_name }</a>
			<a href="#"><img src="${pageContext.request.contextPath}/img/sec_img/kakao.png"></a>	
			<a href="#"><img src="${pageContext.request.contextPath}/img/sec_img/link.png"></a>
		</div>
		<!-- 메뉴이름 들어가는 곳 -->	
		<table class="detailpagesec4">
			<tr>
				<td class="menuimg" rowspan="3"><img src="burger_images/${burger.image }" class="me_img" width="100%"></td>
				<td class="detailanno">
					<a class="detailanno1">제품 상세정보</a>
					<hr color="#decdb9">
					<br>${burger.m_detail }
				</td>
			</tr>
			<tr>	
				<td class="detailpagesec5">	
					가격&nbsp;<img src="${pageContext.request.contextPath}/img/sec_img/w.png"><a class="pricefont">${burger.m_price }원 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br><span>등급별 할인율 Vip: 0.5% / Family: 0.2%</span>
				</td>
			</tr>
			<tr class="detailanno2"> 
				<td>
					<a href="#" onclick="window.open('${pageContext.request.contextPath}/img/sec_img/yy.png')">영양성분보기</a> | <a href="#" onclick="window.open('${pageContext.request.contextPath}/img/sec_img/wonsan.png')">원산지 정보</a> | <a href="#" onclick="window.open('${pageContext.request.contextPath}/img/sec_img/arg.png')">알레르기 유발물질 정보</a>
					<br>
					<a href="burgerCartAdd.kiosk?id=${burger.m_id }&name=${burger.m_name }"><img src="${pageContext.request.contextPath}/img/sec_img/cart1.png" class="cart_img"></a>&nbsp;&nbsp;
				</td>
			</tr>
			
					
					
			
		</table>
				
				<div class="detailpagesec6">
					<img src="${pageContext.request.contextPath}/img/sec_img/hr.png" width="100%">
				</div>	
				<br>
				<br>
				<br>
				
				<h2>이 제품을 구매한 고객님들의 생생한 리얼리뷰</h2>
				
				<!-- 리뷰쓰기 새창 -->
				<div class="detatailpagesec7" style="float:center">
					
				</div>
				
				<!-- 리뷰목록보여지는 창 -->
				<br>
				<br>
				<div>
					<jsp:include page="${reviewpage }"/>
				</div>
				
				<br><br>
				<div>
					<a href="${pageContext.request.contextPath}/set.kiosk"><img src="${pageContext.request.contextPath}/img/user_img/list.png" id="listBtn"></a>
				</div>
		
		</section>
			
			
			<div id="commandList">
				<input type="submit" value="주문목록에 담기">
			</div>
</body>
</html>