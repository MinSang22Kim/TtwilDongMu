package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Posts;

public class PostsDAO {
    private Connection conn;

    public PostsDAO(Connection conn) {
        this.conn = conn;
    }

    // CREATE: 게시글 추가
    public boolean addPost(Posts post) throws SQLException {
        String sql = "INSERT INTO Posts (userId, content, imagePath) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, post.getUserId());
            stmt.setString(2, post.getContent());
            stmt.setString(3, post.getImagePath());
            return stmt.executeUpdate() > 0;
        }
    }

    // READ: 모든 게시글 조회
    public List<Posts> getAllPosts() throws SQLException {
        List<Posts> postsList = new ArrayList<>();
        String sql = "SELECT * FROM Posts";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Posts post = new Posts(
                        rs.getInt("id"),
                        rs.getString("userId"),
                        rs.getString("content"),
                        rs.getString("imagePath"),
                        rs.getTimestamp("created_at")
                );
                postsList.add(post);
            }
        }
        return postsList;
    }

    // READ: 특정 게시글 조회 (ID로 조회)
    public Posts getPostById(int postId) throws SQLException {
        String sql = "SELECT * FROM Posts WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Posts(
                            rs.getInt("id"),
                            rs.getString("userId"),
                            rs.getString("content"),
                            rs.getString("imagePath"),
                            rs.getTimestamp("created_at")
                    );
                }
            }
        }
        return null;
    }

    // READ: 랜덤 게시물 가져오기
    public List<Posts> getRandomPosts(int limit) throws SQLException {
        List<Posts> postsList = new ArrayList<>();
        String sql = "SELECT * FROM Posts ORDER BY RAND() LIMIT ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Posts post = new Posts(
                            rs.getInt("id"),
                            rs.getString("userId"),
                            rs.getString("content"),
                            rs.getString("imagePath"),
                            rs.getTimestamp("created_at")
                    );
                    postsList.add(post);
                }
            }
        }
        return postsList;
    }

    public int getNextPostId() throws SQLException {
        String sql = "SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Posts'";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("AUTO_INCREMENT");
            }
        }
        throw new SQLException("Cannot retrieve next post ID.");
    }

    // UPDATE: 게시글 수정
    public boolean updatePost(Posts post) throws SQLException {
        String sql = "UPDATE Posts SET content = ?, imagePath = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, post.getContent());
            stmt.setString(2, post.getImagePath());
            stmt.setInt(3, post.getId());
            return stmt.executeUpdate() > 0;
        }
    }

    // DELETE: 게시글 삭제
    public boolean deletePost(int postId) throws SQLException {
        String sql = "DELETE FROM Posts WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, postId);
            return stmt.executeUpdate() > 0;
        }
    }
}
