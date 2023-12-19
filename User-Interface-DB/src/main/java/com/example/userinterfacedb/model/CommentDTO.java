package com.example.userinterfacedb.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private int id;
    private int writer;
    private String writerLoginId;
    private String content;
//    private int alertNumber;
//    private int alertHandle;
    //mysql datetime과 호환되는 Timestamp
    private Timestamp writeTime;
    //foreign key
    private int boardId;
}
