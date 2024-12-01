package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Users;

public class UsersDAO {
	private Connection conn;

	public UsersDAO(Connection conn) {
		this.conn = conn;
	}

	// CREATE: 사용자 추가
	public boolean addUser(Users user) throws SQLException {
	    String sql = "INSERT INTO Users (userId, password, name, email, profileImage) VALUES (?, ?, ?, ?, ?)";
	    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, user.getUserId());
	        stmt.setString(2, user.getPassword());
	        stmt.setString(3, user.getName());
	        stmt.setString(4, user.getEmail());
	        stmt.setString(5, user.getProfileImageUrl());
	        return stmt.executeUpdate() > 0;
	    }
	}


	// READ: 모든 사용자 조회
	public List<Users> getAllUsers() throws SQLException {
		List<Users> usersList = new ArrayList<>();
		String sql = "SELECT * FROM Users";
		try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				Users user = new Users(rs.getString("userId"), rs.getString("password"),
						rs.getString("name"), rs.getString("email"), rs.getString("profileImage"));
				usersList.add(user);
			}
		}
		return usersList;
	}

	// READ: 특정 사용자 조회 (userId로 조회)
	public Users getUserByUserId(String userId) throws SQLException {
		String sql = "SELECT * FROM Users WHERE userId = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, userId);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					return new Users(rs.getString("userId"), rs.getString("password"),
							rs.getString("name"), rs.getString("email"), rs.getString("profileImage"));
				}
			}
		}
		return null;
	}

	// UPDATE: 사용자 정보 수정
	public boolean updateUser(Users user) throws SQLException {
		String sql = "UPDATE Users SET password = ?, name = ?, email = ?, profileImage = ? WHERE userId = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, user.getPassword());
			stmt.setString(2, user.getName());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getProfileImageUrl());
			stmt.setString(5, user.getUserId());
			return stmt.executeUpdate() > 0;
		}
	}

	// DELETE: 사용자 삭제
	public boolean deleteUser(String userId) throws SQLException {
		String sql = "DELETE FROM Users WHERE userId = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, userId);
			return stmt.executeUpdate() > 0;
		}
	}
}
