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
		// 입력받은 아이디와 비밀번호 가져오기
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");

		try {
			// 사용자 정보 확인 쿼리
			String sql = "SELECT * FROM User WHERE login_id = ? AND password = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginId);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				// 사용자 정보를 세션에 저장
				session.setAttribute("userId", rs.getInt("id"));
				session.setAttribute("userName", rs.getString("name"));
				session.setAttribute("loginId", rs.getString("login_id"));
				session.setAttribute("profileImage", rs.getString("profile_image_url"));

				// 메인 페이지로 이동
				response.sendRedirect("./index.jsp");
			} else {
				// 로그인 실패 시 알림 후 이전 페이지로 이동
				out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); history.back();</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<script>alert('로그인 처리 중 오류가 발생했습니다. 관리자에게 문의하세요.'); history.back();</script>");
		}
	%>
</body>
</html>
