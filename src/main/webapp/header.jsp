<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>뛸동무</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard-gov.min.css");
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #f3f3f3;
            padding: 10px 20px;
        }
        .logo {
            display: flex;
            align-items: center;
        }
        .logo img {
            height: 40px;
            width: auto;
        }
        .logo-text {
            margin-left: 10px;
            font-family: 'Pretendard', sans-serif;
            font-weight: bold;
            font-size: 24px;
        }
        .search-bar input[type="text"] {
            font-family: 'Pretendard', sans-serif;
            font-weight: 200;
            padding: 8px;
            margin-left: 20px;
            width: 300px;
        }
        .profile-icons a {
            display: inline-block;
        }
        .profile-icons img {
            height: 40px;
            width: 40px;
            border-radius: 20px;
        }
        .menu a {
            font-family: 'Pretendard', sans-serif;
            font-weight: 200;
            margin-right: 15px;
            text-decoration: none;
            color: #333;
        }
        /* Media Query for smaller screens */
        @media (max-width: 600px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
            .logo-text {
                margin-top: 5px;
                margin-left: 0;
                font-size: 18px;
            }
            .menu {
                width: 100%;
                display: flex;
                justify-content: space-around;
                margin-top: 10px;
            }
            .menu a {
                margin-right: 0;
            }
            .search-bar input[type="text"] {
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
            <a href="./index.jsp" style="display: flex; align-items: center; text-decoration: none;">
            <img src="./resources/images/logo.jpg" alt="Logo" style="height: 50px; width: auto;">
            <span class="logo-text" style="color: #333;">뛸동무</span>
        </a>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search...">
        </div>
		<div class="menu">
			<a href="./index.jsp"><i class="fas fa-home"></i></a> <a
				href="./post.jsp"><i class="fas fa-compass"></i></a> <a
				href="./event.jsp" onclick="showComingSoon(event)"><i
				class="fas fa-calendar"></i></a> <a href="./newPost.jsp"><i
				class="fas fa-pencil-alt"></i></a> <a href="./myprofile.jsp"
				id="myProfileLink"><i class="fas fa-user"></i></a>
		</div>
	</div>
    <script>
		function showComingSoon(event) {
			event.preventDefault();
			alert('서비스 준비 중입니다.');
		}
		document.getElementById('myProfileLink').addEventListener('click', function(event) {
	        // 로그인 상태 확인: 서버 세션 데이터에서 'userId'를 가져와 확인
	        const userId = '<%= session.getAttribute("userId") %>';

	        if (!userId) {
	            // 비로그인 상태일 경우
	            event.preventDefault(); // 기본 링크 동작 중지
	            if (confirm('로그인 하시겠습니까?')) {
	                window.location.href = './login.jsp';
	            }
	        } else {
	            // 로그인 상태일 경우
	            window.location.href = `./myprofile.jsp?userId=${userId}`;
	        }
	    });
	</script>
</body>
</html>
