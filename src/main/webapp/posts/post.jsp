<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.PostsDAO, model.Posts"%>
<%@ include file="../util/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단일 게시글</title>
<link rel="stylesheet" type="text/css" href="../resources/css/post.css">
</head>
<body>
	<%
		int postId = Integer.parseInt(request.getParameter("id"));
		Posts post = null;
	
		try {
			PostsDAO postsDAO = new PostsDAO(conn);
			post = postsDAO.getPostById(postId);
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>alert('게시글 상세보기 실패.'); history.back();</script>");
		}
	%>
	<%
		if (post != null) {
	%>
	<h1>게시글 상세 보기</h1>
	<div class="post-detail">
		<p>게시글 ID:<%=post.getId()%></p>
		<p>작성자 ID:<%=post.getUserId()%></p>
		<p>내용:<%=post.getContent()%></p>
		<img src="<%=post.getImagePath()%>" alt="이미지" style="max-width: 100%; height: auto;">
		<p>작성 시간:<%=post.getCreatedAt()%></p>
		<a href="../posts.jsp">← 전체 게시글 보기</a>
	</div>
	<%
		} else {
	%>
		<p>존재하지 않는 게시글입니다.</p>
	<%
		}
	%>
</body>
</html>