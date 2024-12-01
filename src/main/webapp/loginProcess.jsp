<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
    <%
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        if (userId == null || userId.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            session.setAttribute("loginError", "아이디와 비밀번호를 모두 입력해주세요.");
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // 'id'를 'user_id'로 수정
            String sql = "SELECT user_id, name, profile_image_url FROM Users WHERE user_id = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("userPrimaryId", rs.getString("user_id")); // 수정
                session.setAttribute("userName", rs.getString("name"));
                session.setAttribute("profileImage", rs.getString("profile_image_url"));

                // 세션 유지 시간 설정
                session.setMaxInactiveInterval(1800); // 30분 유지

                // 사용자 쿠키 설정
                Cookie userCookie = new Cookie("userId", userId);
                userCookie.setMaxAge(30 * 60); // 30분 쿠키 유지
                response.addCookie(userCookie);

                response.sendRedirect("./index.jsp");
            } else {
                session.setAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("loginError", "로그인 처리 중 오류가 발생했습니다. 관리자에게 문의하세요.");
            response.sendRedirect("login.jsp");
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>
