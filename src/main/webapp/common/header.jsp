<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 - 뛸동무</title>
<link rel="stylesheet" type="text/css" href="../resources/css/header.css">
<script src="https://kit.fontawesome.com/7a4cfa35a1.js" crossorigin="anonymous"></script>
</head>
<body>
<header>
  <nav>
    <a href="../index.jsp">
      <img class="logo" src="../resources/images/logo.png" alt="뛸동무 로고" />
    </a>
    <div class="menus">
      <ul class="menus__sub-menu">
        <li><a href="../auth/login.jsp">로그인</a></li>
        <li><a href="../auth/register.jsp">회원가입</a></li>
      </ul>
      <ul class="menus__main-manu">
        <li><a href="../pages/marathon.jsp" class="marathon">마라톤</a></li>
      </ul>
    </div>
  </nav>
</header>
</body>
</html>
