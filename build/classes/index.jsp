<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<%@ include file="../common/header.jsp"%>
	<div class="post-container">
		<div class="post-header">
			<div class="user-profile">
				<img src="./resources/images/profile/profile01.jpg"
					alt="User Profile"> <span>@username</span>
			</div>
			<div>
				<a href="#"><i class="fas fa-ellipsis-h"></i></a>
			</div>
		</div>
		<div class="post-image">
			<img src="./resources/images/posts/runner01.jpg" alt="Post Image">
		</div>
		<div class="post-footer">
			<div class="post-likes">
				<i class="far fa-heart" id="like-icon-1" data-post-id="1"></i> <span
					id="like-count-1">1</span> likes
			</div>
			<div class="post-comments">
				<i class="far fa-comment"></i><span>3 comments</span>
			</div>
		</div>
		<div class="comment-area">
			<textarea id="comment-content-1" placeholder="Add a comment..."></textarea>
			<button onclick="addComment(1)">댓글 작성</button>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>
