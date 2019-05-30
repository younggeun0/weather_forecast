<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>weather forecast</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" style="width: 50%">
		<nav id="navbar-example2" class="navbar navbar-light bg-light rounded">
			<a class="navbar-brand" href="#"><strong>Youngs Weather Forecast😎</strong></a>
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
				<h5 class="card-title">기상 정보🌞</h5>
				<h6 class="card-subtitle mb-2 text-muted">종합</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">오늘</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">내일</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">모레</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">강풍</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">건조</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">해상</h6>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
				<!-- <a href="#" class="card-link">Card link</a> <a href="#"
					class="card-link">Another link</a> -->
			</div>
		</div>
		</c:if>
		
		<!-- 미세먼지정보 메뉴 선택 결과 -->
		<c:if test="${ param.flag eq 'matter' }">
		<div class="card rounded">
			<div class="card-body">
				<h5 class="card-title">미세먼지 정보😷</h5>
				<h6 class="card-subtitle mb-2 text-muted">시간 : 2019-05-27 17시</h6>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">미세먼지(PM10)</h6>
				<p class="card-text">전 권역이 &#039;좋음&#039;∼&#039;보통&#039;으로 예상됨.</p>
				<!-- 좋음, 보통, 나쁨 결과에 따라 다른 이미지를 보여주도록 변경 예정 -->
				<p class="card-text">서울 : 좋음, 제주 : 좋음,전남 : 좋음,전북 : 좋음,광주 : 좋음,경남 : 좋음,경북 : 좋음,울산 : 좋음,대구 : 좋음,부산 : 보통,충남 : 좋음,충북 : 좋음,세종 : 좋음,대전 : 좋음,영동 : 좋음,영서 : 좋음,경기남부 : 좋음,경기북부 : 좋음,인천 : 좋음</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">초미세먼지(PM2.5)</h6>
				<p class="card-text">전 권역이 &#039;좋음&#039;∼&#039;보통&#039;으로 예상됨.</p>
				<p class="card-text">서울 : 보통,제주 : 좋음,전남 : 좋음,전북 : 좋음,광주 : 좋음,경남 : 좋음,경북 : 좋음,울산 : 보통,대구 : 좋음,부산 : 보통,충남 : 좋음,충북 : 좋음,세종 : 좋음,대전 : 좋음,영동 : 좋음,영서 : 좋음,경기남부 : 좋음,경기북부 : 좋음,인천 : 좋음</p>
				<br/>
				<h6 class="card-subtitle mb-2 text-muted">오존(O3)</h6>
				<p class="card-text">전 권역이 &#039;보통&#039;으로 예상됨.</p>
				<p class="card-text">서울 : 보통,제주 : 보통,전남 : 보통,전북 : 보통,광주 : 보통,경남 : 보통,경북 : 보통,울산 : 보통,대구 : 보통,부산 : 보통,충남 : 보통,충북 : 보통,세종 : 보통,대전 : 보통,영동 : 보통,영서 : 보통,경기남부 : 보통,경기북부 : 보통,인천 : 보통</p>
				<br/>
			</div>
		</div>
		</c:if>
	</div>




</body>
</html>