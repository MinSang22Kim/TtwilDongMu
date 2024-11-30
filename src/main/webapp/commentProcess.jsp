<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post 데이터 삽입</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("UTF-8");

	String content = request.getParameter("content");
	String imagePath = request.getParameter("imagePath");
	int userId = Integer.parseInt(request.getParameter("userId"));
	Timestamp createdAt = new Timestamp(System.currentTimeMillis());

	PreparedStatement pstmt = null;

	try {
		// INSERT 쿼리 준비
		String sql = "INSERT INTO Post (user_id, content, image_path, created_at) VALUES (?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, userId);
		pstmt.setString(2, content);
		pstmt.setString(3, imagePath);
		pstmt.setTimestamp(4, createdAt);

		int result = pstmt.executeUpdate();

		if (result > 0) {
			out.println("<h3>Post 데이터 삽입이 성공적으로 완료되었습니다.</h3>");
		} else {
			out.println("<h3>Post 데이터 삽입에 실패했습니다.</h3>");
		}
	} catch (SQLException ex) {
		out.println("<h3>오류 발생: " + ex.getMessage() + "</h3>");
	} finally {
		if (pstmt != null)
			try {
		pstmt.close();
			} catch (SQLException ex) {
		ex.printStackTrace();
			}
	}
	%>
</body>
</html>
