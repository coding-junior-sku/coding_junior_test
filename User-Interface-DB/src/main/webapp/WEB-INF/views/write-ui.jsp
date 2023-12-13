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

            <div class="btn"><button type="submit">작성</button></div>
        </form>

    </div>
</body>
<script>

</script>
</html>