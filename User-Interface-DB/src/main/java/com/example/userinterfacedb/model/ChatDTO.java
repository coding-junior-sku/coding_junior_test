package com.example.userinterfacedb.model;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class ChatDTO {
    private long id;
    private  int chatRoomId;
    private int writerIsHuman;
    private String writeContent;
    private Timestamp writeTime;
}
