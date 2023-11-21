<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인페이지</title>
    <link href="/resources/css/login-ui.css" rel="stylesheet" type="text/css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">

    <script src="/resources/js/includeHTML.js"></script>
</head>
<body>
    <!-- <div id="chatting_header">
        <div id="cloud_logo"></div>
        <div class="header_nav"><a href="#">챗봇과 상담</a></div>
        <div class="header_nav"><a href="#">로그인</a></div>
        <div class="header_nav"><a href="#">회원가입</a></div>
    </div> -->
    <jsp:include page="./header.jsp" />

    <br>
    <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" id="login-form">
            <input type="text" name="userId" placeholder="id">
            <input type="password" name="userPassword" placeholder="Password">
            <input type="submit" value="Login">
            <input type="submit" value="회원가입">
        </form>
    </div>
</body>
<script>
    includeHTML();
</script>
</html>