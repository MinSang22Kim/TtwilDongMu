-- Users 테이블 더미 데이터
INSERT INTO Users (user_id, password, name, email, profile_image_url) VALUES
('minji01', '1234', '김민지', 'minji01@example.com', '/resources/images/profile/profile01.jpg'),
('junho02', '1234', '이준호', 'junho02@example.com', '/resources/images/profile/profile02.jpg'),
('soyoung03', '1234', '박소영', 'soyoung03@example.com', '/resources/images/profile/profile03.jpg'),
('woosung04', '1234', '정우성', 'woosung04@example.com', '/resources/images/profile/profile04.jpg'),
('yuri05', '1234', '최유리', 'yuri05@example.com', '/resources/images/profile/profile05.jpg'),
('jimin06', '1234', '한지민', 'jimin06@example.com', '/resources/images/profile/profile06.jpg'),
('sehun07', '1234', '오세훈', 'sehun07@example.com', '/resources/images/profile/profile07.jpg'),
('jisu08', '1234', '서지수', 'jisu08@example.com', '/resources/images/profile/profile08.jpg'),
('yeeun09', '1234', '장예은', 'yeeun09@example.com', '/resources/images/profile/profile09.jpg'),
('taehyung10', '1234', '김태형', 'taehyung10@example.com', '/resources/images/profile/profile10.jpg');

-- Posts 테이블 더미 데이터
INSERT INTO Posts (user_id, content, image_path) VALUES
('minji01', '새로운 러닝화를 신고 첫 러닝! 너무 편해요!', '/resources/images/posts/runner01.jpg'),
('junho02', '오늘은 공원에서 러닝을 즐겼어요!', '/resources/images/posts/runner02.jpg'),
('soyoung03', '오랜만에 아침 러닝! 상쾌하네요.', '/resources/images/posts/runner03.jpg'),
('woosung04', '친구랑 공설운동장에서~!', '/resources/images/posts/runner04.jpg'),
('yuri05', '단체 러닝 사진 공유합니다!', '/resources/images/posts/runner05.jpg'),
('jimin06', '도심 속에서도 러닝의 즐거움!', '/resources/images/posts/runner06.jpg'),
('sehun07', '오늘은 5km를 달렸어요. 기록 갱신!', '/resources/images/posts/runner07.jpg'),
('jisu08', '러닝하다가 좋은 풍경 공유합니다!', '/resources/images/posts/runner08.jpg'),
('yeeun09', '상쾌하다 상쾌해', '/resources/images/posts/runner09.jpg'),
('taehyung10', '이거 쫌 잘 나온듯 ㅎㅎ', '/resources/images/posts/runner10.jpg');

-- Comments 테이블 더미 데이터
INSERT INTO Comments (post_id, user_id, content) VALUES
(1, 'junho02', '러닝화 정보 좀 알려주세요!'),
(1, 'woosung04', '나랑 똑같은 러닝화다!!'),
(3, 'yuri05', '이른 아침부터 러닝이라니..! 정말 멋져요!'),
(4, 'jimin06', '5km 페이스 좋으시네요!!'),
(5, 'sehun07', '우와 사람 정말 많네요?!'),
(6, 'jisu08', '도심 속 러닝! 저도 해보고 싶어요.'),
(7, 'yeeun09', '기록 갱신 축하드려요!'),
(8, 'taehyung10', '풍경 정말 멋지네요!!'),
(8, 'soyoung03', '날씨 진짜 좋네요!'),
(9, 'minji01', '쁘이~!');

-- Likes 테이블 더미 데이터
INSERT INTO Likes (post_id, user_id) VALUES
(1, 'junho02'),
(1, 'soyoung03'),
(2, 'woosung04'),
(3, 'yuri05'),
(4, 'jimin06'),
(5, 'sehun07'),
(6, 'jisu08'),
(7, 'yeeun09'),
(8, 'taehyung10'),
(9, 'minji01'),
(10, 'junho02'),
(10, 'soyoung03');

-- Follow 테이블 더미 데이터
INSERT INTO Follow (follower_id, following_id) VALUES
('minji01', 'soyoung03'),
('junho02', 'woosung04'),
('soyoung03', 'yuri05'),
('woosung04', 'jimin06'),
('yuri05', 'sehun07'),
('jimin06', 'jisu08'),
('sehun07', 'yeeun09'),
('jisu08', 'taehyung10'),
('taehyung10', 'minji01');

-- 테이블들 조회
SELECT * FROM Users;
SELECT * FROM Posts;
SELECT * FROM Comments;
SELECT * FROM Likes;
SELECT * FROM Follow;