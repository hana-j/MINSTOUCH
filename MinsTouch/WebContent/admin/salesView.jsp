<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar" %>
<%
Calendar cal = Calendar.getInstance();

String yy = request.getParameter("year");
String mm = request.getParameter("month");
//	값을 입력받지 않았을 때, 디폴트 값 
int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH);
if(yy!=null && mm !=null && !yy.equals("")&&!mm.equals("")){
	y=Integer.parseInt(yy);
	m=Integer.parseInt(mm)-1;
}
//달력시작 시점 지정 , 세팅한 시점부터 값을 결정 
cal.set(y,m,1);
//(일 1-토 7) 
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);
//마지막날지정 
int lastday = cal.getActualMaximum(Calendar.DATE);
//이전버튼 
int b_y = y;
int b_m = m;
if(b_m==0){
	b_y=b_y-1;
	b_m=12;
}
//다음버튼 
int n_y=y;
int n_m=m+2;
if(n_m==13){
	n_y=n_y+1;
	n_m=1;
}
%>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main.css" >
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a8e4307882.js" ></script>
    <script src="main.js" defer></script>
    <title>MIN'S TOUCH 관리자</title>
  
  
<style>
	#cal{
		width:100%;
		height:100%;
		color:#5c4738;
	}
	#cal img{width:100%;}
	#cal table{
		border-collapse:collapse;	
		heigth:100%;
		width:80%;
	}
	th, td{
		padding:6px;
		border:1px solid lightgray;
		border-radius:3px;
		width:80px;
		height:35px;
		text-align:center;
		background:white;
	}
	caption{
		padding-bottom:30px;
		margin:10px;
		font-size:2em;
	}
	button{
		background-color:#5c4738;
		border-radius:4px;
		border:none;
		padding:8px 14px;
		text-align:center;
		text-decoration:none;
		display:inline-block;
		font-size:0.6em;
		cursor:pointer;
		color:white;
	}
	#btn_i{
		background-color:white;
		border-radius:4px;
		border:none;
		text-align:center;
		font-size:1.5em;
		cursor:pointer;
	}
	.search{
		padding-right:20px;
		width:75%;
		justify-content:center;
		align-items:center;
		margin-top:30px;
		margin-bottom:50px;
	}
	.search .year {
		justify-content:flex-end;
		display:flex;
	}
	.search .year input{
		width:30%;
		height:40px;
		margin-right:5px;
		border-radius:4px;
		padding:0 20px;
		border:1px solid lightgray;
		outline:none;
		cursor:pointer;
	}
	.search .submit{
		margin-top:10px;
		display:flex;
		align-items:center;
	}
	.search .submit input{
		width:150px;
		height:40px;
		margin-right:5px;
		border-radius:4px;
		padding:0 20px;
		border:1px solid lightgray;
		outline:none;
		background:#5c4738;
		font-size:1.1em;
		letter-spacing:2px;
		cursor:pointer;
		color:white;
	}
	.sub{
		color:#5c4738;
	}
	.tt{
		color:#5c4738;
		font-size: 2em;
		font-weight: bolder;
	}
	@media screen and (min-width:768px){
		#cal{
			width:70%;
				
			
		}
		.wrap{
			width:70%;
			height:70%;
		}
		table{
			border-collapse:collapse;	
			heigth:100%;
			width:100%;
		}
		th, td{padding:6px 14px;}
		.search .year input{
			width:30%;
		}
	}
</style>
</head>
<body>

<main id="cal">
<img src="${pageContext.request.contextPath}/img/user_img/mae.png" >
	<div class="wrap">
	<table>
		<caption>
		<button type="button"  onclick="location='./salesCal.adm?year=<%=b_y%>&month=<%=b_m%>'">◀</button>
		<%=y%>년<%=m+1%>월
		<button type="button" onclick="location='./salesCal.adm?year=<%=n_y%>&month=<%=n_m%>'">▶</button>
		</caption>
			<tr>
				<th style="color:red">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th style="color:blue">토</th>
			</tr>
			<tr>
			
			<% 
			int count = 0;
			//1일 출력전에 빈칸 출력 
			for(int s=1;s<dayOfweek;s++){
				out.print("<td></td>");
				count++;
			}
			//날짜를 출력 
			int i;
			for(i=1; i<=lastday;i++){ 
				count ++;
			%>
				<td><form name="f">
				<input type="button" value="<%=i%>" id="btn_i" onclick="showPopup(<%=y%>,<%=m+1%>,<%=i%>);" >
 				<input type="hidden" name="${y}"> 
				<input type="hidden" name="${m}">
				<input type="hidden" name="${i}">				
				</form></td>
			<%
			
			//줄바꿈 
			if(count%7==0){
				out.print("</tr><tr>");
			}
			
			}
			
			%>
			
			</tr>
	</table>
	</div>
	<div class="search">
		<form action="./salesCal.adm" name="frm" method="post">
			<div class="year">
				<input type="text" name="year"  placeholder="년">
				<input type="text" name="month"  placeholder="월">
				<input type="submit" id="btn" value="검색">
			</div>
			<div class="submit">
				<input type="button" id="btn" value="월매출 조회" onclick="showPopup1(<%=y%>,<%=m+1%>);" >
			</div>
		</form>
	</div>
</main>
</body>
</html>
<script type="text/javascript">
function showPopup(y,m,i){
	
	window.open("./salesDetail.adm?y="+y+"&m="+m+"&i="+i,"매출상세","width=800, height=600, left=100, top=60"  );
	
}
function showPopup1(y,m){
	window.open("./monthSales.adm?y="+y+"&m="+m,"월매출","width=800, height=600, left=100, top=60")
}
</script>