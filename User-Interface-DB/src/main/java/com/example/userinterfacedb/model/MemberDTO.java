package com.example.userinterfacedb.model;

import lombok.Data;

@Data
public class MemberDTO {
    private int id;
    private String name;
    private String loginId;
    private String password;
}
