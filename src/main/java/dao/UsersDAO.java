package dao;

import model.Users;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsersDAO {
    private Connection conn;

    public UsersDAO(Connection conn) {
        this.conn = conn;
    }

    // CREATE: 사용자 추가
    public boolean addUser(Users user) throws SQLException {
        String sql = "INSERT INTO Users (loginId, password, name, email) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getLoginId());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getName());
            stmt.setString(4, user.getEmail());
            return stmt.executeUpdate() > 0;
        }
    }

    // READ: 모든 사용자 조회
    public List<Users> getAllUsers() throws SQLException {
        List<Users> usersList = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Users user = new Users(
                        rs.getInt("id"),
                        rs.getString("loginId"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("email")
                );
                usersList.add(user);
            }
        }
        return usersList;
    }

    // READ: 특정 사용자 조회 (loginId로 조회)
    public Users getUserByLoginId(String loginId) throws SQLException {
        String sql = "SELECT * FROM Users WHERE loginId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, loginId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Users(
                            rs.getInt("id"),
                            rs.getString("loginId"),
                            rs.getString("password"),
                            rs.getString("name"),
                            rs.getString("email")
                    );
                }
            }
        }
        return null;
    }

    // UPDATE: 사용자 정보 수정
    public boolean updateUser(Users user) throws SQLException {
        String sql = "UPDATE Users SET password = ?, name = ?, email = ? WHERE loginId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getPassword());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getLoginId());
            return stmt.executeUpdate() > 0;
        }
    }

    // DELETE: 사용자 삭제
    public boolean deleteUser(String loginId) throws SQLException {
        String sql = "DELETE FROM Users WHERE loginId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, loginId);
            return stmt.executeUpdate() > 0;
        }
    }
}
