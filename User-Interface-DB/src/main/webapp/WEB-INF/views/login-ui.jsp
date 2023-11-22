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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            <input type="text" name="loginId" placeholder="id">
            <input type="password" name="password" placeholder="Password">
            <button  class="submitButton" type="button" onclick="goLogin()">Login</button>
            <button class="submitButton" type="button" onclick="goJoin()">회원가입</button>
        </form>
    </div>
</body>
<script>

    function goLogin(){
        let form= $("#login-form");
        form.attr("action","/loginOk");
        form.attr("method","post");
        form.submit();
    }
    function goJoin(){
        location.href="/goJoin";
    }



    /*
       .ready() Event는 1.8 버전에서는 deprecated 되었으며 3.0에서는 지원하지 않기 때문입니다.
      출처: https://7942yongdae.tistory.com/77 [개발자 일지:티스토리]
  */
    $(function() {
        //jstl 변수 값이 비어있으면 오류를 내는데
        //오류를 안내면서 jstl 변수가 있는지 검사하거나 할당하려면 ''를 써준다.
        let jstlFail='${fail}';
        console.log(jstlFail);
        if(jstlFail!='' && jstlFail=="fail"){
            alert("로그인 실패했습니다");
        }


    });
    $(document).ready(function () {


    });

</script>
</html>