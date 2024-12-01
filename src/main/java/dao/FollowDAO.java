package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FollowDAO {
    private Connection conn;

    public FollowDAO(Connection conn) {
        this.conn = conn;
    }

    // 팔로우 추가
    public boolean addFollow(int followerId, int followingId) throws SQLException {
        String sql = "INSERT INTO Follow (follower_id, following_id, created_at) VALUES (?, ?, NOW())";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, followerId);
            pstmt.setInt(2, followingId);
            return pstmt.executeUpdate() > 0;
        }
    }

    // 팔로우 삭제
    public boolean removeFollow(int followerId, int followingId) throws SQLException {
        String sql = "DELETE FROM Follow WHERE follower_id = ? AND following_id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, followerId);
            pstmt.setInt(2, followingId);
            return pstmt.executeUpdate() > 0;
        }
    }

    // 팔로워 목록 조회
    public List<Integer> getFollowers(int userId) throws SQLException {
        String sql = "SELECT follower_id FROM Follow WHERE following_id = ?";
        List<Integer> followers = new ArrayList<>();
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    followers.add(rs.getInt("follower_id"));
                }
            }
        }
        return followers;
    }

    // 팔로잉 목록 조회
    public List<Integer> getFollowing(int userId) throws SQLException {
        String sql = "SELECT following_id FROM Follow WHERE follower_id = ?";
        List<Integer> following = new ArrayList<>();
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    following.add(rs.getInt("following_id"));
                }
            }
        }
        return following;
    }
}
