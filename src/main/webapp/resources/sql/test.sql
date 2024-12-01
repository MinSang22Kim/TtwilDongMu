-- 전체 테이블 조회 명령어
SELECT * FROM Users;
SELECT * FROM Posts;
SELECT * FROM Comments;
SELECT * FROM Likes;
SELECT * FROM Follow;

-- 전체 테이블 삭제 명령어

-- 외래 키 제약 조건 비활성화
SET FOREIGN_KEY_CHECKS = 0;

-- 각 테이블의 데이터 삭제
DELETE FROM Comments;
DELETE FROM Likes;
DELETE FROM Follow;
DELETE FROM Posts;
DELETE FROM Users;

-- 외래 키 제약 조건 활성화
SET FOREIGN_KEY_CHECKS = 1;

-- 데이터베이스 삭제
DROP DATABASE IF EXISTS TtwilDongMu;

-- 데이터베이스 생성
CREATE DATABASE TtwilDongMu CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 생성된 데이터베이스 사용
USE TtwilDongMu;

-- 테이블들 확인
show tables;

-- 테이블들 조회
SELECT * FROM Users;
SELECT * FROM Posts;
SELECT * FROM Comments;
SELECT * FROM Likes;
SELECT * FROM Follow;
