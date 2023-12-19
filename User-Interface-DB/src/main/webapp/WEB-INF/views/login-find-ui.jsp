<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>로그인 찾기 페이지</title>
    <link href="/resources/css/login-find-ui.css" rel="stylesheet" type="text/css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%--    <script src="./includeHTML.js"></script>--%>
</head>
<body>
    <jsp:include page="./header.jsp" />
   <br>
    <div class="login-find-wrapper">
        <h2>아이디 찾기</h2>
        <div id="login-find-form">
          <input type="text" name="userName" placeholder="name"/>
          <input type="submit" value="아이디 찾기"/>
          <input type="text" id="idResult" readonly/>
          <div class="links"> 
              <a href="/goJoin">회원가입</a> | <a href="#">비밀번호 찾기</a>
          </div>
      </div>
    </div>  
  </body>
<script>
$('input[type="submit"]').on('click',function(e){
    console.log('버튼 눌림');
    let name=$('input[name="userName"]').val();
    console.log(name);
    let memberDTO={name:name};
    $.ajax({
        type:'post',
        url:'/idFind',
        data: JSON.stringify(memberDTO),
        contentType: "application/json; charset=utf-8",
        //null값으로 커스텀 처리를 해도 success로 온다.
        //근데 result값이 null이 아니다.
        //빈 칸으로 온다.
        success:function(result) {
            console.log(result);
            if(result==''){
                $('#idResult').val('존재하지 않는 회원이름');
            }
            //input을 text로 하니 작동안한다.
            else{
                $('#idResult').val('로그인 아이디:  '+result);
            }

        },

        error:function(request, status, error){
            console.log(error);


        }
    });
});
</script>
</html>