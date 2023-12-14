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
        List<CommentDTO> commentDTOList =commentService.selectCommentByPage(boardId,new Criteria().create(page,3));
        int commentTotalCount=commentService.commentTotalCount(boardId);

        CommentPaginationDTO commentPaginationDTO= new CommentPaginationDTO();
        commentPaginationDTO.setCommentCount(commentTotalCount);
        commentPaginationDTO.setCommentDTOList(commentDTOList);

        return commentPaginationDTO;
    }

    @PostMapping("/commentWriteOk")
    public String commentWriteOk(@RequestBody CommentDTO commentDTO){
        commentService.commentInsert(commentDTO);
        return "{\"result\":\"success\"}";
    }
}
