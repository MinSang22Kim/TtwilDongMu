<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String loginId = request.getParameter("loginId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String profileImageUrl = request.getParameter("profileImageUrl");

	// 기본값 설정
	if (profileImageUrl == null || profileImageUrl.trim().isEmpty()) {
		profileImageUrl = "/resources/images/profile/default.jpg";
	}

	try {
		// 비밀번호 해시화 (BCrypt 사용 예)
		/* String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt()); */

		String sql = "INSERT INTO User (login_id, password, name, email, profile_image_url) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, loginId);
		// pstmt.setString(2, hashedPassword);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		pstmt.setString(5, profileImageUrl);

		int result = pstmt.executeUpdate();

		if (result > 0) {
			out.println("<script>");
			out.println("alert('회원가입이 성공적으로 완료되었습니다.');");
			out.println("location.href='login.jsp';");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원가입에 실패했습니다. 다시 시도해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
	} catch (SQLIntegrityConstraintViolationException e) {
		// 중복 ID 또는 이메일 처리
		out.println("<script>");
		out.println("alert('이미 사용 중인 아이디나 이메일입니다. 다시 시도해주세요.');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>");
		out.println("alert('회원가입 처리 중 오류가 발생했습니다. 관리자에게 문의하세요.');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
	}
	%>
</body>
</html>
