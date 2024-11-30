<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.FollowDAO" %>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팔로우 처리</title>
</head>
<body>
    <%
        // 데이터 가져오기
        int followerId = Integer.parseInt(request.getParameter("followerId"));
        int followingId = Integer.parseInt(request.getParameter("followingId"));
        boolean isFollow = Boolean.parseBoolean(request.getParameter("isFollow"));

        boolean success = false;

        if (conn != null) {
            FollowDAO followDAO = new FollowDAO(conn);
            try {
                if (isFollow) {
                    // 팔로우 추가
                    success = followDAO.addFollow(followerId, followingId);
                } else {
                    // 팔로우 삭제
                    success = followDAO.removeFollow(followerId, followingId);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            out.println("<script>alert('DB 연결 실패.'); history.back();</script>");
        }

        // 성공 여부에 따라 메시지 표시
        if (success) {
            out.println("<script>alert('처리가 완료되었습니다.'); location.href='profile.jsp?userId=" + followingId + "';</script>");
        } else {
            out.println("<script>alert('처리 중 오류가 발생했습니다.'); history.back();</script>");
        }
    %>
</body>
</html>
