<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.*, dao.BurgerDAO, java.util.*, java.text.SimpleDateFormat" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.headfont{
		font-weight: bolder;
		font-size: 1.7em;
		font-family: "맑은고딕";
		color:#74685c;
		
	}
	.tr_top{
		background-color:#decdb9;
		font-weight:bolder;
		font-size:1.1em;
		font-family: "맑은고딕";
		border:1px;
		
	}
	.tdradius{
		border:1px solid #decdb9;
		border-radius: 5px;
		text-align:center;
		
	}
	.tdradius a{
		color:brown;
	}
	
	.div_empty{
		margin-top:30px;
		padding-top:40px;
		text-align:center;
		color:white;
		background-color:#decdb9;
		width:100%;
		height:60px;
		border-radius: 10px;
	}
	a{
		text-decoration:none;
	}
	#outline{
		margin-bottom:60px;
		width:100%;
		
	}
	#outline .inline{
		width:90%;
		
	}
	.del a{
		color:brown;
	}
	#img_or{
		width:20%;
	}
	@media screen and (min-width:1200px){
		#img_or{
			width:8%;
		}
	}
</style>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문내역</title>
<script>
	function checkAll(theForm){
		if(theForm.remove.length==undefined){
			theForm.remove.checked=theForm.allCheck.checked;
		}else{
			for(var i=0; i<theForm.remove.length; i++){
				theForm.remove[i].checked=theForm.allCheck.checked;
			}
		}
	}
	
	function checkQty(m_id,qty){
		if(qty != 1){	//if(qty > 1) 로 조건 바꿔서 테스트 해보기.
			location.href="burgerCartQtyDown.kiosk?m_id=" + encodeURIComponent(m_id);
		}
	}
</script>
</head>
<body>
	<section id="outline">
	<c:choose>
		<c:when test="${cartList != null && cartList.size()>0 }">
		<p class="headfont">장바구니</p>
		<form method="post">
		<table class="inline">
			<tr class="tr_top">
				<td class="tdradius"><a href="burgerCartRemoveAll.kiosk">전체삭제</a></td>
				<td class="tdradius">상품번호</td>
				<td class="tdradius">상품 이미지</td>
				<td class="tdradius">제품명</td>
				<td class="tdradius">가격</td>
				<td class="tdradius" style="width:80px">수량</td>
			</tr>
			
			<c:forEach var="cart" items="${cartList }" varStatus="status">
			<tr>
				<td class="del"><a href="burgerCartRemove.kiosk?m_id=${cart.m_id }">삭제</a></td>
				<td style="text-align:center">${status.index+1 }	<!-- 번호값 계산 --></td>
				<td><img src="burger_images/${cart.image }" id="cartImage" width="200px" height="150px"/></td>
				<td>${cart.name }</td>
				<td>${cart.price } 원<input type="hidden" name="priceList" value="${cart.price }"/></td>
				<td>
					<a href="burgerCartQtyUp.kiosk?m_id=${cart.m_id }">
						▲
					</a><br>
					${cart.qty } 개<input type="hidden" name="qtyList" value="${cart.qty }"/><br>
					<a href="javascript:checkQty('${cart.m_id }',${cart.qty })">
						▼
					</a>
				</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td class="totalfont"colspan="5" style="text-align:right;">
					총 금액:<b> ${totalMoney }</b> 원
					<input type="hidden" name="totalMoney" value="${totalMoney }"/>
				</td>
			</tr>
			<tr>
				<td colspan="5" style="text-align:right;">
					<a href="burgerCartOrder.kiosk?totalMoney=${totalMoney }"><img src="${pageContext.request.contextPath }/img/sec_img/baro1.png" id="img_or"></a>
					<input type="submit" value="주문하기" formaction="burgerCartOrder.kiosk"/>
				</td>
			</tr>
		</table>
		</form>
		</c:when>
		
		<c:otherwise>
			<section class="div_empty">장바구니가 비어있습니다.</section>
		</c:otherwise>
	</c:choose>
	</section>
</body>
</html>