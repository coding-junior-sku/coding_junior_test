package com.example.userinterfacedb.service;

import com.example.userinterfacedb.model.BoardDTO;
import com.example.userinterfacedb.model.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    private SqlSession sqlSession;
    private final String NAMESPACE="com.example.userinterfacedb.BoardMapper";
    //이 sqlsession을 주입하기 위해서 프로젝트명~Application.java 메인에서 sqlsessionfactory를 빈으로 등록하였다

    @Autowired
    public BoardService(SqlSession sqlSession){
        this.sqlSession=sqlSession;
    }

    public BoardService(){

    }

    public void insertBoard(BoardDTO boardDTO){
        sqlSession.insert(NAMESPACE+".boardInsert",boardDTO);
    }

    public List<BoardDTO> selectBoardByPage(Criteria criteria){
        return sqlSession.selectList(NAMESPACE+".selectBoardByPage",criteria);

    }

    public int getTotalBoardCount(){
        return sqlSession.selectOne(NAMESPACE+".boardTotalCount");
    }

}
