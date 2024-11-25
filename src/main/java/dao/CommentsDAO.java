package dao;

import model.Comments;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentsDAO {
    private Connection conn;

    public CommentsDAO(Connection conn) {
        this.conn = conn;
    }

    // 댓글 생성
    public boolean createComment(Comments comment) throws SQLException {
        String sql = "INSERT INTO Comments (postId, userId, content) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, comment.getPostId());
        pstmt.setInt(2, comment.getUserId());
        pstmt.setString(3, comment.getContent());

        return pstmt.executeUpdate() > 0;
    }

    // 특정 게시글의 댓글 조회
    public List<Comments> getCommentsByPostId(int postId) throws SQLException {
        String sql = "SELECT * FROM Comments WHERE postId = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, postId);

        ResultSet rs = pstmt.executeQuery();
        List<Comments> commentsList = new ArrayList<>();
        while (rs.next()) {
            Comments comment = new Comments();
            comment.setId(rs.getInt("id"));
            comment.setPostId(rs.getInt("postId"));
            comment.setUserId(rs.getInt("userId"));
            comment.setContent(rs.getString("content"));
            comment.setCreatedAt(rs.getTimestamp("createdAt"));
            commentsList.add(comment);
        }
        return commentsList;
    }

    // 댓글 삭제
    public boolean deleteComment(int commentId) throws SQLException {
        String sql = "DELETE FROM Comments WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, commentId);

        return pstmt.executeUpdate() > 0;
    }
}
