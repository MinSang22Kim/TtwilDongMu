<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DB 연결 테스트</title>
</head>
<body>
	<%
		Connection conn = null;
		try {
			String dbUrl = "jdbc:mysql://localhost:3306/TtwilDongMu?useSSL=false&serverTimezone=UTC";
	        String dbUser = "root";
	        String dbPassword = "1234";
	        
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		} catch (SQLException ex) {
			out.println("데이터베이스 연결 실패: " + ex.getMessage());
		}
	%>
</body>
</html>
