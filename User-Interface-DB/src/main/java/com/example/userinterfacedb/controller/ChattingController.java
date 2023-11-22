package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.ChatDTO;
import com.example.userinterfacedb.service.ChatService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller

public class ChattingController {
    ChatService chatService;

    @Autowired
    public ChattingController(ChatService chatService){
        this.chatService=chatService;
    }
    @GetMapping("/goChatting")
    public String goChatting(HttpSession httpSession, Model model){
        int chatRoomId= (int)httpSession.getAttribute("loginId");
        List<ChatDTO> chatDTOList=chatService.getChats(chatRoomId);
        model.addAttribute("chats",chatDTOList);
        return "chatting-ui";
    }





}
