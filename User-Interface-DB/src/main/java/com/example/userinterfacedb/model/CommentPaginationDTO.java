package com.example.userinterfacedb.model;

import lombok.Data;

import java.util.List;

@Data
public class CommentPaginationDTO {
    private int commentCount;
    private List<CommentDTO> commentDTOList;

}

