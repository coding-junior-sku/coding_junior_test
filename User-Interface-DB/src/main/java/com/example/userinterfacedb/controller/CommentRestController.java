package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.CommentDTO;
import com.example.userinterfacedb.model.CommentPaginationDTO;
import com.example.userinterfacedb.model.Criteria;
import com.example.userinterfacedb.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CommentRestController {

    CommentService commentService;

    @Autowired
    CommentRestController(CommentService commentService){
        this.commentService=commentService;
    }

    @GetMapping("/getCommentList/{boardId}/{page}")
    public CommentPaginationDTO getCommentList(@PathVariable("boardId")int boardId, @PathVariable("page")int page){
        //amount=>한 페이지에 3개씩 보이게 할 것이다
        //page=> javascript에서 globalThis.page => 현재 선택한 페이지
        List<CommentDTO> commentDTOList =commentService.selectCommentByPage(boardId,new Criteria().create(page,3));
        int commentTotalCount=commentService.commentTotalCount(boardId);

        CommentPaginationDTO commentPaginationDTO= new CommentPaginationDTO();
        commentPaginationDTO.setCommentCount(commentTotalCount);
        commentPaginationDTO.setCommentDTOList(commentDTOList);
        System.out.println(commentDTOList);
        return commentPaginationDTO;
    }

    @PostMapping("/commentUpdateOk")
    public String commentUpdateOk(@RequestBody CommentDTO commentDTO){
        commentService.commentUpdate(commentDTO);
        return "{\"result\":\"success\"}";
    }

    @GetMapping("/commentDeleteOk/{commentId}")
    public String commentDeleteOk(@PathVariable("commentId") int id){
        commentService.commentDelete(id);
        return "{\"result\":\"success\"}";
    }

    @PostMapping("/commentWriteOk")
    public String commentWriteOk(@RequestBody CommentDTO commentDTO){
        commentService.commentInsert(commentDTO);
        return "{\"result\":\"success\"}";
    }
}
