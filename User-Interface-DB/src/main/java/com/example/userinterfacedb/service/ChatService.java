package com.example.userinterfacedb.service;

import com.example.userinterfacedb.model.ChatDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {
    private SqlSession sqlSession;
    private final String NAMESPACE="com.example.userinterfacedb.ChatMapper";
    //이 sqlsession을 주입하기 위해서 프로젝트명~Application.java 메인에서 sqlsessionfactory를 빈으로 등록하였다

    @Autowired
    public ChatService(SqlSession sqlSession){
        this.sqlSession=sqlSession;
    }

    public ChatService(){

    }

    public List<ChatDTO> getChats(int chatRoomId){
        List<ChatDTO> chatDTOList=sqlSession.selectList(NAMESPACE+".takeChats",chatRoomId);
        return chatDTOList;
    }

    public void insertChat(ChatDTO chatDTO){
        sqlSession.insert(NAMESPACE+".insertChat",chatDTO);
    }
}
