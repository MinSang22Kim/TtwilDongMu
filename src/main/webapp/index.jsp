<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뛸동무 - 러닝 커뮤니티</title>
<link rel="stylesheet" type="text/css" href="../resources/css/index.css">
</head>
<body>
	<div class="hero">
		<h1>함께 달리며, 도전하고, 나누는 공간</h1>
		<p>러너들의 커뮤니티에 오신 것을 환영합니다!</p>
		<a href="../auth/login.jsp" class="cta-button">로그인</a> <a
			href="../auth/register.jsp" class="cta-button">회원가입</a>
	</div>

	<div class="features">
		<h2>뛸동무 주요 기능</h2>
		<div class="feature-item">
			<h3>기록</h3>
			<p>개인 러닝 기록을 업로드하고 통계를 확인하세요.</p>
		</div>
		<div class="feature-item">
			<h3>소통 공간</h3>
			<p>댓글과 좋아요로 다른 러너들과 교류하세요.</p>
		</div>
		<div class="feature-item">
			<h3>이벤트</h3>
			<p>러닝 모임 및 챌린지에 참가해보세요.</p>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
