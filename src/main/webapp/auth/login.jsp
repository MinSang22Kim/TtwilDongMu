<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
    <div class="container">
        <h2>로그인</h2>
        <form action="loginProcess.jsp" method="post">
            <div>
                <label for="loginId">아이디:</label>
                <input type="text" id="loginId" name="loginId" required>
            </div>
            <div>
                <label for="password">비밀번호:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <button type="submit">로그인</button>
            </div>
        </form>
        <p>
            <a href="register.jsp">회원가입</a>
        </p>
    </div>
    <%@ include file="../common/footer.jsp"%>
</body>
</html>
