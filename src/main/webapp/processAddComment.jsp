<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 추가</title>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
        // 세션에서 로그인된 사용자 ID 가져오기
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            out.println("<script>alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.'); location.href='login.jsp';</script>");
            return;
        }

        // 요청 데이터 설정
        request.setCharacterEncoding("UTF-8");
        String content = request.getParameter("content");
        int postId = Integer.parseInt(request.getParameter("postId"));
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        PreparedStatement pstmt = null;

        try {
            // 댓글 INSERT 쿼리 준비
            String sql = "INSERT INTO Comments (post_id, user_id, content, created_at) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            pstmt.setString(3, content);
            pstmt.setTimestamp(4, createdAt);

            // 실행 및 결과 확인
            int result = pstmt.executeUpdate();
            if (result > 0) {
                response.sendRedirect("index.jsp"); // 댓글 작성 후 메인 페이지로 이동
            } else {
                out.println("<h3>댓글 추가에 실패했습니다.</h3>");
            }
        } catch (SQLException ex) {
            out.println("<h3>오류 발생: " + ex.getMessage() + "</h3>");
        } finally {
            // 자원 정리
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
