<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결</title>
</head>
<body>
	<%
		Connection conn = null;
		String dbUrl = "jdbc:mysql://localhost:3306/TtwilDongMu?useSSL=false&serverTimezone=UTC";
		String dbUser = "root";
		String dbPassword = "1234";
	
		if (conn == null || conn.isClosed()) {
			try {
				dbUrl = "jdbc:mysql://localhost:3306/TtwilDongMu?useSSL=false&serverTimezone=UTC";
				dbUser = "root";
				dbPassword = "1234";
	
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
				application.setAttribute("DBConnection", conn);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>