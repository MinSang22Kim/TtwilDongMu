-- Users 테이블 더미 데이터
INSERT INTO Users (loginId, password, name, email)
VALUES 
('gildong', '1234', '홍길동', 'gildong@example.com'),
('yeseul', 'abcd', '김예슬', 'yeseul@example.com'),
('minsoo', 'qwer', '박민수', 'minsoo@example.com'),
('jisoo', '1111', '이지수', 'jisoo@example.com'),
('hyejin', '0000', '최혜진', 'hyejin@example.com');

-- Posts 테이블 더미 데이터
INSERT INTO Posts (userId, content, imagePath)
VALUES 
(1, '오늘 처음으로 5km 뛰었어요! 힘들었지만 뿌듯합니다.', '/images/feed/run1.jpg'),
(2, '달리기 후에 마신 커피는 정말 꿀맛이네요. 러닝 추천 코스 공유해요!', '/images/feed/run2.jpg'),
(3, '오랜만에 친구랑 러닝! 함께 달리니 더 즐겁네요.', '/images/feed/run3.jpg'),
(4, '한강에서 일몰 보며 달리기 했어요. 너무 아름다웠어요.', '/images/feed/run4.jpg'),
(5, '새 신발 신고 첫 러닝! 발이 날아갈 것 같아요.', '/images/feed/run5.jpg');

-- Comments 테이블 더미 데이터
INSERT INTO Comments (postId, userId, content)
VALUES 
(1, 2, '처음 뛰었는데 5km라니! 대단해요!'),
(1, 3, '꾸준히 하시면 더 잘 뛰실 수 있을 거예요. 응원합니다!'),
(2, 1, '커피는 러닝 끝난 후의 보상 같죠? 공감합니다!'),
(3, 4, '친구랑 같이 뛰면 정말 즐거워요. 다음엔 저도 친구랑 뛰어봐야겠어요.'),
(4, 5, '한강 일몰 최고죠! 사진도 너무 멋져요.');

-- Likes 테이블 더미 데이터
INSERT INTO Likes (postId, userId)
VALUES 
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(4, 3),
(4, 5),
(5, 1);
