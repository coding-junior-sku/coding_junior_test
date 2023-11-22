package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberRestController {
    private MemberService memberService;

    @Autowired
    public MemberRestController(MemberService memberService){
        this.memberService=memberService;
    }

    @GetMapping("/checkId/{loginId}")
    public int checkId(@PathVariable String loginId){
        int count;
        count=memberService.checkId(loginId);
        return count;
    }
}
