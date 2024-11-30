<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - 뛸동무</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard-gov.min.css")
	;

body {
	font-family: 'Pretendard', sans-serif;
	background-color: #fafafa;
	margin: 0;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	min-height: 100vh;
}

.container {
	width: 350px;
	margin: auto;
	padding: 20px;
}

.signup-container {
	background-color: white;
	padding: 40px;
	border: 1px solid #dbdbdb;
	text-align: center;
	border-radius: 8px;
	margin-bottom: 15px;
}

.signup-container h1 {
	font-family: 'Pretendard', sans-serif;
	font-size: 36px;
	font-weight: bold;
	margin-bottom: 10px;
}

.signup-container p.subtitle {
	font-size: 14px;
	color: #8e8e8e;
	margin-bottom: 30px;
}

.signup-container form input[type="text"], .signup-container form input[type="password"],
	.signup-container form input[type="email"] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #dbdbdb;
	border-radius: 4px;
	font-size: 14px;
	box-sizing: border-box;
}

.signup-container form button {
	width: 100%;
	padding: 10px;
	background-color: #0095f6;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
	margin-top: 10px;
}

.signup-container form button:hover {
	background-color: #007dc1;
}

.signup-container .divider {
	margin: 20px 0;
	display: flex;
	align-items: center;
}

.signup-container .divider::before, .signup-container .divider::after {
	content: '';
	flex: 1;
	height: 1px;
	background: #dbdbdb;
}

.signup-container .divider span {
	margin: 0 10px;
	color: #8e8e8e;
	font-size: 12px;
}

.signup-footer {
	background: white;
	padding: 15px;
	border: 1px solid #dbdbdb;
	text-align: center;
	border-radius: 8px;
}

.signup-footer p {
	display: inline;
	font-size: 14px;
}

.signup-footer a {
	display: inline;
	color: #0095f6;
	text-decoration: none;
	font-weight: bold;
	margin-left: 5px;
}

@media ( max-width : 600px) {
	.container {
		width: 90%;
		padding: 10px;
	}
	.signup-container, .signup-footer {
		padding: 20px;
	}
	.signup-container h1 {
		font-size: 28px;
	}
	.signup-container form input[type="text"], .signup-container form input[type="password"],
		.signup-container form input[type="email"], .signup-container form button
		{
		width: 100%;
	}
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="signup-container">
			<h1>뛸동무</h1>
			<p class="subtitle">다른 러너들과 함께 하고 싶다면 가입하세요!</p>
			<form action="./registerProcess.jsp" method="post">
				<input type="text" name="loginId" placeholder="아이디" required>
				<input type="password" name="password" placeholder="비밀번호" required>
				<input type="email" name="email" placeholder="이메일" required>
				<input type="text" name="name" placeholder="이름" required>
				<button type="submit">가입</button>
			</form>
		</div>
		<div class="signup-footer">
			<p>계정이 있으신가요?</p>
			<a href="login.jsp">로그인</a>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
