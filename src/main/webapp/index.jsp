<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Home - 뛸동무 러닝 커뮤니티</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<style>
body {
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
}

.post-container {
	width: 50%;
	margin: auto;
	background-color: #fff;
	border: 1px solid #e1e1e1;
	padding: 20px;
	margin-top: 20px;
}

.post-header, .post-footer {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.user-profile {
	display: flex;
	align-items: center;
}

.user-profile img {
	width: 50px;
	height: 50px;
	border-radius: 25px;
	margin-right: 10px;
}

.post-image img {
	width: 100%;
	height: auto;
}

.post-likes, .post-comments, .comment-area {
	margin-top: 10px;
}

.post-likes i, .post-comments i {
	margin-right: 5px;
}

.comment-area textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #e1e1e1;
	border-radius: 5px;
	resize: none;
}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>

	<%
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        // DB 연결 설정
	        String dbUrl = "jdbc:mysql://localhost:3306/TtwilDongMu";
	        String dbUser = "root";
	        String dbPassword = "1234";

	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	        // 게시글 가져오기
	        String sql = "SELECT p.id AS postId, u.user_id AS loginId, p.content, p.image_path " +
	                     "FROM Posts p JOIN Users u ON p.user_id = u.id ORDER BY p.created_at DESC";
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        // 반복적으로 게시글 출력
	        while (rs.next()) {
	            int postId = rs.getInt("postId");
	            String loginId = rs.getString("loginId");
	            String content = rs.getString("content");
	            String imagePath = rs.getString("image_path");
				
	            // 프로필 이미지 경로 설정
	            String profileImagePath = "./resources/images/profile/profile" + loginId.replaceAll("\\D+", "") + ".jpg";
	%>
	<div class="post-container">
		<div class="post-header">
			<div class="user-profile">
				<img src="<%= profileImagePath %>" alt="User Profile">
				<span>@<%= loginId %></span>
			</div>
			<div>
				<a href="#"><i class="fas fa-ellipsis-h"></i></a>
			</div>
		</div>
		<div class="post-image">
			<img src="<%= request.getContextPath() + imagePath %>" alt="Post Image">
		</div>
		<div class="post-footer">
			<div class="post-likes">
				<i class="far fa-heart" id="like-icon-<%= postId %>" data-post-id="<%= postId %>"></i>
				<span id="like-count-<%= postId %>">0</span> likes
			</div>
			<div class="post-comments">
				<i class="far fa-comment"></i><span> 댓글</span>
			</div>
		</div>
		<div class="comment-area">
			<textarea id="comment-content-<%= postId %>" placeholder="댓글을 입력하세요..."></textarea>
			<button onclick="addComment(<%= postId %>)">댓글 작성</button>
		</div>
	</div>
	<%
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (rs != null) try { rs.close(); } catch (Exception e) {}
	        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
	        if (conn != null) try { conn.close(); } catch (Exception e) {}
	    }
	%>

	<%@ include file="footer.jsp" %>
</body>
</html>
