package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.MemberDTO;
import com.example.userinterfacedb.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

    private MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService){
        this.memberService=memberService;
    }

    @GetMapping("/")
    public String showIndex(){
        return "index";
    }

    @GetMapping("/goJoin")
    public String goJoin(){
        return "join-ui";
    }

    @GetMapping("/goLogin")
    public String goLogin(){
        return "login-ui";
    }


    @GetMapping("/logout")
    public String logout(HttpSession httpSession){
        httpSession.removeAttribute("loginId");
        return "redirect:/";
    }

    @GetMapping("/goFindId")
    public String goFindId(){
        return "login-find-ui";
    }

    @PostMapping("/joinOk")
    public String joinOk(MemberDTO memberDTO){
        System.out.println(memberDTO);
        memberService.joinMember(memberDTO);
        return "redirect:/";
    }

    @PostMapping("/loginOk")
    public String loginOk(MemberDTO memberDTO, HttpSession httpSession, Model model){
        System.out.println(memberDTO);
        MemberDTO loginMember=memberService.loginMember(memberDTO);
        System.out.println(loginMember);
        //로그인 성공
        if(loginMember!=null){
            httpSession.setAttribute("loginId",loginMember.getId());
            return "redirect:/";
        }
        //로그인 실패
        else{
            model.addAttribute("fail","fail");
            return "login-ui";
        }
    }

}
