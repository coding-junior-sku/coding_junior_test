<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>비밀번호 찾기 페이지</title>
    <link href="/resources/css/password-find-ui.css" rel="stylesheet" type="text/css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--    <script src="./includeHTML.js"></script>--%>
</head>
<body>
    <jsp:include page="./header.jsp" />
   <br>
    <div class="password-find-wrapper">
        <h2>비밀번호 찾기</h2>
        <form method="post" id="password-find-form">
          <input type="text" name="userId" placeholder="id">
          <input type="text" name="userName" placeholder="name">
          <input type="submit" value="비밀번호 찾기">
          <div class="links"> 
              <a href="#">회원가입</a> | <a href="#">아이디 찾기</a>
          </div>
      </form>
    </div>  
  </body>
<script>

</script>
</html>