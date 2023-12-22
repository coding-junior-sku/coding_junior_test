<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0">-->
    <meta name="viewport" content="width=device-width,  initial-scale=1.0">
    <title>채팅페이지</title>
    <link href="/resources/css/chatting-ui2.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/header.css" rel="stylesheet" type="text/css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
   
    <script src="/resources/js/includeHTML.js"></script>
    
</head>
<body>
    <jsp:include page="./header.jsp" />

    <div id="chatting_section">
<!--        <div class="chat-header">-->
           <!--<h2>뉴스 키워드를 입력해 주세요</h2>-->
        <!--</div>-->
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
                <textarea type="text" id="user_question" placeholder="뉴스 키워드를 입력해 주세요."></textarea>
            </div>
            <div id="input_button_section"><button id="submit_button">send</button></div>
        </div>
    </div>

    <div id="loading_section">
        <div>
            <span>챗봇에게부터 답변을 받아오는 중입니다.</span>
            <img src="/resources/images/loading_bar.gif">
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

        let loadingDisplay=$('#loading_section');

        $('#submit_button').on('click',function(){
            let userQuestion = $('#user_question').val();
            //내용이 비어있지 않을때만 post ajax를 동작시킨다.
            if(userQuestion !=''){
                //로딩중 화면 띄우기
                loadingDisplay.css('z-index','2');
                loadingDisplay.css('opacity','0.8');

                //제일 먼저 사용자가 친 내용을 채팅에 붙이고
                //그다음에 답변 내용을 채팅에 붙인다.
                chattingContents.append('<div class="user"><span>'+userQuestion+'</span></div>');
                /*
                .scrollTop()은 선택한 요소의 스크롤바 수직 위치를 반환하거나 스크롤바 수직 위치를 정합니다.
                화면 바깥으로 삐져나간 부분까지 포함해서 전체 글의 길이를 scrollHeight 라고 비유해볼 수 있겠다.
                출처: https://devbirdfeet.tistory.com/228 [새발개발자:티스토리]
                */
                chattingContents.scrollTop(chattingContents.prop('scrollHeight'));

                $.ajax({
                    type: 'post',
                    url: '/userInsertChat',
                    contentType: "application/json",
                    dataType: 'json',
                    data: JSON.stringify({writeContent:userQuestion}),
                    success:function(result){

                        console.log(result);


                        //result 매개변수 자체가 자바스크립트 객체로 쓸수있어서 파싱이 필요하지 않다
                        //let getResult=JSON.parse(result);
                        //console.log(getResult);

                        //사용자가 잘못된 키워드를 쳐서 뉴스 검색이 안된다면
                        //result라는 키가 있는지 확인. 없으면 뉴스 요약 데이터이다
                        //https://velog.io/@minong/Javascript-%EA%B0%9D%EC%B2%B4%EC%97%90-%ED%95%B4%EB%8B%B9-key%EA%B0%92%EC%9D%B4-%EC%A1%B4%EC%9E%AC%ED%95%98%EB%8A%94%EC%A7%80-%ED%99%95%EC%9D%B8%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95
                        // if(result.hasOwnProperty('result') && result.result=="fail"){
                        //     console.log("result fail 들어옴");
                        //     let failGuide="뉴스기사를 찾지 못했습니다. 키워드를 정확히 입력해주세요. 또는 아직 해당 키워드에 관련된 기사가 적재되어있지 않습니다.";
                        //
                        //
                        //     chattingContents.append('<div class="chatbot"><span>'+failGuide+'</span></div>');
                        // }
                        //
                        // else{
                        //
                        // }

                        //result 즉 newsSummaryDTOList가 null이면 success 부분이 아니라 바로 error로 가서  error 코드 안에서 처리를 해줘야한다.
                        // if(result==null){
                        //     console.log('result null 들어옴');
                        //     let failGuide="뉴스기사를 찾지 못했습니다. 키워드를 정확히 입력해주세요. 또는 아직 해당 키워드에 관련된 기사가 적재되어있지 않습니다.";
                        //     chattingContents.append('<div class="chatbot"><span>'+failGuide+'</span></div>');
                        // }
                        //newsSummaryDTOList가 null이 아니면 바로 뉴스기사를 찾은 채팅 내역 붙여서 올리기

                        let content="";
                        let count=0;
                        for(let newsSummaryDTO of result) {
                                //윈도우 개행문자 \r\n
                                //웹에서 인식할때 <br>로 인식해서 줄바꿈이 되도록
                                content += "뉴스기사:" + (count + 1) + "<br/>";
                                content += "제목:" + newsSummaryDTO.newsTitle+ "<br/>";
                                content +="요약:"+newsSummaryDTO.newsSummary+ "<br/>";
                                content +="원문링크:<a style='text-decoration-line : none;' href='"+newsSummaryDTO.newsLink+"'>"+newsSummaryDTO.newsLink+"</a><br/>";
                                count = count + 1;

                                console.log("content:"+content);

                                chattingContents.append('<div class="chatbot"><span>'+content+'</span></div>');

                                //내용 초기화 해서 다른 기사 받기
                                content="";
                        }




                        //로딩중 화면 숨기기
                        loadingDisplay.css('z-index','-100');
                        loadingDisplay.css('opacity','0');
                    },

                    //result 즉 newsSummaryDTOList가 null이면 바로 뉴스기사를 찾지 못했다는 채팅 내역 붙여서 올리기
                    error: function (request, status, error) {
                        console.log(error)
                        console.log('result null 들어옴');
                        let failGuide="뉴스기사를 찾지 못했습니다. 키워드를 정확히 입력해주세요. 또는 아직 해당 키워드에 관련된 기사가 적재되어있지 않습니다.";
                        chattingContents.append('<div class="chatbot"><span>'+failGuide+'</span></div>');

                        //로딩중 화면 숨기기
                        loadingDisplay.css('z-index','-100');
                        loadingDisplay.css('opacity','0');
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