<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅페이지</title>
    <link href="/resources/css/header.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/chatting-ui.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
   
    <script src="/resources/js/includeHTML.js"></script>
    
</head>
<body>
    <jsp:include page="./header.jsp" />

    <div id="chatting_section">
        <div id="chatting_contents">
            <c:forEach var="chat" items="${chats}">
                <c:choose>
                    <c:when test="${chat.writerIsHuman==0}">
                        <div class="chatbot">
                            <span>
                                ${chat.writeContent}
                            </span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="user">
                            <span>
                                    ${chat.writeContent}
                            </span>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
<%--            <div class="chatbot">--%>
<%--                <span>안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.--%>
<%--                    안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.안녕하세요 챗봇입니다.--%>
<%--                </span>--%>
<%--            </div>--%>
<%--            <div class="user">--%>
<%--                <span>안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕--%>
<%--                    안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕안녕--%>
<%--                </span>--%>
<%--            </div>--%>





        </div>
        <div id="user_input_section">
            <div id="user_input">
                <textarea type="text" id="user_question"></textarea>
            </div>
            <div id="input_button_section"><button id="submit_button">보내기</button></div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>


    /*
         .ready() Event는 1.8 버전에서는 deprecated 되었으며 3.0에서는 지원하지 않기 때문입니다.
        출처: https://7942yongdae.tistory.com/77 [개발자 일지:티스토리]
    */
    $(function(){
        let chattingContents=$('#chatting_contents');
        chattingContents.scrollTop(chattingContents.prop('scrollHeight'));



        $('#submit_button').on('click',function(){
            let userQuestion = $('#user_question').val();
            //내용이 비어있지 않을때만 post ajax를 동작시킨다.
            if(userQuestion !=''){
                $.ajax({
                    type: 'post',
                    url: '/userInsertChat',
                    contentType: "application/json",
                    dataType: 'json',
                    data: JSON.stringify({writeContent:userQuestion}),
                    success:function(result){
                        //제일 먼저 사용자가 친 내용을 채팅에 붙이고
                        //그다음에 답변 내용을 채팅에 붙인다.
                        chattingContents.append('<div class="user"><span>'+userQuestion+'</span></div>');
                        /*
                        .scrollTop()은 선택한 요소의 스크롤바 수직 위치를 반환하거나 스크롤바 수직 위치를 정합니다.
                        화면 바깥으로 삐져나간 부분까지 포함해서 전체 글의 길이를 scrollHeight 라고 비유해볼 수 있겠다.
                        출처: https://devbirdfeet.tistory.com/228 [새발개발자:티스토리]
                        */
                        chattingContents.scrollTop(chattingContents.prop('scrollHeight'));

                        console.log(result);
                        console.log(result.result);

                        //result 매개변수 자체가 자바스크립트 객체로 쓸수있어서 파싱이 필요하지 않다
                        //let getResult=JSON.parse(result);
                        //console.log(getResult);

                        //사용자가 잘못된 키워드를 쳐서 뉴스 검색이 안된다면
                        if(result.result=="fail"){
                            console.log("result fail 들어옴");
                            let failGuide="뉴스기사를 찾지 못했습니다. 키워드를 정확히 입력해주세요. 또는 아직 해당 키워드에 관련된 기사가 적재되어있지 않습니다.";


                            chattingContents.append('<div class="chatbot"><span>'+failGuide+'</span></div>');
                        }
                    },

                    error: function (request, status, error) {
                        console.log(error)
                    }
                });
            }

            else{
                alert('내용을 입력하고 나서 보낼 수 있습니다.');
            }

        });


    });

   
   
</script>
</html>