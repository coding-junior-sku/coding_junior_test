package com.example.userinterfacedb.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class NewsSummaryDTO {
    private long id;
    private String newsTitle;

    //mysql datetime과 호환되는 Timestamp
    private Timestamp newsWriteDate;

    private String newsSummary;
    private String newsLink;
}
