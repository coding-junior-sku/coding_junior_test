<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>토론장</title>
    <link rel="stylesheet" href="/resources/css/board-ui.css" type="text/css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%--    <script src="./includeHTML.js"></script>--%>
</head>

<body>
    <jsp:include page="./header.jsp" />
    <!--<div id="chatting_header">
        <div id="cloud_logo"></div>
        <div class="header_nav"><a href="#">챗봇과 상담</a></div>
        <div class="header_nav"><a href="#">로그인</a></div>
        <div class="header_nav"><a href="#">회원가입</a></div>
    </div>
    -->
    <div class="card">
        
        <div class="board_list_wrap">
            
            <table class="board_list" style=margin-left:auto;margin-right:auto;">
                <caption>게시판 목록</caption>
            <!--
            <div class="paging">
                <a href="#" class="bt3">글쓰기</a> 
                -->
                <!--
                <div class="btn"><a href="#">글쓰기</a></div>
                -->
                <div class="button">
                    <span><input type="button" class="button-pink" id="goBoardWrite" value="글쓰기"></span>
                </div>

                <thead>
                    <tr>
                        <th>NO</th>
                        <th>제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="board" items="${boardList}">
                    <tr>
                        <td>${board.id}</td>
                        <td class="tit">
                            <a href="#">${board.title}</a>
                        </td>
                        <td>${board.content}</td>
                        <td>${board.writeTime}</td>
                    </tr>
                </c:forEach>

<%--                    <tr>--%>
<%--                        <td>4</td>--%>
<%--                        <td class="tit">--%>
<%--                            <a href="#">ㅁㄴㄹㄴㄹ.</a>--%>
<%--                        </td>--%>
<%--                        <td>관리ㄴㅁㄹㅇㅁㄹㄴㅇㄹㅁㄴㄹㅇㅁㄹㅁㄴㄹㅁㄴㄹㄴㅁㅇㄹㅁㄴㅇㄹㅁㄹㄴㅁㄹㅇㅁㄴㄹ자</td>--%>
<%--                        <td>2019-11-12</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>3</td>--%>
<%--                        <td class="tit">--%>
<%--                            <a href="#">ㅁㄴㅇㄻㄴㅇㄹ</a>--%>
<%--                        </td>--%>
<%--                        <td>관리ㅁㄴㅇㄹㅁㄴㅇㄹㅁㄹㅇㅁㄴㄹㅁㅁㄹㅁㅇㄴㅁㄹㅁㄴㄹㅇㄴㅁㄴㄹㅁㅇㅁㄹㅁ자</td>--%>
<%--                        <td>2019-11-02</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>2</td>--%>
<%--                        <td class="tit">--%>
<%--                            <a href="#">asdsagddsgdsgsdf.</a>--%>
<%--                        </td>--%>
<%--                        <td>관ㅁㄹㅇㅁㄴㄹㅁㄹㅇㅁㄹㄴㅇㄹㅁㄴㄹㄴㅇㄹㅁㄴㅇㄹㅁㄴㄹㅇㄴㅁㄹㅁㄴㄹㄴㄹㄴㄹㄴㄹㅇㄹㄴㅁㄹㄴㅁ리자경찰이 마약 투약 의혹으로 수사 중이었던 가수 지드래곤(본명 권지용)에 대한 경찰 조사를 조만간 마무리하고 검찰에 사건을 넘길 예정이다.--%>
<%--                            우종수 경찰청 국가수사본부장은 11일 기자간담회를 통해 "지드래곤과 관련해서는 객관적인 검증을 했고 참고인 6명 정도를 조사해 수사가 마무리 단계에 있다"며 "조만간 신속히 종결해 결과를 브리핑하도록 하겠다"고 밝혔다.--%>
<%--                            경찰은 서울 강남에 있는 유흥업소 실장 A씨의 진술을 토대로 지드래곤이 지난해 12월 해당 유흥주점에서 마약을 투약한 것으로 의심하고 수사에 착수했다. 하지만 지드래곤은 간이 시약 검사와 국립과학수사연구원의 정밀감정에서 마약 음성 판정을 받았고, 이 외에 추가적인 정황 증거가 없는 상태다.</td>--%>
<%--                        <td>2023-10-28</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>1</td>--%>
<%--                        <td class="tit">--%>
<%--                            <a href="#">sadfsdfsadfsadf</a>--%>
<%--                        </td>--%>
<%--                        <td>관ㅁㄴㄹㅁㄴㄹㅇㄴㅇㄹㄴㄹㅁ루안무라ㅓㄴ물이ㅜㄴ루ㅏㅓ누룬ㅁ뤼ㅏ눌아ㅓㅇ물이ㅜㄴㅁㄹㄴ물이ㅏ우린물너우리ㅏㄴ무라물아ㅜㄴㅁ라ㅣㅜㅇㄴ미ㅏ룬미ㅜ리무ㄹㅇㄴㄹㅁㄹㄴㅇㄹㅁㄹㄴㅇㄹㅁㄹㅇㄴㄹㅁㄹㅁㅇㄹㅁㄴㄹㄴㄹㅁㅇㄴㅁㄹㄹㅁㄹ리자</td>--%>
<%--                        <td>2023-10-24</td>--%>
<%--                    </tr>--%>
                </tbody>
            
            </table>
        <!--
        <div class="paging">
            <img src="./images/left_arrow_icon.png" onclick=""></a>
            <a href="#" class="num on">1</a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <img src="./images/right_arrow_icon.png" onclick=""></a>          
        </div>
        -->
            <ul class="number">
                <li><a href="#"><</a></li>
                <li><a href="#" class="active">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
            </ul>
        </div>
    </div>
</body>
<script>

    $('#goBoardWrite').on('click',function(){
       location.href="/goBoardWrite";
    });


</script>
</html>