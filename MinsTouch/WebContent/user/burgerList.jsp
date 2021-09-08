<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="vo.Burger" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	
	#listForm{
		margin:auto;
		
		padding:5px;
		margin:10px auto;
		width:100%;
	}
	.wrap{
		height:100%;
		
		
		
	}
	
	
	#listForm .wrap .box{
		width:50%;
		
		display:blcok;
		
		
	}
	.text{
		text-align:center;
		border:1px solid lightgray;
		border-radius:5px;
		width:100%;
		
		flex-wrap:wrap;
		padding-left:1%;
		padding-right:1%;
		padding-top:10px;
		padding-bottom:10px;
		font-size:1.2em;
	}
	.box img{
		width:100%;
	}
	@media screen and (min-width:740px){
		#listForm .wrap .box{
			width:25%;
			display:inline-block;
		}
		.text{
			width:90%;
			
		}
		.box img{
			width:80%;
		}
	}
	@media screen and (min-width:1220px){
		#listForm .wrap .box{
			width:20%;
			display:inline-block;
			
		}
		.text{
			width:90%;
			
		}
		.box img{
			width:80%;
		}
		
	}
</style>

<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<section id="listForm">
		<div class="wrap">
			
			<c:if test="${burgerList ne null }">
				<c:forEach var="burger" items="${burgerList }" varStatus="status">
					<c:if test="${burger.m_status eq 'y' }">
					<div class="box">
						<a href="burgerView.kiosk?id=${burger.m_id }"><img src="burger_images/${burger.image }" id="burgerImage" /></a>
						<div class="text">
							<p>
							${burger.m_name }<br>
							가격 : ${burger.m_price } 원<br>
							</p>
						</div>
					</div>
					</c:if>
					</c:forEach>
			</c:if>
			
		</div>
		<div class="none">
			<c:if test="${burgerList eq null }">
				등록된 상품이 없습니다.
			</c:if>
		</div>
	</section>
</body>
</html>