<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/write-ui.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--    <script src="./includeHTML.js"></script>--%>
    <title>글쓰기</title>
</head>
<body>

    <jsp:include page="./header.jsp" />
    
    <div class="card">
        <div class="card-header1">
            <h1><a href="/goBoardList">게시글</a></h1>
        </div>

        <form class="card-write" action="/boardWriteOk" method="post">
            <div class="title">
                제목<input type="text" name="title" placeholder="제목을 입력하세요.">
            </div>
            <div class="msg">
                내용<textarea name="content" placeholder="내용을 입력하세요."></textarea>
            </div>

            <div class="btn"><button onclick="submitCheck(event)">작성</button></div>
        </form>

    </div>
</body>
<script>
    function submitCheck(e){
        //기본적인 이벤트를 막아서 기본적인 submit기능을 막는다.
        e.preventDefault();
        //제목과 내용이 빈문자열이 아니라 다 있을때만 submit 가능
        let title=$('input[name=title]').val();
        let content=$('textarea[name=content]').val();
        if(title!=='' && content!==''){
            $('.card-write').submit();
        }
        else{
            alert('제목과 내용을 모두 입력해야만 글 등록이 가능합니다.');
        }
    }

</script>
</html>