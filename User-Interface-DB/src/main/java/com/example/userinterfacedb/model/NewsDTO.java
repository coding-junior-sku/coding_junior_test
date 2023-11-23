package com.example.userinterfacedb.model;

import lombok.Data;
import lombok.ToString;

import java.sql.Timestamp;

@Data
@ToString
public class NewsDTO {
    private long id;
    private String newsTitle;

    //mysql datetime과 호환되는 Timestamp
    private Timestamp newsWriteDate;

    private String newsDescription;
    private String newsLink;

}
