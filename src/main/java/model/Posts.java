package model;

import java.sql.Timestamp;

public class Posts {
    private int id;
    private String userId;
    private String content;
    private String imagePath;
    private Timestamp createdAt;

    public Posts() {}

    public Posts(int id, String userId, String content, String imagePath, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.content = content;
        this.imagePath = imagePath;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
