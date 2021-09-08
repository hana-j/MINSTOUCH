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
		width:90%;
	}
	li{
		list-style:none;
		padding:5px 0 5px 5px;
	}
	.menu li a{
		font-size:1.1em;
		color:rgba(238, 73, 47, 0.83);
	}
	.wrap{
		height:100%;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		align-content:strech;
	}
	.menu{
		display:flex;
		flex-wrap:wrap;
		flex-direction:column;
	}
	.text{
		width:100%;
		border-radius:5px;
		border:1px solid lightgray;
		
	}
	.menu img{
		width:50%;
	}
	@media screen and (min-width:1200px){
		#listForm{
			float:left;
		}
		.menu li a{
		font-size:1.2em;
		}
		.wrap{
		height:100%;
		display:flex;
		}
		.menu{
		width:100%;
		float:left;
		display:flex;
		flex-direction:row;	
		}
		.text{
		width:100%;
		border-radius:5px;
		
		margin-bottom:10px;
		}
		.img, .text{width:50%;}
		.menu img{
			width:40%;
		}
	}
</style>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
		<section id="listForm">
		<c:if test="${menuAdmList ne null }">
			<div class="wrap">
			<c:forEach var="menu" items="${menuAdmList }" varStatus="status">
				<div class="menu">
					<div class="img">
						<img src="burger_images/${menu.image }"/>
					</div>
					<div class="text">
						<ul>
							<li><a href="menuModify.adm?m_id=${menu.m_id }&category=${menu.category}">메뉴수정</a>&nbsp;&nbsp;&nbsp;<a href="menuDelete.adm?m_id=${menu.m_id }&category=${menu.category}">메뉴삭제</a></li>
						
								<li>메뉴ID: ${menu.m_id}</li>
								<li>메뉴카테고리: ${menu.category}</li>
								<li>메뉴명: ${menu.m_name }</li>
								<li>메뉴가격: ${menu.m_price }</li>
								<li>메뉴설명: ${menu.m_detail }</li>
								<li>가능여부(y=판매가능 / n=판매불가): ${menu.m_status }</li>
								<li>메뉴등록날짜: ${menu.m_date }</li>
								<li>메뉴사진: ${menu.image }</li>
						</ul>
					</div>
				</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${menuAdmList eq null }">
			등록된 상품이 없습니다.
		</c:if>
	</section>
</body>
</html>