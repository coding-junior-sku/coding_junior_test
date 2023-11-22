package com.example.userinterfacedb.service;

import com.example.userinterfacedb.model.MemberDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    private SqlSession sqlSession;
    private final String NAMESPACE="com.example.userinterfacedb.MemberMapper";
    //이 sqlsession을 주입하기 위해서 프로젝트명~Application.java 메인에서 sqlsessionfactory를 빈으로 등록하였다

    @Autowired
    public MemberService(SqlSession sqlSession){
        this.sqlSession=sqlSession;
    }

    public MemberService(){

    }

    public int  checkId(String loginId){
        MemberDTO memberDTO= sqlSession.selectOne(NAMESPACE+".memberByLoginId",loginId);
        //존재해서 이미 있으면=> 중복 아이디 있다
        if(memberDTO !=null){
            return 1;
        }
        //존재하지 않아 없으면=>중복 아이디 없다
        else{
            return 0;
        }
    }

    public void joinMember(MemberDTO memberDTO){
        sqlSession.insert(NAMESPACE+".join",memberDTO);
    }

    public MemberDTO loginMember(MemberDTO memberDTO){
        MemberDTO loginMember;
        loginMember=sqlSession.selectOne(NAMESPACE+".loginOk",memberDTO);
        return loginMember;
    }



}
