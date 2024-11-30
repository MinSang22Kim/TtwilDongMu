<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Like Process</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
    // 세션에서 로그인 사용자 확인
    Object userId = session.getAttribute("loginId");

    if (userId == null) {
        out.println("<script>");
        out.println("alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');");
        out.println("location.href='login.jsp';");
        out.println("</script>");
    } else {
        int postId = Integer.parseInt(request.getParameter("postId"));
        try {
            String sql = "INSERT INTO `Like` (post_id, user_id) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            pstmt.setInt(2, (int) userId);

            int result = pstmt.executeUpdate();
            if (result > 0) {
                out.println("<script>");
                out.println("alert('좋아요를 눌렀습니다!');");
                out.println("history.back();");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('좋아요 처리에 실패했습니다.');");
                out.println("history.back();");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>");
            out.println("alert('좋아요 처리 중 오류가 발생했습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
    }
%>
<%@ include file="footer.jsp" %>
</body>
</html>
