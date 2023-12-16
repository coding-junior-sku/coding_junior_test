<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입페이지</title>
    <link href="/resources/css/join-ui.css" rel="stylesheet" type="text/css" />

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

    <div class="join-wrapper">
        <h2>회원가입</h2>
        <form method="post" id="join-form" action="/joinOk" name="joinForm">
            <input type="text" name="name" placeholder="name">
            <p><span id="decide2" style='color:#f095b7;'>이름 중복 여부를 확인해주세요.</span>
                <input type="button" value="이름 중복확인" class="btn-gradient red mini" onclick="checkId()">
            </p>
    <%-- <input type="number" name="userBirth" placeholder="생년월일 8자리">--%>
            <input type="text" name="loginId" placeholder="id"> <br>
            <p><span id="decide" style='color:#f095b7;'>ID 중복 여부를 확인해주세요.</span>
               <input type="button" value="ID중복확인" class="btn-gradient red mini" onclick="checkId()">
            </p>
            <input type="password" name="password" placeholder="Password">
            <input type="password" name="passwordConfirm" placeholder="Password 확인">
            <button id="submitButton" type="button" onclick="realSubmit(event)">가입완료</button>
<%--            <input id="submit" type="text" readonly value="가입완료" onclick="submit(event)">--%>
        </form>
    </div>
</body>
<script>
    let checkIdOk=false;
    function realSubmit(e){
        //기본적으로 바로 submit하는걸 막고, 검사한후 submit한다
        e.preventDefault();
        let firstPassword=$("input[name='password']").val();
        let confirmPassword=$("input[name='passwordConfirm']").val();
        if(firstPassword==confirmPassword && checkIdOk==true){
            console.log("회원가입 자격있음");
             $('#join-form').submit();
            // $('joinForm').submit();
        }
        else if(firstPassword!=confirmPassword && checkIdOk==true){
            alert("비밀번호칸과 비밀번호 확인 칸의 내용이 다릅니다.");
        }
        else{
            alert("회원가입 항목을 다시 확인해주세요");
        }
    }
    function checkId(){

        let loginId= $("input[name='loginId']").val();

        $.ajax({
            type: 'get',
            url: '/checkId/'+loginId,
            contentType: "application/json",
            dataType: 'json',
            success:function(result){
                //중복됨
                if(result==1){
                    //태그제외하고 순수 안의 글자만 바꿈
                    $('#decide').text('id가 중복 되었습니다');
                    $('#decide').css('color','red');
                    console.log(result);
                    checkIdOk=false;
                }
                //중복안됨
                else{
                    $('#decide').text('id가 사용가능 합니다');
                    $('#decide').css('color','#f095b7');
                    console.log(result);
                    checkIdOk=true;
                }
            },

            error: function (request, status, error) {
                console.log(error)
            }
        });

    }

</script>
</html>