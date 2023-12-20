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

    public int checkName(String name){
        MemberDTO memberDTO=sqlSession.selectOne(NAMESPACE+".memberByName",name);
        //존재해서 이미 있으면 중복이름
        if(memberDTO !=null){
            return 1;
        }
        //존재하지 않아 없으면 중복이름 없음
        else{
            return 0;
        }
    }

    public String findLoginId(String name){
        MemberDTO memberDTO=sqlSession.selectOne(NAMESPACE+".memberByName",name);
        System.out.println("memberDTO 아이디 찾기:"+memberDTO);
        //null에서 get속성으로 하면 에러가 나면서 아예 안되므로 원하는 방식대로 하려면 null return
        if(memberDTO==null){
            return null;
        }
        else{
            return memberDTO.getLoginId();
        }

    }

    public String findPassword(MemberDTO memberDTO){
        MemberDTO resultMemberDTO = sqlSession.selectOne(NAMESPACE+".memberByLoginIdAndName",memberDTO);
        System.out.println("memberDTO 비밀번호 찾기:"+resultMemberDTO);
        //null에서 get속성으로 하면 에러가 나면서 아예 안되므로 원하는 방식대로 하려면 null return
        if(resultMemberDTO==null){
            return null;
        }
        else{
            return resultMemberDTO.getPassword();
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
