package model;

public class Users {
    private int id;
    private String userId;
    private String password;
    private String name;
    private String email;
    private String profileImageUrl;

    // Constructor
    public Users() {}

    public Users(int id, String userId, String password, String name, String email, String profileImageUrl) {
        this.id = id;
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.email = email;
        this.profileImageUrl = profileImageUrl;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() { // 수정된 메서드명
        return userId;
    }

    public void setUserId(String userId) { // 수정된 메서드명
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfileImageUrl() {
        return profileImageUrl;
    }

    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl;
    }
}
