package model;

public class Likes {
    private int id; // 좋아요 ID
    private int postId; // 좋아요를 누른 게시글 ID
    private int userId; // 좋아요를 누른 사용자 ID

    // Constructor
    public Likes() {}

    public Likes(int id, int postId, int userId) {
        this.id = id;
        this.postId = postId;
        this.userId = userId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
