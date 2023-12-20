<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    <link href="/resources/css/index.css" rel="stylesheet" type="text/css" />


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <!--<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">-->

    <!--    <script src="/resources/js/includeHTML.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="left-side">
            <div class="color-text">Chat News Summary●</div>
            <div id=container01>
                 
                <div id=flip>
                  
                  <div><div>Chat News Summary</div></div>
                  <div><div>Start chatting now!</div></div>
                  <div><div>Let's go</div></div>
                  
                </div>
                
              </div>
        </div>
        <div class="right-side">
            <div class="get-started">Get started</div>
            <div class="buttons">
                <button id="loginButton" class="button">로그인</button>
                <button id="signUpButton" class="button">회원가입</button>    
            </div>
        </div>
    </div>


</body>
<script>
    $('#loginButton').on('click',function(){
       location.href='/goLogin';
    });

    $('#signUpButton').on('click',function(){
        location.href='/goJoin';
    });
</script>
</html>
