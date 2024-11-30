-- Users 테이블 더미 데이터
INSERT INTO Users (user_id, password, name, email, profile_image_url) VALUES
('user01', '1234', '김민지', 'minji01@example.com', '/resources/images/profile/profile01.jpg'),
('user02', '1234', '이준호', 'junho02@example.com', '/resources/images/profile/profile02.jpg'),
('user03', '1234', '박소영', 'soyoung03@example.com', '/resources/images/profile/profile03.jpg'),
('user04', '1234', '정우성', 'woosung04@example.com', '/resources/images/profile/profile04.jpg'),
('user05', '1234', '최유리', 'yuri05@example.com', '/resources/images/profile/profile05.jpg'),
('user06', '1234', '한지민', 'jimin06@example.com', '/resources/images/profile/profile06.jpg'),
('user07', '1234', '오세훈', 'sehun07@example.com', '/resources/images/profile/profile07.jpg'),
('user08', '1234', '서지수', 'jisu08@example.com', '/resources/images/profile/profile08.jpg'),
('user09', '1234', '장예은', 'yeeun09@example.com', '/resources/images/profile/profile09.jpg'),
('user10', '1234', '김태형', 'taehyung10@example.com', '/resources/images/profile/profile10.jpg');

-- Posts 테이블 더미 데이터
INSERT INTO Posts (user_id, content, image_path) VALUES
(1, '오늘은 공원에서 러닝을 즐겼어요!', '/resources/images/post/runner01.jpg'),
(2, '새로운 러닝화를 신고 첫 러닝! 너무 편해요.', '/resources/images/post/runner02.jpg'),
(3, '오랜만에 새벽 러닝! 상쾌하네요.', '/resources/images/post/runner03.jpg'),
(4, '러닝 후에 먹는 아침 식사가 최고입니다.', '/resources/images/post/runner04.jpg'),
(5, '달리기하며 찍은 풍경 사진 공유합니다!', '/resources/images/post/runner05.jpg'),
(6, '도심 속에서도 러닝의 즐거움!', '/resources/images/post/runner06.jpg'),
(7, '오늘은 5km를 달렸어요. 기록 갱신!', '/resources/images/post/runner07.jpg'),
(8, '친구들과 함께한 단체 러닝.', '/resources/images/post/runner08.jpg'),
(9, '달리면서 마주친 아름다운 해질녘 풍경.', '/resources/images/post/runner09.jpg'),
(10, '러닝 후에 스트레칭도 잊지 마세요!', '/resources/images/post/runner10.jpg');

-- Comments 테이블 더미 데이터
INSERT INTO Comments (post_id, user_id, content) VALUES
(1, 2, '저도 이 공원 자주 가요!'),
(1, 3, '풍경이 너무 아름답네요!'),
(2, 4, '러닝화 정보 좀 알려주세요.'),
(3, 5, '새벽 러닝, 정말 멋져요!'),
(4, 6, '아침 식사 메뉴가 궁금해요!'),
(5, 7, '풍경 사진 정말 멋지네요.'),
(6, 8, '도심 속 러닝! 저도 해보고 싶어요.'),
(7, 9, '기록 갱신 축하드려요!'),
(8, 10, '단체 러닝 즐거워 보이네요.'),
(9, 1, '해질녘 사진 감동이에요.');

-- Likes 테이블 더미 데이터
INSERT INTO Likes (post_id, user_id) VALUES
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 1),
(10, 2),
(10, 3);

-- Follow 테이블 더미 데이터
INSERT INTO Follow (follower_id, following_id) VALUES
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(10, 1);

-- 테이블들 조회
SELECT * FROM Users;
SELECT * FROM Posts;
SELECT * FROM Comments;
SELECT * FROM Likes;
SELECT * FROM Follow;
