<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#listForm{
		width:100%;
		
	}
	.headreview{
		background-color:#4f382a;
		border-radius:5px;
		height:20px;
		border:1px solid #4f382a;
		color:white;
	}
	.star{
		width:20%;
	}
	.cont a{
		color:#4f382a;
		font-weight: bold;
	}
</style>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<section id="listForm">
		<c:choose>
		<c:when test="${reviewList ne null }">
			<table>
				<tr>
					<td class="headreview">
						작성자
					</td>
					<td class="headreview">
						평점
					</td>
					<td class="headreview">
						한줄평
					</td>
					<td class="headreview">
						수정/삭제
					</td>
				</tr>
				<tr>
					<c:forEach var="re" items="${reviewList }" varStatus="status">
					
					<td>
						${re.u_id }&nbsp;&nbsp;
					</td>
					<td class="star">
						<c:if test="${re.rating==5 }"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"></c:if>
						<c:if test="${re.rating==4 }"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"></c:if>
						<c:if test="${re.rating==3 }"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"></c:if>
						<c:if test="${re.rating==2 }"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"></c:if>
						<c:if test="${re.rating==1 }"><img src="${pageContext.request.contextPath}/img/user_img/yellowstar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"><img src="${pageContext.request.contextPath}/img/user_img/graystar.png" width="12%"></c:if>
						&nbsp;&nbsp;
					</td>
					<td width="700px;" style="text-align: left;">
						<c:choose>
							<c:when test="${re.text eq '' }">
								<c:if test="${re.rating==5 }">매우 만족합니다.</c:if>
								<c:if test="${re.rating==4 }">만족합니다.</c:if>
								<c:if test="${re.rating==3 }">보통이에요.</c:if>
								<c:if test="${re.rating==2 }">아쉬워요.</c:if>
								<c:if test="${re.rating==1 }">별로에요.</c:if>
								&nbsp;&nbsp;
							</c:when>
							<c:otherwise>
								${re.text }
								&nbsp;&nbsp;
							</c:otherwise>
						</c:choose>
					</td>
					<td width="100px" class="cont">
					<div class="box1">
						<a href="modReviewForm.re?renum=${re.review_num }&u_id=${re.u_id}&m_id=${re.m_id}">수정</a>&nbsp;
						<a href="removeReview.re?renum=${re.review_num }&u_id=${re.u_id}&m_id=${re.m_id}">삭제</a>
					</div>
					</td>
					
					<c:if test="${((status.index+1) mod 1) eq 0 }">
					
				</tr>
				<tr>
					</c:if>
					</c:forEach>
				</tr>
			</table>
			
		</c:when>
		<c:otherwise>
			아직 작성된 리뷰가 없습니다.
		</c:otherwise>
		</c:choose>
	</section>
</body>
</html>