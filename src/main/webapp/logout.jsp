<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그아웃</title>
</head>
<body>
    <%
        // 세션 무효화
        session.invalidate();

        // 메시지 출력 후 리다이렉트
        out.println("<script>");
        out.println("alert('로그아웃 되었습니다. 로그인 페이지로 이동합니다.');");
        out.println("location.href = 'login.jsp';");
        out.println("</script>");
    %>
</body>
</html>
