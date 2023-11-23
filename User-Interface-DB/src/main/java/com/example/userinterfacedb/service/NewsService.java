package com.example.userinterfacedb.service;

import com.example.userinterfacedb.model.NewsDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewsService {

    private SqlSession sqlSession;
    private final String NAMESPACE="com.example.userinterfacedb.NewsMapper";
    //이 sqlsession을 주입하기 위해서 프로젝트명~Application.java 메인에서 sqlsessionfactory를 빈으로 등록하였다

    @Autowired
    public NewsService(SqlSession sqlSession){
        this.sqlSession=sqlSession;
    }

    public NewsService(){

    }

    public List<NewsDTO> findNews (String newsKeyword){
        List<NewsDTO> newsDTOList=sqlSession.selectList(NAMESPACE+".findNews",newsKeyword);
        return newsDTOList;
    }
}
