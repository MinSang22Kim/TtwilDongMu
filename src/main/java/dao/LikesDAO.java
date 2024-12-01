package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikesDAO {
    private Connection conn;

    public LikesDAO(Connection conn) {
        this.conn = conn;
    }

    // 좋아요 추가 또는 삭제
    public boolean toggleLike(int postId, int userId) throws SQLException {
        String checkSql = "SELECT COUNT(*) FROM Likes WHERE post_id = ? AND user_id = ?";
        PreparedStatement checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setInt(1, postId);
        checkStmt.setInt(2, userId);
        ResultSet rs = checkStmt.executeQuery();

        if (rs.next() && rs.getInt(1) > 0) {
            // 좋아요가 이미 존재 -> 삭제
            String deleteSql = "DELETE FROM Likes WHERE post_id = ? AND user_id = ?";
            PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
            deleteStmt.setInt(1, postId);
            deleteStmt.setInt(2, userId);
            return deleteStmt.executeUpdate() > 0;
        } else {
            // 좋아요 추가
            String insertSql = "INSERT INTO Likes (post_id, user_id) VALUES (?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setInt(1, postId);
            insertStmt.setInt(2, userId);
            return insertStmt.executeUpdate() > 0;
        }
    }

    // 특정 게시글의 좋아요 개수 가져오기
    public int getLikesCountByPostId(int postId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Likes WHERE post_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, postId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    // 특정 사용자가 특정 게시물을 좋아요했는지 확인
    public boolean isUserLikedPost(int postId, int userId) throws SQLException {
        String query = "SELECT COUNT(*) FROM Likes WHERE post_id = ? AND user_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // 좋아요가 존재하면 true 반환
                }
            }
        }
        return false; // 기본값으로 false 반환
    }

}
