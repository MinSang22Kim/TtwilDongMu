<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지 - 뛸동무</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard-gov.min.css")
	;

body {
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fafafa;
}

.profile-container {
	max-width: 935px;
	margin: 50px auto;
	padding: 0 20px;
	display: flex;
	align-items: center;
}

.profile-picture {
	flex: 1;
	text-align: center;
}

.profile-picture img {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	border: 2px solid #dbdbdb;
}

.profile-info {
	flex: 2;
	padding-left: 20px;
}

.profile-info h1 {
	font-size: 24px;
	margin: 0;
	display: inline-block;
}

.profile-info .settings {
	margin-left: 10px;
	font-size: 18px;
	cursor: pointer;
}

.profile-info .stats {
	margin: 10px 0;
	font-size: 14px;
	color: #8e8e8e;
}

.profile-info .bio {
	font-size: 16px;
	margin-top: 5px;
}

.photo-grid {
	max-width: 935px;
	margin: 20px auto;
	padding: 0 20px;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
}

.photo-grid img {
	width: 100%;
	height: 300px; /* 고정 높이 설정 */
	object-fit: cover; /* 이미지 비율 유지하며 크기에 맞게 자르기 */
	border-radius: 4px;
}

@media ( max-width : 768px) {
	.profile-container {
		flex-direction: column;
		align-items: center;
		text-align: center;
	}
	.profile-info {
		padding-left: 0;
		margin-top: 20px;
	}
	.photo-grid {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media ( max-width : 480px) {
	.photo-grid {
		grid-template-columns: repeat(1, 1fr);
	}
}
</style>
</head>
<body>
<%@ include file="header.jsp"%>
<%
    // 세션에서 userId 확인
    String loggedInUserId = (String) session.getAttribute("userId");

    if (loggedInUserId == null) { // 로그인되지 않은 경우
%>
    <script>
        alert('로그인이 필요합니다.');
        window.location.href = './login.jsp'; // 로그인 페이지로 이동
    </script>
<%
        return; // 이후 JSP 코드 실행 방지
    }
%>
	<div class="profile-container">
		<div class="profile-picture">
			<img src="./resources/images/profile/profile01.jpg"
				alt="Profile Picture">
		</div>
		<div class="profile-info">
			<h1>minji01</h1>
			<i class="fas fa-cog settings"></i>
			<div class="stats">게시물 6 • 팔로잉 3 • 팔로워 2</div>
			<div class="bio">일상 공유</div>
		</div>
	</div>
	<div class="photo-grid">
		<img src="./resources/images/posts/runner01.jpg" alt="Post 1">
		<img src="./resources/images/posts/runner16.jpg" alt="Post 2">
		<img src="./resources/images/posts/runner17.jpg" alt="Post 3">
		<img src="./resources/images/posts/runner18.jpg" alt="Post 4">
		<img src="./resources/images/posts/runner19.jpg" alt="Post 5">
		<img src="./resources/images/posts/runner15.jpg" alt="Post 6">
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
