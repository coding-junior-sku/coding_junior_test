let commentAjax=(function(){
    function add(commentDTO, callback){
        $.ajax({
            url: "/commentWriteOk",
            type: "post",
            data: JSON.stringify(commentDTO),
            contentType: "application/json; charset=utf-8",
            success: function(result){
                if(callback){
                    callback(result);
                }
            }/*,
            error: function(a, b, c){
                if(error){
                    error(a, b, c);
                }
            }*/
        });
    }

    function getList(param, callback){
        let page = param.page || 1;
        $.ajax({
            url: "/getCommentList/" + param.boardId + "/" + page,
            type: "get",
            success: function(result){
                if (callback){
                    callback(result);
                }
            },
            //async : false = 동기 (Synchronous 요청을 보낸 후 응답결과를 받아야지만 다음 동작이 이루어지는 방식)
            // 출처: https://simuing.tistory.com/entry/jQuery-jqZHR-란-ajax-async-true-false-차이 [시뮝 연구소:티스토리]
            async:false

        })
    }

    function update(commentDTO, callback, error) {
        $.ajax({
            url: "/commentUpdateOk",
            type: "post",
            data: JSON.stringify(commentDTO),
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                if (callback) {
                    callback(result);
                }
            }
        });
    }

    function remove(commentId, callback){
        $.ajax({
            url: "/commentDeleteOk/" + commentId,
            type: "get",
            success: function(result){
                if(callback){
                    callback(result);
                }
            }
        })
    }

    return {getList:getList, update:update, add:add, remove:remove}
})();