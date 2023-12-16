<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더</title>
    <link href="/resources/css/header.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
    <div id="chatting_header">
        <div id="cloud_logo" class="header_nav"><a href="/"></a></div>
        <div class="header_nav" onclick="isLogin(this)"><a href="/goChatting">챗봇과 상담</a></div>
        <c:choose>
            <c:when test="${sessionScope.loginId eq null}">
                <div class="header_nav"><a href="/goLogin">로그인</a></div>
            </c:when>
            <c:otherwise>
                <div class="header_nav"><a href="/logout">로그아웃</a></div>
            </c:otherwise>
        </c:choose>


        <div class="header_nav"><a href="/goJoin">회원가입</a></div>
        <div class="header_nav" onclick="isLogin2(this)"><a href="/goBoardList">토론장</a></div>
<%--        <div class="header_nav"><a href="#">관리자 전용</a></div>--%>
    </div>

</body>
<script>
    //객체 this를 함수 파라미터에 넘겨서 가져올때는 내용자체는 this지만 파라미터변수명에 this라고 쓰면 충돌나서 안된다
    function isLogin(e){
        let aTag=$(e).find('a');
        let loginId='${sessionScope.loginId}';
        console.log("loginId:"+loginId);
        //로그인이 되어있다면
        if(loginId != ''){
            //챗봇과 상담 a href 활성화
            aTag.attr('href','/goChatting');
        }
        //로그인이 안되어있다면
        else{
            //챗봇과 상담 a href 비활성화
            aTag.removeAttr("href");
            alert("로그인을 한 이후에 채팅 서비스를 이용할 수 있습니다.");
        }
    }


    //객체 this를 함수 파라미터에 넘겨서 가져올때는 내용자체는 this지만 파라미터변수명에 this라고 쓰면 충돌나서 안된다
    function isLogin2(e){
        let aTag=$(e).find('a');
        let loginId='${sessionScope.loginId}';
        console.log("loginId:"+loginId);
        //로그인이 되어있다면
        if(loginId != ''){
            //토론장 a href 활성화
            aTag.attr('href','/goBoardList');
        }
        //로그인이 안되어있다면
        else{
            //토론장 a href 비활성화
            aTag.removeAttr("href");
            alert("로그인을 한 이후에 토론장 서비스를 이용할 수 있습니다.");
        }
    }
</script>
</html>
