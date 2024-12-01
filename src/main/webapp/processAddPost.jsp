<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 추가</title>
    <script>
        function redirectToLogin() {
            alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
            location.href = 'login.jsp';
        }
    </script>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");

        // 세션에서 로그인된 사용자 ID 가져오기
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            out.println("<script>redirectToLogin();</script>");
            return;
        }

        // 이미지 저장 경로 및 설정
        String path = application.getRealPath("./resources/images/posts");
        File uploadDir = new File(path);
        if (!uploadDir.exists() && !uploadDir.mkdirs()) {
            out.println("<p>이미지 디렉토리를 생성할 수 없습니다.</p>");
            return;
        }

        int maxSize = 5 * 1024 * 1024; // 최대 파일 크기 5MB
        String encType = "utf-8";

        try {
            MultipartRequest multi = new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());

            // 폼 데이터 가져오기
            String content = multi.getParameter("content");
            String fileName = multi.getFilesystemName("image");

            if (content == null || content.trim().isEmpty()) {
                out.println("<p>내용을 입력하세요.</p>");
                return;
            }

            // 게시글 데이터 삽입
            String sql = "INSERT INTO posts (user_id, content, image_path) VALUES (?, ?, ?)";
            PreparedStatement pstmt = null;

            try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                pstmt.setString(2, content);

                // 파일 경로 처리
                if (fileName != null) {
                    String newFileName = "runner" + System.currentTimeMillis() + ".jpg";
                    File oldFile = new File(path, fileName);
                    File newFile = new File(path, newFileName);

                    if (oldFile.renameTo(newFile)) {
                        pstmt.setString(3, "resources/images/posts/" + newFileName);
                    } else {
                        pstmt.setString(3, null); // 파일 저장 실패 시 null 저장
                    }
                } else {
                    pstmt.setString(3, null); // 파일 없을 경우
                }

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    response.sendRedirect("index.jsp"); // 게시글 작성 후 리다이렉트
                } else {
                    out.println("<p>게시글 작성에 실패했습니다.</p>");
                }
            } finally {
                if (pstmt != null) pstmt.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>게시글 작성 중 오류가 발생했습니다.</p>");
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception ignore) {}
        }
    %>
</body>
</html>
