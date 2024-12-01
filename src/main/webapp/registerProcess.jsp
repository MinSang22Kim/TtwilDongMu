<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String userId = request.getParameter("userId").trim();
	String password = request.getParameter("password").trim();
	String name = request.getParameter("name").trim();
	String email = request.getParameter("email").trim();
	String profileImageUrl = request.getParameter("profileImageUrl");

	// 기본값 설정
	if (profileImageUrl == null || profileImageUrl.trim().isEmpty()) {
		profileImageUrl = "/resources/images/profile/default.jpg";
	}

	// 유효성 검사
	if (userId == null || userId.isEmpty()) {
		out.println("<script>");
		out.println("alert('아이디를 입력해주세요.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}

	if (password == null || password.isEmpty()) {
		out.println("<script>");
		out.println("alert('비밀번호를 입력해주세요.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}

	if (name == null || name.isEmpty()) {
		out.println("<script>");
		out.println("alert('이름을 입력해주세요.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}

	if (email == null || email.isEmpty()) {
		out.println("<script>");
		out.println("alert('이메일을 입력해주세요.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}

	// 비밀번호 유효성 검사 (영어와 숫자를 포함해야 함)
	String passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"; // 최소 8자, 영어와 숫자 포함
	if (!password.matches(passwordRegex)) {
		out.println("<script>");
		out.println("alert('비밀번호는 최소 8자 이상이며 영어와 숫자를 포함해야 합니다.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}

	try {
		// 중복 확인
		String checkSql = "SELECT COUNT(*) FROM Users WHERE user_id = ? OR email = ?";
		PreparedStatement checkPstmt = conn.prepareStatement(checkSql);
		checkPstmt.setString(1, userId);
		checkPstmt.setString(2, email);

		ResultSet rs = checkPstmt.executeQuery();
		rs.next();
		int count = rs.getInt(1);

		if (count > 0) {
			out.println("<script>");
			out.println("alert('이미 사용 중인 아이디입니다!');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}

		// 회원가입 SQL 실행
		String sql = "INSERT INTO Users (user_id, password, name, email, profile_image_url) VALUES (?, ?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
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
		pstmt.close();
		rs.close();
		checkPstmt.close();

	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>");
		out.println("alert('회원가입 처리 중 오류가 발생했습니다. 관리자에게 문의하세요.');");
		out.println("history.back();");
		out.println("</script>");
	}
	%>
</body>
</html>
