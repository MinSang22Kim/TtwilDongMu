<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>새 게시글 작성 - 뛸동무 러닝 커뮤니티</title>
<style>
body {
	font-family: 'Pretendard', sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	max-width: 600px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	box-sizing: border-box;
}

h1 {
	text-align: center;
	color: #333;
}

textarea, input[type="file"] {
	width: 100%;
	margin-bottom: 20px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-family: 'Pretendard', sans-serif;
	box-sizing: border-box;
}

textarea {
	height: 350px;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	box-sizing: border-box;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container">
		<h1>새 게시글 작성</h1>
		<form action="processAddPost.jsp" method="post" enctype="multipart/form-data">
			<textarea name="content" placeholder="내용을 입력하세요"></textarea>
			<input type="file" name="image" accept="image/*">
			<button type="submit">게시글 작성</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
