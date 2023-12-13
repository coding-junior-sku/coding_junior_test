package com.example.userinterfacedb.model;

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;

@Data
public class Criteria {

    private int page;
    private int amount;
    //limit 첫번째 파라미터가 0으로 시작 두번째 파라미터는 몇개
    private int startIndex;
    private int endIndex;

    public Criteria create(int page, int amount) {
        this.page = page;
        this.amount = amount;
        this.startIndex=(page -1) * amount;
        this.endIndex=page * amount;
        return this;
    }

    public String getQueryString(){
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("page", this.page)
                .queryParam("amount", this.amount)
                .queryParam("startIndex", this.startIndex)
                .queryParam("endIndex", this.endIndex);
        return builder.toUriString();
    }

}
