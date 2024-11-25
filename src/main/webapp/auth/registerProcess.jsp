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
	    String name = request.getParameter("name");
	
	    try {
	        // 중복 선언 제거: `Connection conn` 선언하지 않음
	        String sql = "INSERT INTO Users (loginId, password, name) VALUES (?, ?, ?)";
	        PreparedStatement pstmt = conn.prepareStatement(sql); // `conn`은 dbconn.jsp에서 선언됨
	        pstmt.setString(1, loginId);
	        pstmt.setString(2, password);
	        pstmt.setString(3, name);
	
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