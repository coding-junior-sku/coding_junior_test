package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.ChatDTO;
import com.example.userinterfacedb.model.NewsDTO;
import com.example.userinterfacedb.service.ChatService;
import com.example.userinterfacedb.service.NewsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Iterator;
import java.util.List;

@RestController
/*

이처럼 @RestController 어노테이션을 명시했다면
따로 @ResponseBody 어노테이션을 명시하지 않아도
자동으로 HttpResponse의 본문 responseBody에 자바 객체가 매핑되어 전달됩니다.
 */
public class ChattingRestController {
    ChatService chatService;
    NewsService newsService;
    @Autowired
    public ChattingRestController(ChatService chatService,NewsService newsService){

        this.chatService=chatService;
        this.newsService=newsService;
    }
    @PostMapping("/userInsertChat")
    public String userInsertChat(@RequestBody ChatDTO chatDTO, HttpSession httpSession){
        int chatRoomId= (int)httpSession.getAttribute("loginId");
        //로그인아이디 멤버숫자->채팅방 번호
        //사람이 쓴 글이면 1을 넣어준다
        chatDTO.setChatRoomId(chatRoomId);
        chatDTO.setWriterIsHuman(1);

        //사용자의 채팅 내역 저장
        chatService.insertChat(chatDTO);


        //사용자가 입력한 값을
        //db에서 검색해서 django로 보내고, 챗봇에게 답변을 받아온다
        String newsKeyword=chatDTO.getWriteContent();
        List<NewsDTO> newsList=newsService.findNews(newsKeyword);
//        Iterator<NewsDTO> newsDTOIterator = newsList.iterator();
//        while(newsDTOIterator.hasNext()){
//            System.out.println(newsDTOIterator.next());
//        }
        System.out.println(newsList.toString());

        //사용자가 키워드를 정확히 입력하지 않았거나, 해당 키워드에 대한 뉴스가 적재되지 않았다면
        if(newsList==null || newsList.isEmpty()){

            //뉴스 기사를 찾지 못한것에 대한 챗봇의 가이드 대화 내역도 저장
            ChatDTO chatbotChatDTO = new ChatDTO();
            //로그인아이디 멤버숫자->채팅방 번호
            //챗봇이 쓴 글이면 0을 넣어준다
            chatbotChatDTO.setChatRoomId(chatRoomId);
            chatbotChatDTO.setWriterIsHuman(0);
            String failGuide="뉴스기사를 찾지 못했습니다. 키워드를 정확히 입력해주세요. 또는 아직 해당 키워드에 관련된 기사가 적재되어있지 않습니다.";
            chatbotChatDTO.setWriteContent(failGuide);

            chatService.insertChat(chatbotChatDTO);
            return "{\"result\":\"fail\"}";

        }
        
        else{
            //django로 뉴스들을 보내고 , 챗봇에게 답변을 받아온다.

            return "{\"result\":\"success\"}";
        }


    }


//    @PostMapping("/chatbotInsertChat")
//    public String chatbotInsertChat(@RequestBody ChatDTO chatDTO, HttpSession httpSession){
//        int chatRoomId= (int)httpSession.getAttribute("loginId");
//        //로그인아이디 멤버숫자->채팅방 번호
//        //챗봇이 쓴 글이면 0을 넣어준다
//        chatDTO.setChatRoomId(chatRoomId);
//        chatDTO.setWriterIsHuman(0);
//
//        chatService.insertChat(chatDTO);
//
//        return "{\"result\":\"success\"}";
//    }


}
