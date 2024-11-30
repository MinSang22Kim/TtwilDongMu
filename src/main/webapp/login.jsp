<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - 뛸동무</title>
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

.login-container {
	background-color: white;
	padding: 40px;
	border: 1px solid #dbdbdb;
	text-align: center;
	border-radius: 8px;
	margin-bottom: 15px;
}

.login-container h1 {
	font-family: 'Pretendard', sans-serif;
	font-size: 36px;
	font-weight: bold;
	margin-bottom: 30px;
}

.login-container form input[type="text"], .login-container form input[type="password"],
	.login-container form button {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #dbdbdb;
	border-radius: 4px;
	font-size: 14px;
	display: block;
	box-sizing: border-box;
}

.login-container form button {
	background-color: #0095f6;
	color: white;
	border: none;
	cursor: pointer;
}

.login-container form button:hover {
	background-color: #007dc1;
}

.login-container .divider {
	margin: 20px 0;
	display: flex;
	align-items: center;
}

.login-container .divider::before, .login-container .divider::after {
	content: '';
	flex: 1;
	height: 1px;
	background: #dbdbdb;
}

.login-container .divider span {
	margin: 0 10px;
	color: #8e8e8e;
	font-size: 12px;
}

.login-container .google-login {
	display: block;
	color: #385185;
	font-weight: bold;
	margin: 15px 0;
	text-decoration: none;
	font-size: 14px;
	cursor: pointer;
}

.login-container .google-login:hover {
	text-decoration: underline;
}

.login-container .forgot-password {
	margin-top: 15px;
	font-size: 12px;
	color: #00376b;
	text-decoration: none;
}

.signup-container {
	background: white;
	padding: 15px;
	border: 1px solid #dbdbdb;
	text-align: center;
	border-radius: 8px;
}

.signup-container p {
	display: inline;
	margin: 0;
	font-size: 14px;
}

.signup-container a {
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
	.login-container, .signup-container {
		padding: 20px;
	}
	.login-container h1 {
		font-size: 28px;
	}
	.login-container form input[type="text"], .login-container form input[type="password"],
		.login-container form button {
		width: 100%;
	}
}
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const googleLoginButton = document.querySelector(".google-login");
        googleLoginButton.addEventListener("click", function (event) {
            event.preventDefault();
            alert("서비스 준비 중입니다.");
        });
    });
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="login-container">
			<h1>뛸동무</h1>
			<form action="loginProcess.jsp" method="post">
				<input type="text" name="loginId" placeholder="아이디" required>
				<input type="password" name="password" placeholder="비밀번호" required>
				<button type="submit">로그인</button>
			</form>
			<div class="divider">
				<span>또는</span>
			</div>
			<a href="#" class="google-login"> <i class="fab fa-google"></i>
				Google로 로그인
			</a> <a href="#" class="forgot-password">비밀번호를 잊으셨나요?</a>
		</div>
		<div class="signup-container">
			<p>계정이 없으신가요?</p>
			<a href="../auth/register.jsp">가입하기</a>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
