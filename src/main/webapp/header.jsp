<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title><fmt:message key="title" /></title>
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
        /* .search-bar input[type="text"] {
            font-family: 'Pretendard', sans-serif;
            font-weight: 200;
            padding: 8px;
            margin-left: 20px;
            width: 300px;
        } */
        .menu a {
            font-family: 'Pretendard', sans-serif;
            font-weight: 200;
            margin-right: 15px;
            text-decoration: none;
            color: #333;
        }
        .language-icon {
            font-size: 18px;
            margin-left: 10px;
            cursor: pointer;
        }
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
    <c:set var="lang" value="${param.lang != null ? param.lang : 'ko'}" />
    <fmt:setLocale value="${lang}" />
    <fmt:setBundle basename="bundle.myBundle" />

    <div class="header">
        <div class="logo">
            <a href="./index.jsp" style="display: flex; align-items: center; text-decoration: none;">
                <img src="./resources/images/logo.jpg" alt="Logo" style="height: 50px; width: auto;">
                <span class="logo-text" style="color: #333;"><fmt:message key="title" /></span>
            </a>
        </div>
        <!-- <div class="search-bar">
            <input type="text" placeholder="Search...">
        </div> -->
		<div class="menu">
			<a href="./index.jsp"><i class="fas fa-home"></i></a>  
			<a href="./event.jsp" onclick="showComingSoon(event)"><i class="fas fa-calendar"></i></a> 
			<a href="./newPost.jsp"><i class="fas fa-pencil-alt"></i></a> 
			<a href="./myprofile.jsp" id="myProfileLink"><i class="fas fa-user"></i></a>
            <!-- 다국어 아이콘 -->
            <a href="?lang=${lang == 'ko' ? 'en' : 'ko'}" class="language-icon">
                <i class="fas ${lang == 'ko' ? 'fa-language' : 'fa-globe'}"></i>
            </a>
            <span class="language-text">
                ${lang == 'ko' ? '한국어' : 'English'}
            </span>
		</div>
	</div>
    <script>
        function showComingSoon(event) {
            event.preventDefault();
            alert('<fmt:message key="title" />');
        }
    </script>
</body>
</html>
