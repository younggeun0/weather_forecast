<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>weather forecast</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		var date = new Date();
		
		// 2019-00-00 형태로 바꿈
		searchDate = date.getFullYear()+"-"
			+(date.getMonth() < 10 ? "0"+(date.getMonth()+1) : date.getMonth())+"-"
			+(date.getDate() < 10 ? "0"+date.getDate() : date.getDate());
		
		// console.log("param으로 보낼 꺼 : "+searchDate);
		
		if(${param.flag eq 'matter'}) { // 미세먼지정보 조회
			$.ajax({
				url:"http://localhost:8080/younggeun0/matter_api.jsp",
				type:"get",
				data:"searchDate="+searchDate,
				dataType:"json",
				async:"true",
				error:function(xhr) {
					console.log(xhr);
					alert("에러코드 : "+xhr.status+", 에러메시지 : "+xhr.statusText);
				},
				success:function(json) {
					// console.log(json.list);
					
					var date = json.list[0].dataTime; // time
					$(".time").text(date);
					
					var overall = json.list[0].informOverall.substring(9); // overall
					$(".overall").text(overall);
					
					var pm10 = json.list[0].informGrade; // pm10
					$("#pm10").html("&nbsp;"+pm10);
					
					var pm25 = json.list[2].informGrade; // pm25
					$("#pm25").html("&nbsp;"+pm25);

					var o3 = json.list[4].informGrade; // o3
					$("#o3").html("&nbsp;"+o3);
				}
			});
		
		} else { // 미세먼지 선택하지 않았을 시 항상 기상정보 조회
			$.ajax({
				url:"http://localhost:8080/younggeun0/weather_api.jsp",
				type:"get",
				async:"true",
				error:function(xhr) {
					console.log(xhr);
					alert("에러코드 : "+xhr.status+", 에러메시지 : "+xhr.statusText);
				},
				success:function(json) {
					var date = json.substring(json.indexOf("tmFc")+6,json.indexOf("wfSv1")-4);
					
					var year = date.substring(0,4);
					var month = date.substring(4,6);
					var day = date.substring(6,8);
					var hour = date.substring(8,10);
					
					var time = year+"-"+month+"-"+day+", "+hour+"시 관측";
					$(".time").text(time);

					var overall = json.substring(json.indexOf("(종합) ")+5, json.indexOf("(오늘)")-6);
					$(".overall").html("&nbsp;"+overall);
					
					var today = json.substring(json.indexOf("(오늘) ")+5, json.indexOf("(내일)")-6);
					$("#today").html("&nbsp;"+today);
					
					var tomorrow = json.substring(json.indexOf("(내일) ")+5, json.indexOf("(모레)")-6);
					$("#tomorrow").html("&nbsp;"+tomorrow);
					
					var dayAfterTomorrow = json.substring(json.indexOf("(모레) ")+5, json.indexOf("예상 강수량")-6);
					$("#dayAfterTomorrow").html("&nbsp;"+dayAfterTomorrow);
				}
			});
		}
	});
</script>
</head>
<body>
	<div class="container" style="width: 50%">
		<nav id="navbar-example2" class="navbar navbar-light bg-light rounded">
			<a class="navbar-brand" href="index.do"><strong>Youngs Weather Forecast😎</strong></a>
			<ul class="nav nav-pills">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">메뉴</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="index.do?flag=weather">기상정보</a> 
						<a class="dropdown-item" href="index.do?flag=matter">미세먼지정보</a>
					</div>
				</li>
			</ul>
		</nav>

		<!-- 기상정보 메뉴 선택 결과 -->
		<c:if test="${ param.flag eq 'weather' }">
		<div class="card rounded">
			<div class="card-body">
				<h5 class="card-title">기상 정보 🌞</h5>
				<h6 class="card-subtitle mb-2 text-muted">시간 : <span class="time"></span></h6>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">종합</h6>
				<p class="overall" class="card-text"></p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">오늘</h6>
				<p id="today" class="card-text"></p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">내일</h6>
				<p id="tomorrow" class="card-text"></p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">모레</h6>
				<p id="dayAfterTomorrow" class="card-text"></p>
			</div>
		</div>
		</c:if>
		
		<!-- 미세먼지정보 메뉴 선택 결과 -->
		<c:if test="${ param.flag eq 'matter' }">
		<div class="card rounded">
			<div class="card-body">
				<h5 class="card-title">미세먼지 정보😷</h5>
				<h6 class="card-subtitle mb-2 text-muted">시간 : <span class="time"></span></h6>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">종합</h6>
				<p class="overall" class="card-text"></p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">미세먼지(PM10)</h6>
				<!-- 좋음, 보통, 나쁨 결과에 따라 다른 이미지를 보여주도록 변경 예정 -->
				<p id="pm10" class="card-text"></p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">초미세먼지(PM2.5)</h6>
				<p id="pm25" class="card-text"></p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">오존(O3)</h6>
				<p id="o3" class="card-text"></p>
			</div>
		</div>
		</c:if>
	</div>




</body>
</html>