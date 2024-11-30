<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Footer</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard-gov.min.css");

        .footer {
            background-color: #2c3e50; /* 짙은 회색/청색 */
            color: #f8f9fa; /* 거의 흰색 */
            text-align: center;
            padding: 20px 10px;
            border-top: 1px solid #4b6584; /* 연한 청색 */
        }

        .footer a {
            color: #f8f9fa;
            padding: 0 10px;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .footer .social-icons a {
            margin: 0 5px;
            font-size: 18px;
        }

        @media (max-width: 768px) {
            .footer {
                padding: 20px;
                font-size: 14px;
            }
            .footer a {
                padding: 0 5px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="footer">
        <p>&copy; 2024 뛸동무. All rights reserved.</p>
        <div>
            <a href="/privacy">개인정보 처리방침</a> |
            <a href="/terms">이용 약관</a> |
            <a href="/contact">연락처</a>
        </div><br>
        <div class="social-icons">
            <a href="https://github.com/MinSang22Kim"><i class="fab fa-github"></i></a>
            <a href="https://instagram.com"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</body>
</html>
