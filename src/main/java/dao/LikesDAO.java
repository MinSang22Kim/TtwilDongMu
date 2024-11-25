package dao;

import model.Likes;
import java.sql.*;

public class LikesDAO {
    private Connection conn;

    public LikesDAO(Connection conn) {
        this.conn = conn;
    }

    // 좋아요 추가
    public boolean addLike(Likes like) throws SQLException {
        String sql = "INSERT INTO Likes (postId, userId) VALUES (?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, like.getPostId());
        pstmt.setInt(2, like.getUserId());

        return pstmt.executeUpdate() > 0;
    }

    // 특정 게시글의 좋아요 개수
    public int getLikesCountByPostId(int postId) throws SQLException {
        String sql = "SELECT COUNT(*) AS likeCount FROM Likes WHERE postId = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, postId);

        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            return rs.getInt("likeCount");
        }
        return 0;
    }

    // 좋아요 삭제
    public boolean removeLike(int postId, int userId) throws SQLException {
        String sql = "DELETE FROM Likes WHERE postId = ? AND userId = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, postId);
        pstmt.setInt(2, userId);

        return pstmt.executeUpdate() > 0;
    }
}
