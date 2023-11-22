package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.ChatDTO;
import com.example.userinterfacedb.service.ChatService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
/*

이처럼 @RestController 어노테이션을 명시했다면
따로 @ResponseBody 어노테이션을 명시하지 않아도
자동으로 HttpResponse의 본문 responseBody에 자바 객체가 매핑되어 전달됩니다.
 */
public class ChattingRestController {
    ChatService chatService;
    @Autowired
    public ChattingRestController(ChatService chatService){
        this.chatService=chatService;
    }
    @PostMapping("/insertChat")
    public String insertChat(@RequestBody ChatDTO chatDTO, HttpSession httpSession){
        int chatRoomId= (int)httpSession.getAttribute("loginId");
        //로그인아이디 멤버숫자->채팅방 번호
        //사람이 쓴 글이면 1을 넣어준다
        chatDTO.setChatRoomId(chatRoomId);
        chatDTO.setWriterIsHuman(1);
        chatService.insertChat(chatDTO);
        return "{\"result\":\"success\"}";
    }
}
