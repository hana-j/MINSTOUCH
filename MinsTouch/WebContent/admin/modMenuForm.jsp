<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#modformArea{
		margin:auto;
		width:100%;
	}
	.wrap{
		width:100%;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	.mod{
		margin-top:10px;
		width:100%;
		height:100%;
		display:flex;
		content-align:left;
		align-items:left;
		flex-direction:column;
	}
	.h2{
		font-size:1em;
		
		float:left;
	}
	.h4{
		font-size:1.1em;
		margin-bottom:5px;
	}
	.id, .name, .cate, .price, .detail, .status, .img, .submit{
		margin-top:15px;
	}
	
	.id input, .name input, .price input{
		width:200px;
		height:40px;
		border:0;
		outline:none;
		border:1px solid lightgray;
		outline:none;
		border-radius:10px;
		padding:0 20px;
	}
	.detail input{
		width:300px;
		height:40px;
		border:0;
		outline:none;
		border:1px solid lightgray;
		outline:none;
		border-radius:10px;
		padding:0 20px;
	}
	.img input{
		width:300px;
		height:40px;
		border:0;
		padding-left:45px;
	}
	.submit{
		margin-top:30px;
		margin-bottom:30px;
	}
	.submit>a{
		padding:10px 20px;
		border-radius:5px;
		border:1px solid #5c4738;
		font-size:1.2em;
		color:#5c4738;
		letter-spacing:2px;
		font-weight:bold;
		text-decoration: none;
	}
	@media screen and (min-width:768px) {
		#modformArea{
			padding-right:20px;
		}
	}
	@media screen and (min-width:1200px){
		#modformArea{
			
		}
		#modformArea .mod{
			margin:auto;
			padding-right:100px;
		}
	}
</style>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<section id="modformArea">
		<form name="modform" action="menuModify2.adm" method="post" enctype="multipart/form-data">
			<div class="wrap">
				<div class="mod">
					<h2>메뉴 정보 수정 페이지 입니다</h2>
					<table class="id">
						<tr>
						<td><h4>제품 ID</h4></td>
						<td style="width:70%"><input type="hidden" name="m_id" id="m_id" value="${mod_menu.m_id }">${mod_menu.m_id }</td>
						</tr>
					</table>
					<table class="cate">
						<tr>
						<td><h4>제품카테고리</h4></td>
						<td style="width:70%">
							&nbsp;<c:if test="${mod_menu.category eq 'set' }">
							<label><input type="radio" name="category" value="set" checked="checked"/>세트</label>  &nbsp;
							<label><input type="radio" name="category" value="burger"/>버거</label>  &nbsp;
							<label><input type="radio" name="category" value="side"/>사이드</label>  &nbsp;
							<label><input type="radio" name="category" value="drink"/>음료</label>  &nbsp;
							<label><input type="radio" name="category" value="dessert"/>디저트</label>  &nbsp;
						</c:if>
						<c:if test="${mod_menu.category eq 'burger' }">
							<label><input type="radio" name="category" value="set" />세트</label>  &nbsp;
							<label><input type="radio" name="category" value="burger" checked="checked"/>버거</label>  &nbsp;
							<label><input type="radio" name="category" value="side"/>사이드</label>  &nbsp;
							<label><input type="radio" name="category" value="drink"/>음료</label>  &nbsp;
							<label><input type="radio" name="category" value="dessert"/>디저트</label>  &nbsp;
						</c:if>
						<c:if test="${mod_menu.category eq 'side' }">
							<label><input type="radio" name="category" value="set" />세트</label>  &nbsp;
							<label><input type="radio" name="category" value="burger" />버거</label>  &nbsp;
							<label><input type="radio" name="category" value="side" checked="checked"/>사이드</label>  &nbsp;
							<label><input type="radio" name="category" value="drink"/>음료</label>  &nbsp;
							<label><input type="radio" name="category" value="dessert"/>디저트</label>  &nbsp;
						</c:if>
						<c:if test="${mod_menu.category eq 'drink' }">
							<label><input type="radio" name="category" value="set" />세트</label>  &nbsp;
							<label><input type="radio" name="category" value="burger" />버거</label>  &nbsp;
							<label><input type="radio" name="category" value="side" />사이드</label>  &nbsp;
							<label><input type="radio" name="category" value="drink" checked="checked"/>음료</label>  &nbsp;
							<label><input type="radio" name="category" value="dessert"/>디저트</label>  &nbsp;
						</c:if>
						<c:if test="${mod_menu.category eq 'dessert' }">
							<label><input type="radio" name="category" value="set" />세트</label>  &nbsp;
							<label><input type="radio" name="category" value="burger" />버거</label>  &nbsp;
							<label><input type="radio" name="category" value="side" />사이드</label>  &nbsp;
							<label><input type="radio" name="category" value="drink" />음료</label>  &nbsp;
							<label><input type="radio" name="category" value="dessert" checked="checked"/>디저트</label>  &nbsp;
						</c:if></td>
						</tr>
					</table>
					<table class="name">
						<tr>
						<td><h4>제품명 </h4></td>
						<td style="width:70%"><input type="text" name="m_name" id="m_name" value="${mod_menu.m_name }"></td>
						</tr>
					</table>
					<table class="price">
						<tr>
						<td><h4>제품가격</h4></td>
						<td style="width:70%"><input type="number" name="m_price" id="m_price" step="100" min="0" max="50000" value="${mod_menu.m_price }"></td>
						</tr>
					</table>
					<table class="detail">
						<tr>
						<td><h4>제품설명</h4></td>
						<td style="width:70%"><input type="text" name="m_detail" id="m_detail" size="80" value="${mod_menu.m_detail }"></td>
						</tr>
					</table>
					<table class="status">
						<tr>
						<td><h4>판매가능여부</h4></td>
						<td style="width:70%"><label><c:if test="${mod_menu.m_status eq 'y' }">
							<label><input type="radio" name="m_status" value="y" checked="checked"/>판매가능</label>  &nbsp;
							<label><input type="radio" name="m_status" value="n" />판매불가</label>  &nbsp;
						</c:if>
						<c:if test="${mod_menu.m_status eq 'n' }">
							<label><input type="radio" name="m_status" value="y" />판매가능</label>  &nbsp;
							<label><input type="radio" name="m_status" value="n" checked="checked"/>판매불가</label>  &nbsp;
						</c:if></td>
						</tr>
					</table>
					<table class="img">
						<tr>
						<td><h4>제품사진</h4></td>
						<td style="width:70%"><input type="file" name="image" id="image" required="required"></td>
						</tr>
					</table>
					
					<div class="submit">
						<a href="javascript:modform.submit()">수정하기</a>&nbsp;&nbsp;
						<a href="javascript:modform.reset()">다시작성</a>
					</div>	
				</div>
			</div>
		<!--  <table>
			<tr>
				<td colspan="2"><h1>메뉴 수정 페이지</h1></td>
			</tr>
			<tr>
				<td class="td_left"><label for="m_id">메뉴ID </label></td>
				<td class="td_right"><input type="hidden" name="m_id" id="m_id" value="${mod_menu.m_id }">${mod_menu.m_id }</td>
			</tr>
			<tr>
				<td class="td_left"><label for="category">메뉴카테고리 </label></td>
				<td class="td_right">
				<c:if test="${mod_menu.category eq 'set' }">
					<label><input type="radio" name="category" value="set" checked="checked"/>set</label>  &nbsp;
					<label><input type="radio" name="category" value="burger"/>burger</label>  &nbsp;
					<label><input type="radio" name="category" value="side"/>side</label>  &nbsp;
					<label><input type="radio" name="category" value="drink"/>drink</label>  &nbsp;
					<label><input type="radio" name="category" value="dessert"/>dessert</label>  &nbsp;
				</c:if>
				<c:if test="${mod_menu.category eq 'burger' }">
					<label><input type="radio" name="category" value="set" />set</label>  &nbsp;
					<label><input type="radio" name="category" value="burger" checked="checked"/>burger</label>  &nbsp;
					<label><input type="radio" name="category" value="side"/>side</label>  &nbsp;
					<label><input type="radio" name="category" value="drink"/>drink</label>  &nbsp;
					<label><input type="radio" name="category" value="dessert"/>dessert</label>  &nbsp;
				</c:if>
				<c:if test="${mod_menu.category eq 'side' }">
					<label><input type="radio" name="category" value="set" />set</label>  &nbsp;
					<label><input type="radio" name="category" value="burger" />burger</label>  &nbsp;
					<label><input type="radio" name="category" value="side" checked="checked"/>side</label>  &nbsp;
					<label><input type="radio" name="category" value="drink"/>drink</label>  &nbsp;
					<label><input type="radio" name="category" value="dessert"/>dessert</label>  &nbsp;
				</c:if>
				<c:if test="${mod_menu.category eq 'drink' }">
					<label><input type="radio" name="category" value="set" />set</label>  &nbsp;
					<label><input type="radio" name="category" value="burger" />burger</label>  &nbsp;
					<label><input type="radio" name="category" value="side" />side</label>  &nbsp;
					<label><input type="radio" name="category" value="drink" checked="checked"/>drink</label>  &nbsp;
					<label><input type="radio" name="category" value="dessert"/>dessert</label>  &nbsp;
				</c:if>
				<c:if test="${mod_menu.category eq 'dessert' }">
					<label><input type="radio" name="category" value="set" />set</label>  &nbsp;
					<label><input type="radio" name="category" value="burger" />burger</label>  &nbsp;
					<label><input type="radio" name="category" value="side" />side</label>  &nbsp;
					<label><input type="radio" name="category" value="drink" />drink</label>  &nbsp;
					<label><input type="radio" name="category" value="dessert" checked="checked"/>dessert</label>  &nbsp;
				</c:if>
				</td>
			</tr>
			<tr>
				<td class="td_left"><label for="m_name">메뉴명 </label></td>
				<td class="td_right"><input type="text" name="m_name" id="m_name" value="${mod_menu.m_name }"></td>
			</tr>
			<tr>
				<td class="td_left"><label for="m_price">메뉴가격 </label></td>
				<td class="td_right"><input type="number" name="m_price" id="m_price" step="100" min="0" max="50000" value="${mod_menu.m_price }"></td>
			</tr>
			<tr>
				<td class="td_left"><label for="m_detail">메뉴설명 </label></td>
				<td class="td_right"><input type="text" name="m_detail" id="m_detail" size="80" value="${mod_menu.m_detail }"></td>
			</tr>
			<tr>
				<td class="td_left"><label for="m_status">메뉴판매가능여부 </label></td>
				<td class="td_right">
				<c:if test="${mod_menu.m_status eq 'y' }">
					<label><input type="radio" name="m_status" value="y" checked="checked"/>판매가능</label>  &nbsp;
					<label><input type="radio" name="m_status" value="n" />판매불가</label>  &nbsp;
				</c:if>
				<c:if test="${mod_menu.m_status eq 'n' }">
					<label><input type="radio" name="m_status" value="y" />판매가능</label>  &nbsp;
					<label><input type="radio" name="m_status" value="n" checked="checked"/>판매불가</label>  &nbsp;
				</c:if>
				</td>
			</tr>
			
			<tr>
				<td class="td_left"><label for="image">메뉴사진 </label></td>
				<td class="td_right"><input type="file" name="image" id="image" value="${mod_menu.image }"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<a href="javascript:modform.submit()">수정하기</a>&nbsp;&nbsp;
					<a href="javascript:modform.reset()">다시작성</a>
				</td>
			</tr>
		</table>-->
		</form>
	</section>
</body>
</html>