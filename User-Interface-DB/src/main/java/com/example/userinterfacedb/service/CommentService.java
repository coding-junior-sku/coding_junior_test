package com.example.userinterfacedb.service;

import com.example.userinterfacedb.model.CommentDTO;
import com.example.userinterfacedb.model.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CommentService {

    private SqlSession sqlSession;
    private final String NAMESPACE="com.example.userinterfacedb.CommentMapper";
    //이 sqlsession을 주입하기 위해서 프로젝트명~Application.java 메인에서 sqlsessionfactory를 빈으로 등록하였다

    @Autowired
    public CommentService(SqlSession sqlSession){
        this.sqlSession=sqlSession;
    }

    public CommentService(){

    }

    public List<CommentDTO> selectCommentByPage(int boardId , Criteria criteria ){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("criteria",criteria);
        map.put("boardId",boardId);
        return sqlSession.selectList(NAMESPACE+".selectCommentByPage");
    }

    public int commentTotalCount(int boardId){
        return sqlSession.selectOne(NAMESPACE+".commentTotalCount",boardId);
    }

    public void commentInsert(CommentDTO commentDTO){
        sqlSession.insert(NAMESPACE+".commentInsert",commentDTO);
    }

}
