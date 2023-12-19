package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.MemberDTO;
import com.example.userinterfacedb.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/checkName/{name}")
    public int checkName2(@PathVariable String name){
        int count;
        count=memberService.checkName(name);
        return count;
    }

    @PostMapping("/idFind")
    public String findId(@RequestBody MemberDTO memberDTO){
        String userName= memberDTO.getName();
        System.out.println("넘어온 이름:"+userName);
        String loginId=memberService.findLoginId(userName);
        System.out.println("loginId : "+loginId);
        return loginId;
    }
}
