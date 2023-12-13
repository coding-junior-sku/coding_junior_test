<%@page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본글 신고 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="/resources/css/admin_alert_boardlist.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <style>
        
    </style>
</head>
<body>
    <div id="logobox"><div id="logo"><a href="#"></a></div></div>
    
    <div id="main_body">
        <div id="subnavigation">
            <ul>
                <li class="menu">
                    <a><span>본글 신고</span><span class="rightarrow"></span></a>
                    <ul class="hide">
                        <li class="normalcolor"><a>본글 신고 목록</a></li>
                        
                    </ul>
                </li>
                
                <li class="menu">
                    <a><span>댓글 신고</span><span class="rightarrow"></span></a>
                    <ul class="hide">
                        <li class="normalcolor"><a>댓글 신고 목록</a></li>
                        
                        
                    </ul>
                </li>
                
                
            </ul>
        </div>
        <div id="subnavigation_result">
            <div id="subnavigation_result_header">
                <div id="subnavigation_result_title">
                    <h2>본글 신고 목록</h2>
                    <span>본글 신고 들어온 리스트입니다.</span>
                </div>
             
            </div>

            <div id="subnavigation_result_body">

                <div id="table_section">
                    <table id="boardlist">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>글쓴이</th>
                                <th>제목</th>
                                <th>신고수</th>
                                <th>작성시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>kjn</td>
                                <td>악플</td>
                                <td>1</td>
                                <td>yyyy-mm-dd hh:mm:ss</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                

                

                
                

            </div>
            
           
            <div id="page_action">
              
                <div id="page_arrow">
                    <span></span>
                    <span>1</span>
                    <span>2</span>
                    <span>3</span>
                    <span>4</span>
                    <span>5</span>
                    <span>6</span>
                    <span>7</span>
                    <span>8</span>
                    <span>9</span>
                    <span>10</span>
                    <span></span>
                </div>
            
            
            </div>  
            
            
        </div>
    </div>
</body>
<script>
    let flag=0;
    let prev;
    let flag2=0;
    let prev2;
// html dom 이 다 로딩된 후 실행된다
$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $(".menu>a").click(function(){
        var submenu = $(this).next("ul");
        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기            
        if( submenu.is(":visible") ){
            submenu.slideUp();
            $(this).css('backgroundColor','#293a50');
        }else{
            //클릭하고나서 화면상에 안보일시 무조건 펼친다.
            submenu.slideDown();
          
            $(this).css('backgroundColor','#3a495e');
        }

        var arrow=$(this).children().eq(1);
        if(arrow.hasClass('rightarrow')){
            arrow.removeClass('rightarrow');
            arrow.addClass('downarrow');
        }
        else if(arrow.hasClass('downarrow')){
            arrow.removeClass('downarrow');
            arrow.addClass('rightarrow');
        }
        
    });
    
  
    
   $(".hide>li").click(function(){
    if($(this).hasClass('normalcolor')){
            $(this).removeClass('normalcolor');
            $(this).addClass('clickcolor');
            console.log($(this).hasClass('clickcolor'));
            if(flag!=0){
                $(prev).removeClass('clickcolor');
                $(prev).addClass('normalcolor');
            }
            

            prev=$(this);
            flag++;
            console.log("변경됨");
        }
        else if($(this).hasClass('clickcolor')){
            $(this).removeClass('clickcolor');
            $(this).addClass('normalcolor');
            prev=$(this);
            console.log($(this).attr('backgroundColor'));
        }
   });

   
    
});
</script>
    


</html>