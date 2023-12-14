<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 디테일</title>
    <link href="/resources/css/header.css" rel="stylesheet" type="text/css" />
    <link href="/resources/css/board-detail.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
   
<%--    <script src="./includeHTML.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<body>

    <jsp:include page="./header.jsp" />

    <div id="section">
        <div id="bigTitle">
            <h2>토론장</h2>
        </div>
        <div id="container">
            <div id="containerBody">
                <div id="header">
                    <h3>${board.title}</h3>
                    <span>작성 시간: ${board.writeTime}</span>
                    <h4>글쓴이: ${board.writerLoginId}</h4>
                </div>
                <div id="content">
                    ${board.content}
                </div>
                <div id="alertSection">
                    <div>
                        <span>신고하기</span>
                        <image src="resources/images/alert_icon.png"/>
                    </div>
                   
                </div>
            </div>
            <!--수정,삭제,목록 넣을 곳-->
            <div id="containerButton">
                <!--현재 로그인한 번호가 원작자 번호와 같으면-->
                <c:choose>

                    <c:when test="${sessionScope.loginId eq board.writer}">
                        <button onclick="goBoardUpdate()">수정</button>
                        <button onclick="boardDelete()">삭제</button>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

                <button onclick="goBoardList()">목록</button>
            </div>
            
        </div>
        <!--댓글 입력 구역-->
        <div id="writeComment">
            <textarea></textarea> <button>댓글 등록</button>
        </div>
        <!--댓글 리스트가 나타날 구역-->
        <div id="CommentSection">
            <div class="comment">
                <div class="commentHeader"><div>닉네임</div><div>날짜</div></div>
                <div class="commentContent">
                    댓글 본문 글
                </div>
                <div class="commentAlert">
                    <div>
                        <span>신고하기</span>
                        <span></span>
                    </div>
                   
                </div>
                <div class="commentButton">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
            <div class="comment">
                <div class="commentHeader"><div>닉네임</div><div>날짜</div></div>
                <div class="commentContent">
                    댓글 본문 글
                </div>
                <div class="commentAlert">
                    <div>
                        <span>신고하기</span>
                        <span></span>
                    </div>
                   
                </div>
                <div class="commentButton">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
            <div class="comment">
                <div class="commentHeader"><div>닉네임</div><div>날짜</div></div>
                <div class="commentContent">
                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문1111111111111111111111111111111111111111111111111
                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글
                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글
                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글
                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글
                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글
                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글
                    댓글 본문 댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문
                    댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문
                    댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문
                
                </div>
                <div class="commentAlert">
                    <div>
                        <span>신고하기</span>
                        <span></span>
                    </div>
                    
                </div>
                <div class="commentButton">

                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>


        </div>

        <!--댓글 페이징 처리 구역-->
        <div id="commentPaging">
            <button id="commentPrevious"></button>
            <button>11</button>
            <button>12</button>
            <button>13</button>
            <button>14</button>
            <button>15</button>
            <button>16</button>
            <button>17</button>
            <button>18</button>
            <button>19</button>
            <button>20</button>
            <button id="commentNext"></button>
        </div>
        

    </div>

<%--    <form action="/goBoardList" name="pageForm" method="get">--%>
<%--        <input type="hidden" name="page">--%>
<%--        <!--원래 criteria amount값이 들어가도록-->--%>
<%--        <input type="hidden" name="amount" value="${pagination.criteria.amount}">--%>
<%--    </form>--%>

</body>

<script src="/resources/js/commentAjax.js"></script>
<script>
function goBoardList(){

    <%--$('input[name=page]').val(${criteria.page});--%>
    <%--$('input[name=amount]').val(${criteria.amount});--%>
    <%--document.pageForm.submit();--%>

    //jstl 변수 값이 비어있으면 오류를 내는데
    //오류를 안내면서 jstl 변수가 있는지 검사하거나 할당하려면 ''를 써준다.
    let page=${criteria.page};
    let amount=${criteria.amount};

    //이렇게 get이 아니라 form으로 get을 해야지 자바객체에 매핑이 되는것같다.=>상관없는것같다.
    location.href="/goBoardList?page="+page+"&amount="+amount;
}

function goBoardUpdate(){
    let page=${criteria.page};
    let amount=${criteria.amount};
    let id = ${board.id};

    location.href="/goBoardUpdate?id="+id+"&page="+page+"&amount="+amount;
}

function boardDelete(){
    let page=${criteria.page};
    let amount=${criteria.amount};
    let id = ${board.id};

    location.href="/boardDelete?id="+id+"&page="+page+"&amount="+amount;
}




globalThis.page = 1;

function getCommentList(){
    commentAjax.getList({
        boardId:${board.id},
        page:globalThis.page
    },showCommentList);
}

function showCommentList(result){

}

//답글 쓰기 버튼
$('#writeComment > button').on('click',function(){
    console.log('답글쓰기버튼 눌림');
    let commentContent= $('#writeComment textarea').val();
    //빈 문자열이면 넘겨주지 않는다
    if(commentContent==''){
        alert('내용을 써주셔야 댓글 등록이 됩니다.');
    }
    else{
        //title과 content 줄 바꿈 부분을 <br>로 변형해서 저장한다.
        // 나중에 화면에 출력할때 한줄로 나와서 css가 깨지는게 아니라 여러줄로 나오게 한다
        //x 스크롤이 안생기기 바래도 자꾸 생기니까 줄바꿈 유지
        commentContent=commentContent.replace(/\n/g, "<br>");
        let content=commentContent.replace(/\r\n/g, "<br>");
        let boardId=${board.id};
        let writer=${sessionScope.loginId};
        commentAjax.add({
            content:content,
            boardId:boardId,
            writer:writer
        },function(result){
            console.log(result);
            //textarea 초기화하고 업데이트 반영해서 댓글 리스트 다시 불러와서 보여주기
            console.log()
            $('#writeComment textarea').val('');
            //getCommentList();
        });
    }


});


</script>
</html>