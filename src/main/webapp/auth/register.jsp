<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
	<div class="container">
        <h2>회원가입</h2>
        <form action="registerProcess.jsp" method="post">
            <div class="form-group">
                <label for="loginId">아이디:</label>
                <input type="text" id="loginId" name="loginId" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-actions">
                <button type="submit">회원가입</button>
            </div>
        </form>
        <p>
            <a href="login.jsp">로그인</a>
        </p>
    </div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>