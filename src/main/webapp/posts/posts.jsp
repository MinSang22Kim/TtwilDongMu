<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.PostsDAO, model.Posts, java.util.*"%>
<%@ include file="../util/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시글</title>
<link rel="stylesheet" type="text/css" href="../resources/css/posts.css">
</head>
<body>
	<%
		List<Posts> postsList = new ArrayList<>();
		try {
			PostsDAO postsDAO = new PostsDAO(conn);
			postsList = postsDAO.getAllPosts();
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>alert('게시글을 불러오는 중 오류가 발생했습니다.');</script>");
		}
	%>
	<h1>전체 게시글</h1>
	<div class="posts-container">
	<%
		for (Posts post : postsList) {
	%>
	<div class="post">
		<h2><a href="viewPost.jsp?id=<%=post.getId()%>">
		   게시글 ID: <%=post.getId()%></a></h2>
		<p>작성자 ID:<%=post.getUserId()%></p>
		<p>내용:<%=post.getContent()%></p>
		<img src="<%=post.getImagePath()%>" alt="이미지" style="max-width: 100%; height: auto;">
		<p>작성 시간:<%=post.getCreatedAt()%></p>
	</div>
	<hr>
	<%
		}
	%>
	</div>
</body>
</html>