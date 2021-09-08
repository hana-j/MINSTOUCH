<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		margin:0;
		padding:0;
	}
	.menu1{
		text-align:center;
		margin-top:10px;
		display:flex;
		flex-direction:row;
		flex-wrap:wrap;
		align-content:strech;
		width:100%;
	}
	
	/*라디오버튼 숨김*/
        input{
        	display: none;
        }
		
        .menu1 > label {
        	margin:10px;
		}

        .menu1 > label:hover {
            cursor: pointer;
       	}

        /*input 클릭시, label 스타일*/
        input:checked + .menu1 > label {
              color: #111;
              border: 1px solid #ddd;
              border-top: 2px solid #4f382a;
              border-bottom: 1px solid #ffffff;
		}

        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2,
        #tab3:checked ~ #content3,
        #tab4:checked ~ #content4, 
		#tab5:checked ~ #content5
		{
            display: block;}
            
        
       	.menu1 a{
        	padding:5px;
        	border:1px solid lightgray;
        	border-radius:20px;
        	background-color:#e3d6bf;
        	font-size:0.8em;
        }
        .box a{
        	text-decoration:none;
        	color:black;
        }
        @media screen and (min-width:740px){
        	.menu1{
        		width:80%
        	}
        	.menu1 a{
	        	font-size:1.0em;
	        }
        }
        @media screen and (min-width:1200px){
        	.menu1{
        		width:60%;
        	}
        	.menu1 a{
	        
	        	font-size:1.2em;
	        }
        }
</style>
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<div class="menu1">
		<div class="box">
			<input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
	   		<label for="tab1"><a href="${pageContext.request.contextPath }/set.kiosk">세트메뉴</a></label>
		</div>
		<div class="box">
		    <input id="tab2" type="radio" name="tabs">
		    <label for="tab2"><a href="${pageContext.request.contextPath }/burger.kiosk">버거</a></label>
		</div>
		<div class="box">
		    <input id="tab3" type="radio" name="tabs">
		    <label for="tab3"><a href="${pageContext.request.contextPath }/side.kiosk">사이드</a></label>
		</div>
		<div class="box">
		    <input id="tab4" type="radio" name="tabs">
		    <label for="tab4"><a href="${pageContext.request.contextPath }/drink.kiosk">음료</a></label>
		</div>
		<div class="box">
			<input id="tab5" type="radio" name="tabs">
		    <label for="tab5"><a href="${pageContext.request.contextPath }/dessert.kiosk">디저트</a></label>
		</div>
	</div>
</body>
</html>