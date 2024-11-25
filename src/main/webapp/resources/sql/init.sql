-- 회원 테이블 생성
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    loginId VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 게시글 테이블 생성
CREATE TABLE Posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    content TEXT,
    imagePath VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES Users(id) ON DELETE CASCADE
);

-- 댓글 테이블 생성
CREATE TABLE Comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    postId INT NOT NULL,
    userId INT NOT NULL,
    content TEXT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (postId) REFERENCES Posts(id),
    FOREIGN KEY (userId) REFERENCES Users(id)
);

-- 좋아요 테이블 생성
CREATE TABLE Likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    postId INT NOT NULL,
    userId INT NOT NULL,
    FOREIGN KEY (postId) REFERENCES Posts(id),
    FOREIGN KEY (userId) REFERENCES Users(id)
);
