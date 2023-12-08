package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.ChatDTO;
import com.example.userinterfacedb.model.NewsDTO;
import com.example.userinterfacedb.model.NewsSummaryDTO;
import com.example.userinterfacedb.service.ChatService;
import com.example.userinterfacedb.service.NewsService;
import com.google.gson.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
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
        //db에서 일단 검색해서 있는지, 없는지 부터 파악한다.
        String newsKeyword=chatDTO.getWriteContent();
        List<NewsDTO> newsList=newsService.findNews(newsKeyword);


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

            ArrayList<NewsSummaryDTO> newsSummaryDTOList = new ArrayList<>();
            JsonArray jsonArray = new JsonArray();
            Iterator<NewsDTO> newsDTOIterator = newsList.iterator();
            while(newsDTOIterator.hasNext()){
                //뉴스 기사를 하나 찾을때마다 미리 뉴스 요약 리스트에 넣어줌
                //나중에 챗봇이 준 값으로 뉴스 요약 리스트에 기사내용을 넣을 것임
                //뉴스 원문으로 요청을 보내야하기 때문에 json object에는 뉴스 원문을 미리 넣어주자
                NewsSummaryDTO newsSummaryDTO= new NewsSummaryDTO();
                NewsDTO newsDTO=newsDTOIterator.next();
                newsSummaryDTO.setId(newsDTO.getId());
                newsSummaryDTO.setNewsTitle(newsDTO.getNewsTitle());
                newsSummaryDTO.setNewsWriteDate(newsDTO.getNewsWriteDate());
                newsSummaryDTO.setNewsLink(newsDTO.getNewsLink());
                newsSummaryDTOList.add(newsSummaryDTO);

                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("description",newsDTO.getNewsDescription());

                jsonArray.add(jsonObject);

            }
            System.out.println(newsSummaryDTOList.toString());


            RestTemplate restTemplate= new RestTemplate();
            HttpHeaders headers= new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);


            

            HttpEntity<String> request= new HttpEntity<>(jsonArray.toString(),headers);
            //jsonarrary를 string형태로 받는다
            String response=restTemplate.postForObject("http://localhost:8000/getSummaries/",request,String.class);
            System.out.println("response:"+response);
            //JsonElement가 JsonObject를 가지고 있을 수도 , JsonArray를 가지고 있을 수도
            //JsonElement가 상위 개념
            JsonElement jsonElement = JsonParser.parseString(response);
            System.out.println("jsonElement:"+jsonElement);

            JsonArray responseJsonArray= jsonElement.getAsJsonArray();
            System.out.println(responseJsonArray);


            //JsonArray에서 하나 뽑은게 JsonElement
            int i=0;
            for(JsonElement e: responseJsonArray){

                //json object로 안인식
                ////"{\"summary\":\"OPECOPEC러시아가 전일 자발적 감산을 발표했지만 국제유가는 2 이상 급락했습니다.\\n이는 전일 OPEC가 일일 100만 배럴의 추가 감산을 발표했지만 자발적 감산이어서 회원국간 약속이 지켜지지 않을 것이란 전망 때문으로 풀이됩니다.\\n전일 OPEC는 추가로 일일 100만 배럴 모두 220만 배럴의 감산을 선언했으나 자발적 감산이라고 밝혔습니다.\"}"

                //json object로 인식
                //{"summary":"{\"summary\":\"OPECOPEC러시아가 전일 자발적 감산을 발표했지만 국제유가는 2 이상 급락했습니다.\\n이는 전일 OPEC가 일일 100만 배럴의 추가 감산을 발표했지만 자발적 감산이어서 회원국간 약속이 지켜지지 않을 것이란 전망 때문으로 풀이됩니다.\\n전일 OPEC는 추가로 일일 100만 배럴 모두 220만 배럴의 감산을 선언했으나 자발적 감산이라고 밝혔습니다.\"}"}
                System.out.println("e:"+e);

                //이렇게 접근못함
                //System.out.println("e.get('summary'):"+e.get("summary"));

                System.out.println("e.getAsJsonObject():"+e.getAsJsonObject());
                newsSummaryDTOList.get(i).setNewsSummary(e.getAsJsonObject().get("summary").getAsString());
                i++;
            }

            System.out.println("프론트로 보내는 결과들");
            System.out.println(newsSummaryDTOList);
            //뉴스 요약 리스트들을 돌려주는 챗봇의 대화 내역 저장
            //뉴스 요약 리스트들을 프론트단으로 보내서 출력한다
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
