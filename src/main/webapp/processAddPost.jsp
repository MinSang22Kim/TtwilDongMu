<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*, java.io.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 추가</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");

        // 세션에서 로그인된 사용자 ID 확인
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 서버 절대 경로 설정
        String uploadPath = application.getRealPath("/resources/images/posts"); // 실제 파일 저장 경로
        File uploadDir = new File(uploadPath);

        // 디렉토리 확인 및 생성
        if (!uploadDir.exists() && !uploadDir.mkdirs()) {
            out.println("<p>업로드 디렉토리 생성 실패</p>");
            return;
        }

        // 업로드 설정
        int maxFileSize = 5 * 1024 * 1024; // 5MB
        String encoding = "UTF-8";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // 파일 업로드 처리
            MultipartRequest multi = new MultipartRequest(
                request, uploadPath, maxFileSize, encoding, new DefaultFileRenamePolicy()
            );

            // 폼 데이터 처리
            String content = multi.getParameter("content");
            String fileName = multi.getFilesystemName("image"); // 업로드된 파일 이름

            if (content == null || content.trim().isEmpty()) {
                out.println("<p>내용을 입력하세요.</p>");
                return;
            }

            // 데이터베이스 연결
            String dbUrl = "jdbc:mysql://localhost:3306/TtwilDongMu";
            String dbUser = "root";
            String dbPassword = "1234";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // 파일 이름 정리 (특수문자 제거)
            if (fileName != null) {
                fileName = fileName.replaceAll("[^a-zA-Z0-9.]", "_"); // 파일 이름 정리
                File oldFile = new File(uploadPath, multi.getFilesystemName("image"));
                File newFile = new File(uploadPath, fileName);
                if (!oldFile.renameTo(newFile)) {
                    out.println("<p>파일 이름 변경 실패</p>");
                    return;
                }
            }

            // 게시글 데이터 삽입
            String sql = "INSERT INTO posts (user_id, content, image_path) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, content);

            if (fileName != null) {
                // 상대 경로로 저장
                String filePath = "/resources/images/posts/" + fileName; // 상대 경로
                pstmt.setString(3, filePath);
            } else {
                pstmt.setString(3, null); // 이미지 없는 경우
            }

            int result = pstmt.executeUpdate();
            if (result > 0) {
                response.sendRedirect("index.jsp"); // 성공 시 리다이렉트
            } else {
                out.println("<p>게시글 작성 실패</p>");
            }
        } catch (Exception e) {
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));
            out.println("<p>오류 발생:</p>");
            out.println("<pre>" + sw.toString() + "</pre>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ignored) {}
        }
    %>
</body>
</html>
