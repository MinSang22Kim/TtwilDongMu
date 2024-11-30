<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
    <style>
        .post-list-container {
            width: 70%;
            margin: auto;
            background-color: #f9f9f9;
            border: 1px solid #e1e1e1;
            padding: 20px;
            margin-top: 20px;
            font-family: Arial, sans-serif;
        }

        .post-item {
            border-bottom: 1px solid #e1e1e1;
            padding: 10px 0;
        }

        .post-item:last-child {
            border-bottom: none;
        }

        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .post-content {
            margin-top: 10px;
        }

        .post-link {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .post-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">게시물 목록</h1>
    <div class="post-list-container">
        <%
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                // 게시물 데이터 가져오기
                String sql = "SELECT id, user_id, content, image_path, created_at FROM Posts ORDER BY created_at DESC";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
        %>
        <div class="post-item">
            <div class="post-header">
                <h3>게시물 ID: <%= rs.getInt("id") %></h3>
                <small>작성자 ID: <%= rs.getInt("user_id") %></small>
            </div>
            <div class="post-content">
                <p><%= rs.getString("content") %></p>
            </div>
            <a href="post.jsp?id=<%= rs.getInt("id") %>" class="post-link">상세 보기</a>
            <small style="display: block; margin-top: 10px;">작성일: <%= rs.getTimestamp("created_at") %></small>
        </div>
        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>오류 발생: " + e.getMessage() + "</h3>");
            } finally {
                // 자원 해제
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
            }
        %>
    </div>
</body>
</html>
