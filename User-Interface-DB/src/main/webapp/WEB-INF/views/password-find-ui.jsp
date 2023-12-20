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
        <div id="password-find-form">
          <input type="text" name="userLoginId" placeholder="loginId">
          <input type="text" name="userName" placeholder="name">
          <input type="submit" value="비밀번호 찾기">
            <input type="text" id="passwordResult" readonly/>
          <div class="links"> 
              <a href="/goJoin">회원가입</a> | <a href="/goFindId">아이디 찾기</a>
          </div>
      </div>
    </div>  
  </body>
<script>
$('input[type="submit"]').on('click',function(e){
    console.log('버튼 눌림');
    let loginId=$('input[name="userLoginId"]').val();
    let name=$('input[name="userName"]').val();
    let memberDTO={loginId:loginId, name:name};

    $.ajax({
        type:'post',
        url:'/passwordFind',
        data:JSON.stringify(memberDTO),
        contentType: "application/json; charset=utf-8",
        //null값으로 커스텀 처리를 해도 success로 온다.
        //근데 result값이 null이 아니다.
        //빈 칸으로 온다.
        success:function(result){
            console.log(result);
            if(result==''){
                $('#passwordResult').val('입력하신 회원정보가 틀려 찾을 수 없습니다.');
            }
            //input을 text로 하니 작동안한다.
            else{
                $('#passwordResult').val('비밀번호 : '+result);
            }
        },

        error:function(request, status, error){
            console.log(error);


        }
    });
})
</script>
</html>