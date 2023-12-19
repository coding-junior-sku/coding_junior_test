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
<%--                <div id="alertSection">--%>
<%--                    <div>--%>
<%--                        <span>신고하기</span>--%>
<%--                        <image src="resources/images/alert_icon.png"/>--%>
<%--                    </div>--%>
<%--                   --%>
<%--                </div>--%>
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
<%--            <div class="comment">--%>
<%--                <div class="commentHeader"><div>닉네임</div><div>날짜</div></div>--%>
<%--                <div class="commentContent">--%>
<%--                    댓글 본문 글--%>
<%--                </div>--%>
<%--                <div class="commentAlert">--%>
<%--                    <div>--%>
<%--                        <span>신고하기</span>--%>
<%--                        <span></span>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--                <div class="commentButton">--%>
<%--                    <button>수정</button>--%>
<%--                    <button>삭제</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="comment">--%>
<%--                <div class="commentHeader"><div>닉네임</div><div>날짜</div></div>--%>
<%--                <div class="commentContent">--%>
<%--                    댓글 본문 글--%>
<%--                </div>--%>
<%--                <div class="commentAlert">--%>
<%--                    <div>--%>
<%--                        <span>신고하기</span>--%>
<%--                        <span></span>--%>
<%--                    </div>--%>
<%--                   --%>
<%--                </div>--%>
<%--                <div class="commentButton">--%>
<%--                    <button>수정</button>--%>
<%--                    <button>삭제</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="comment">--%>
<%--                <div class="commentHeader"><div>닉네임</div><div>날짜</div></div>--%>
<%--                <div class="commentContent">--%>
<%--                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문1111111111111111111111111111111111111111111111111--%>
<%--                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글--%>
<%--                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글--%>
<%--                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글--%>
<%--                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글--%>
<%--                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글--%>
<%--                    댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글댓글 본문 글--%>
<%--                    댓글 본문 댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문--%>
<%--                    댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문--%>
<%--                    댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문댓글 본문--%>
<%--                --%>
<%--                </div>--%>
<%--                <div class="commentAlert">--%>
<%--                    <div>--%>
<%--                        <span>신고하기</span>--%>
<%--                        <span></span>--%>
<%--                    </div>--%>
<%--                    --%>
<%--                </div>--%>
<%--                <div class="commentButton">--%>

<%--                    <button>수정</button>--%>
<%--                    <button>삭제</button>--%>
<%--                </div>--%>
<%--            </div>--%>


        </div>

        <!--댓글 페이징 처리 구역-->
        <div id="commentPaging">
<%--            <button id="commentPrevious"></button>--%>
<%--            <button>11</button>--%>
<%--            <button>12</button>--%>
<%--            <button>13</button>--%>
<%--            <button>14</button>--%>
<%--            <button>15</button>--%>
<%--            <button>16</button>--%>
<%--            <button>17</button>--%>
<%--            <button>18</button>--%>
<%--            <button>19</button>--%>
<%--            <button>20</button>--%>
<%--            <button id="commentNext"></button>--%>
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
getCommentList();


function getCommentList(){
    commentAjax.getList({
        boardId:${board.id},
        page:globalThis.page
    },showCommentList);
}

function showCommentList(result){
    let totalComment='';
    //commentpaginationdto의 속성값으로 접근해야함
    result.commentDTOList.forEach(commentDTO=>{
        let oneComment='';
        oneComment+='<div class="comment">';
            oneComment+='<div class="commentHeader"><div>'+commentDTO.writerLoginId+'</div><div>'+commentDTO.writeTime+'</div></div>';
            oneComment+='<div class="commentContent" data-comment-number="'+commentDTO.id+'">';
                oneComment+=commentDTO.content;
            oneComment+='</div>';
            // oneComment+='<div class="commentAlert">';
            //     oneComment+='<div>';
            //         oneComment+='<span>신고하기</span>';
            //         oneComment+='<span></span>';
            //     oneComment+='</div>';
            //
            // oneComment+='</div>';
            if(${sessionScope.loginId}==commentDTO.writer){
                oneComment+='<div class="commentButton">';
                oneComment+='<button class="commentUpdate" data-comment-number="'+commentDTO.id+'">수정</button>';
                oneComment+='<button class="commentDelete" data-comment-number="'+commentDTO.id+'">삭제</button>';
                oneComment+='</div>';
            }

        oneComment+='</div>';

        totalComment+=oneComment;
    });

    $('#CommentSection').html(totalComment);
    console.log(totalComment);

    //댓글 페이지네이션 함수에게 총 댓글 갯수 넘기기
    //commentpaginationdto의 속성값으로 접근해야함
    commentPagination(result.commentCount);
}

//댓글 페이지네이션 버튼들 만들기
function commentPagination(commentCount){
    //한페이지에 보이는 버튼 갯수
    let pageCount=10;
    // 현재 페이지를 기준으로 페이지 단위에 맞춰서 마지막 페이지 계산
    let endPage = (Math.ceil( globalThis.page / pageCount)) * pageCount;
    let startPage = endPage - pageCount + 1;

    // 게시글 전체 개수를 통해 가장 마지막 페이지 계산
    //한번에 3개씩 보이게 할 것이다.
    let realEnd = (Math.ceil(commentCount / 3));

    // 만약 가장 마지막 페이지보다 마지막 페이지가 더 클 경우(endPage는 배수로 증가하기 떄문)
    if(realEnd < endPage){
        // 게시글이 한 개도 없다면, realEnd는 0이 되고, endPage도 0이 된다.
        // 따라서 realEnd가 0이라면 endPage를 1로 변경해주어야 한다.
        endPage = realEnd === 0 ? 1 : realEnd;
    }

    console.log(endPage);
    let prev = startPage > 1;
    let next = endPage < realEnd;

    let commentPaging='';
    if(prev===true){
        commentPaging+='<button id="commentPrevious" class="pagingButton" data-page-number="'+(startPage-1)+'"></button>';

    }

    for(let i=startPage;i<=endPage;i++){
        if(globalThis.page==i){
            commentPaging+='<button disabled>'+i+'</button>';
        }
        /*
             data-속성명 으로 html 태그안에 아래와 같이 넣어준다
             이때 중요한것은 속성명은 절대 camelCase  가 아닌 kebab-case 로 작성되어야한다.
             event listener 로 가져오는 방법
             예시)const data = e.target.dataset
             JS 로 넘어올때는
             camelCase 로 변환되어 넘어오게된다.
             예시)const value = e.target.dataset.veryVeryLongName
             data 의 속성의 값은 무조건 string
             https://leestrument.tistory.com/entry/HTML-%EC%9A%94%EC%86%8C%EC%97%90-%EC%82%AC%EC%9A%A9%EC%9E%90-%EC%A0%95%EC%9D%98-%EC%86%8D%EC%84%B1-%EB%84%A3%EA%B8%B0-feat-data-%EC%86%8D%EC%84%B1
          */
        else{
            commentPaging+='<button class="pagingButton" data-page-number="'+i+'">'+i+'</button>';
        }

    }

    if(next===true){
        commentPaging+='<button id="commentNext" class="pagingButton" data-page-number="'+ (endPage+1)+'"></button>';
    }

    $('#commentPaging').html(commentPaging);

}

//답글 페이징 버튼
//이벤트 위임->자식들이 얼마나 추가될지 모를때 자식들한테 이벤트 공통적 적용
// 이벤트의 위임을 이용하면 현재 존재하는 자손 요소뿐만 아니라, 나중에 추가되는 자손 요소까지도 모두 자동으로 연결됩니다.
$('#commentPaging').on('click','.pagingButton',function(event){
    event.preventDefault();
    /*
           target: 이벤트를 발생시킨 요소
           currentTarget: 현재 이벤트가 발생한 요소
           e.currentTarget은 이 이벤트가 걸려있는 그 요소를 가져오고,
           e.target은 내가 누른 요소! 즉 버블링의 시초를 가져온다.
        */

    let currentPageNum= event.currentTarget.dataset.pageNumber;
    globalThis.page=currentPageNum;
    getCommentList();
});

//답글 수정 버튼
let clickedCommentNum=0;
let currentCommentNum=0;
let alreadyClicked=false;
$(document).ready(function () {

});
$('#CommentSection').on('click','.commentUpdate',function(event){
    event.preventDefault();
    /*
           target: 이벤트를 발생시킨 요소
           currentTarget: 현재 이벤트가 발생한 요소
           e.currentTarget은 이 이벤트가 걸려있는 그 요소를 가져오고,
           e.target은 내가 누른 요소! 즉 버블링의 시초를 가져온다.
      */
    let currentCommentNum=event.currentTarget.dataset.commentNumber;
    if(alreadyClicked===false){

        //수정 모드에서는 화면에서 줄바꿈으로 위해 db에 저장한 <br>을 윈도우?자바?에서 엔터로 인식하는 값으로 바꾼다
        //그러면 나중에 수정한 값을 db에 저장할때 어짜피 <br>로 처리하는 코드가 있으니까
        //이걸 textarea에 넣어줌
        let commentContent=$('.commentContent[data-comment-number='+currentCommentNum+']').text();
        console.log(commentContent);
        commentContent=commentContent.replace(/<br>/g, "\r\n");
        //$('.commentContent[data-comment-number='+currentCommentNum+']').val(commentContent);

        //div를 textarea로
        //자기자신의 태그를 jquery로 바꾸는 법
       /* $("#testdiv").clone().wrapAll("<div/>").parent().html();를 하면 됩니다.
            선택한 엘리먼트 집합의 복사본을 만들고 wrapAll을 이용해서 div로 전체를 감싸버린 뒤
        parent()로 div로 올라가서 그안에 html()을 가져오면 $("#testdiv") 자체의 HTML을 가져올 수 있습니다.
        바닐라 자바스크립트 =>document.getElementById("spanid1").outerHTML*/
        // html('')안에 변수를 구분하지 않고 한번에 넣으면 변수가 아니라 문자열 그대로 인식
        //html은 지정한 요소의 하위요소를 바꿔준다
       // $('.commentContent[data-comment-number='+currentCommentNum+']').clone().wrapAll("<div/>").parent().html('<textarea class="commentContent" data-comment-number="'+currentCommentNum+'">'+commentContent+'</textarea>');
        //console.log($('.commentContent[data-comment-number='+currentCommentNum+']').clone().wrapAll("<div/>").parent().html());
        //clone이니까 적용된게 화면에 안보이고 원본에 대입해줘야 하는걸까?
        //$('.commentContent[data-comment-number='+currentCommentNum+']')= $('.commentContent[data-comment-number='+currentCommentNum+']').clone().wrapAll("<div/>").parent().html('<h1>hi</h1>');


        /*
        //$( 'h2' ).contents().unwrap().wrap( '<p></p>' );
        h2 요소를 선택하고
        내용으로 들어간 후
        h2 태그를 없애고
        p 태그로 감싼다.
        새로운 태그를 붙이면서 클래스를 넣을 수도 있습니다.
        =>내용으로 들어가서 기존 태그를 없애고 새로운 태그를 붙이기 때문에 기존 내용은 존재! 이걸 모르고 새로운 태그에 내용을 또 써주면
        내용이 2번 반복해서 들어간다.

        제이쿼리에서 html 태그를 삭제하는 것이 아닌 태그안에 있는 내용을 지워야할 경우가 있습니다. 
        그럴경우 empty() 함수를 사용합니다.
        출처: https://pm1122dev.tistory.com/133 [pm1122dev의 비밀노트:티스토리]
         */
        $('.commentContent[data-comment-number='+currentCommentNum+']').contents().unwrap().wrap('<textarea style="resize:none; width:100%; height:100%;" class="commentContent" data-comment-number="'+currentCommentNum+'"></textarea>');

        // 바닐라 자바스크립트로 이런식으로 해도 된다
        //console.log(document.querySelector(".commentContent[data-comment-number='"+currentCommentNum+"']"));
        //document.querySelector(".commentContent[data-comment-number='"+currentCommentNum+"']").outerHTML= '<h1>hi</h1>';


        //수정완료  버튼으로  바꾸기
       // 여기다가 onclick 함수를 달아주자
        //하지만 위에처럼 똑같이 하면 완료(새롭게 태그 내용) 수정(기존 contents) 식으로 되어서
        //empty를 써보았지만 잘 안됨.

        //$('.commentUpdate[data-comment-number='+currentCommentNum+']').empty().contents().unwrap().wrap('<button class="commentUpdate" data-comment-number="'+currentCommentNum+'">수정완료</button>');
        //상위의 상위 태그를 제거해버리므로 html로 내용을 바꿔준다음 가짜로 만든 바로 위 태그를 없애기 위해 children으로 button 변수자체로 내려가  unwrap을 한다
        $('.commentUpdate[data-comment-number='+currentCommentNum+']').wrap('<div>').parent().html('<button class="commentUpdate" data-comment-number="'+currentCommentNum+'">수정완료</button>').children().unwrap();

        clickedCommentNum=currentCommentNum;
        alreadyClicked=true;
    }
    //이미 눌렀었던 상태에서 아까눌렀던 댓글번호와 현재 누른 댓글 번호가 다르면 다른 대상을 눌렀으므로 수정 완료버튼 동작 불가능
    if(alreadyClicked==true && clickedCommentNum!=currentCommentNum){
        alert("이미 다른 댓글을 수정하기로 해놓고서는 완료안했습니다.");
    }

});

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
            $('#writeComment textarea').val('');
            getCommentList();
        });
    }


});


</script>
</html>