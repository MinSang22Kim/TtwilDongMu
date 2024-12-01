<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
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
	max-width: 500px;
	margin: auto;
	background-color: #fff;
	border: 1px solid #e1e1e1;
	padding: 20px;
	margin-top: 20px;
}

.post-content {
	margin-top: 10px;
	font-size: 16px;
	color: #333;
	line-height: 1.5;
	word-wrap: break-word;
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
	margin-top: 10px;
}

.post-likes, .post-comments, .comment-area {
	margin-top: 10px;
}

.post-likes i, .post-comments i {
	margin-right: 5px;
}

.comment-area {
	display: flex;
	align-items: center;
	margin-top: 10px;
}

.comment-area textarea {
	flex: 1;
	padding: 10px;
	border: 1px solid #e1e1e1;
	border-radius: 5px;
	resize: none;
	margin-right: 10px;
}

.comment-area button {
    padding: 15px 20px; /* 버튼 크기 조정 */
    border: none;
    background-color: #007bff;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px; /* 글씨 크기 증가 */
    height: auto; /* 버튼 높이 자동 */
}

.comment-area button:hover {
    background-color: #0056b3;
}

.all-comments {
    margin-top: 10px;
    padding: 5px; /* 댓글 영역 내부 간격 축소 */
    border-left: 2px solid #e1e1e1;
    display: block;
    background-color: #f7f7f7; /* 배경색 유지 */
    border-radius: 5px;
    max-height: 200px; /* 최대 높이 설정 */
    overflow-y: auto; /* 스크롤 추가 */
}

.comment {
    margin-bottom: 5px;
    font-size: 14px;
    line-height: 1.4; /* 줄 간격 조정 */
    background-color: #ffffff;
    padding: 5px; /* 댓글 내부 간격 축소 */
    border-radius: 5px;
    box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}
</style>
<script>
	function toggleComments(postId) {
	    const commentSection = document.getElementById(`comments-${postId}`);
	    if (commentSection) {
	        commentSection.style.display =
	            commentSection.style.display === "block" ? "none" : "block";
	    }
	}
	
	function toggleLike(postId) {
	    fetch('./toggleLike', {
	        method: 'POST',
	        headers: { 'Content-Type': 'application/json' },
	        body: JSON.stringify({ postId: postId })
	    })
	    .then(response => response.json())
	    .then(data => {
	        if (data.success) {
	            const likeIcon = document.getElementById(`like-icon-${postId}`);
	            const likeCount = document.getElementById(`like-count-${postId}`);
	            if (data.liked) {
	                likeIcon.classList.remove('far');
	                likeIcon.classList.add('fas');
	            } else {
	                likeIcon.classList.remove('fas');
	                likeIcon.classList.add('far');
	            }
	            likeCount.textContent = data.likeCount;
	        }
	    })
	    .catch(error => console.error('Error:', error));
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement allCommentsStmt = null;
	ResultSet allCommentsRs = null;
	PreparedStatement likeCountStmt = null;
	ResultSet likeCountRs = null;

	try {
		String dbUrl = "jdbc:mysql://localhost:3306/TtwilDongMu";
		String dbUser = "root";
		String dbPassword = "1234";

		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		String sql = "SELECT p.id AS postId, u.user_id AS userId, u.profile_image_url, p.content, p.image_path "
		+ "FROM Posts p " + "JOIN Users u ON p.user_id = u.user_id " + "ORDER BY p.created_at DESC";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		String commentSql = "SELECT c.content, u.user_id " + "FROM Comments c " + "JOIN Users u ON c.user_id = u.user_id "
		+ "WHERE c.post_id = ? " + "ORDER BY c.created_at ASC";
		allCommentsStmt = conn.prepareStatement(commentSql);

		String likeCountSql = "SELECT COUNT(*) AS likeCount FROM Likes WHERE post_id = ?";
		likeCountStmt = conn.prepareStatement(likeCountSql);

		while (rs.next()) {
			int postId = rs.getInt("postId");
			String userId = rs.getString("userId");
			String profileImageUrl = rs.getString("profile_image_url");
			String content = rs.getString("content");
			String imagePath = rs.getString("image_path");

			// 유저의 프로필 이미지 URL 가져오기
			String profileImagePath = profileImageUrl != null ? profileImageUrl : "./resources/images/profile/default.jpg";

			likeCountStmt.setInt(1, postId);
			likeCountRs = likeCountStmt.executeQuery();
			int likeCount = 0;
			if (likeCountRs.next()) {
		likeCount = likeCountRs.getInt("likeCount");
			}
	%>
	<div class="post-container">
		<div class="post-header">
			<div class="user-profile">
				<a href="./myprofile.jsp?userId=<%=userId%>"> <img
					src="<%=request.getContextPath() + profileImagePath%>"
					alt="User Profile">
				</a> <span><%=userId%></span>
			</div>
			<div>
				<a href="#"><i class="fas fa-ellipsis-h"></i></a>
			</div>
		</div>
		<div class="post-image">
			<img src="<%=request.getContextPath() + imagePath%>" alt="Post Image">
		</div>
		<div class="post-content">
			<p><%=content%></p>
		</div>
		<div class="post-footer">
			<div class="post-likes">
				<i class="far fa-heart" id="like-icon-<%=postId%>"
					data-post-id="<%=postId%>" onclick="toggleLike(<%=postId%>)"></i> <span
					id="like-count-<%=postId%>"><%=likeCount%></span> likes
			</div>
			<div class="post-comments">
				<i class="far fa-comment"></i> <span class="toggle-comments"
					onclick="toggleComments(<%=postId%>)"> 댓글</span>
			</div>
		</div>
		<div class="all-comments" id="comments-<%=postId%>">
			<%
			allCommentsStmt.setInt(1, postId);
			allCommentsRs = allCommentsStmt.executeQuery();
			while (allCommentsRs.next()) {
				String commentUser = allCommentsRs.getString("user_id");
				String commentContent = allCommentsRs.getString("content");
			%>
			<div class="comment">
				<strong><%=commentUser%>:</strong>
				<%=commentContent%>
			</div>
			<%
			}
			%>
		</div>
		<div class="comment-area">
			<textarea id="comment-content-<%=postId%>" placeholder="댓글을 입력하세요..."></textarea>
			<button onclick="addComment(<%=postId%>)">댓글 작성</button>
		</div>
	</div>

	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	if (allCommentsRs != null)
	try {
		allCommentsRs.close();
	} catch (Exception e) {
	}
	if (likeCountRs != null)
	try {
		likeCountRs.close();
	} catch (Exception e) {
	}
	if (allCommentsStmt != null)
	try {
		allCommentsStmt.close();
	} catch (Exception e) {
	}
	if (likeCountStmt != null)
	try {
		likeCountStmt.close();
	} catch (Exception e) {
	}
	if (rs != null)
	try {
		rs.close();
	} catch (Exception e) {
	}
	if (pstmt != null)
	try {
		pstmt.close();
	} catch (Exception e) {
	}
	if (conn != null)
	try {
		conn.close();
	} catch (Exception e) {
	}
	}
	%>
	<%@ include file="footer.jsp"%>
</body>
</html>