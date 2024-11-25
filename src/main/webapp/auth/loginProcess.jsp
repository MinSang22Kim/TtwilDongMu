<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../util/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
	
		try {
			String sql = "SELECT * FROM Users WHERE loginId = ? AND password = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, loginId);
			pstmt.setString(2, password);
	
			ResultSet rs = pstmt.executeQuery();
	
			if (rs.next()) {
				session.setAttribute("user", rs.getString("name"));
				response.sendRedirect("index.jsp");
			} else {
				out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.'); history.back();</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<script>alert('로그인 처리 중 오류가 발생했습니다.'); history.back();</script>");
		}
	%>
</body>
</html>