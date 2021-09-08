<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#formArea{
		margin:auto;
		width:100%;
	}
	.wrap{
		width:100%;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	.add{
		margin-top:10px;
		width:100%;
		height:100%;
		display:flex;
		content-align:left;
		align-items:left;
		flex-direction:column;
	}
	.h2{
		font-size:1.6em;
		font-weight:700;
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
		#formArea{
			padding-right:20px;
		}
	}
	@media screen and (min-width:1200px){
		#formArea{
			
		}
		.add{
			margin:auto;
			padding-right:100px;
		}
		
		
	}
</style>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<section id="formArea">
		<form name="addform" action="menuAdd.adm" method="post" enctype="multipart/form-data">
			<div class="wrap">
				<div class="add">
					<div class="h2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 메뉴등록 페이지 입니다</div>
					<table class="id">
						<tr>
						<td><h4>제품 ID</h4></td>
						<td style="width:70%"><input type="text" name="m_id" id="m_id" required></td>
						</tr>
					</table>
					<table class="cate">
						<tr>
						<td><h4>제품카테고리</h4></td>
						<td style="width:70%">&nbsp;<label><input type="radio" name="category" value="set"/>세트</label>  &nbsp;
						<label><input type="radio" name="category" value="burger"/>버거</label>  &nbsp;
						<label><input type="radio" name="category" value="side"/>사이드</label>  &nbsp;
						<label><input type="radio" name="category" value="drink"/>음료</label>  &nbsp;
						<label><input type="radio" name="category" value="dessert"/>디저트</label>  &nbsp;</td>
						</tr>
					</table>
					<table class="name">
						<tr>
						<td><h4>제품명 </h4></td>
						<td style="width:70%"><input type="text" name="m_name" id="m_name" required="required"></td>
						</tr>
					</table>
					<table class="price">
						<tr>
						<td><h4>제품가격</h4></td>
						<td style="width:70%"><input type="number" name="m_price" id="m_price" step="100" min="0" max="50000" required="required"></td>
						</tr>
					</table>
					<table class="detail">
						<tr>
						<td><h4>제품설멍</h4></td>
						<td style="width:70%"><input type="text" name="m_detail" id="m_detail" required="required"></td>
						</tr>
					</table>
					<table class="status">
						<tr>
						<td><h4>판매가능여부</h4></td>
						<td style="width:70%"><label><input type="radio" name="m_status" value="y" checked="checked"/>판매가능</label>  &nbsp;
						<label><input type="radio" name="m_status" value="n" />판매불가</label>  &nbsp;</td>
						</tr>
					</table>
					<table class="img">
						<tr>
						<td><h4>제품사진</h4></td>
						<td style="width:70%"><input type="file" name="image" id="image" required="required"></td>
						</tr>
					</table>
					<div class="submit">
						<a href="javascript:addform.submit()">등록하기</a>&nbsp;&nbsp;
						<a href="javascript:addform.reset()">다시작성</a>
					</div>
				</div>
			</div>
		</form>
	</section>
</body>
</html>