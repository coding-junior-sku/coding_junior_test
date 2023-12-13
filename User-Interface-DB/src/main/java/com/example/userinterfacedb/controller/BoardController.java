package com.example.userinterfacedb.controller;

import com.example.userinterfacedb.model.BoardDTO;
import com.example.userinterfacedb.model.Criteria;
import com.example.userinterfacedb.model.PageDTO;
import com.example.userinterfacedb.service.BoardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class BoardController {

    BoardService boardService;
    public BoardController(BoardService boardService){
        this.boardService=boardService;
    }
    @GetMapping("/goBoardList")
    public String goBoardList(Criteria criteria , Model model){
        if(criteria.getPage() == 0){
            criteria.create(1, 5);
        }
        //startindex를 계산해야하기때문
        else{
            int currentPage=criteria.getPage();
            int currentAmount=criteria.getAmount();
            criteria.create(currentPage,currentAmount);
        }
        
        List<BoardDTO> boardDTOList= boardService.selectBoardByPage(criteria);
        model.addAttribute("boardList",boardDTOList);
        model.addAttribute("pagination",new PageDTO().createPageDTO(criteria,boardService.getTotalBoardCount() ) );
        System.out.println("criteria:"+criteria);
        System.out.println("pagination:"+new PageDTO().createPageDTO(criteria,boardService.getTotalBoardCount() ));
        return "board-ui";
    }
    @GetMapping("/goBoardWrite")
    public String boardWrite (){
        return "write-ui";
    }

    @PostMapping("/boardWriteOk")
    //json이 아니므로 requestbody 안쓰고도 바로 자바객체에 매핑
    public String boardWriteOk(BoardDTO boardDTO , HttpSession httpSession){
        if(httpSession.getAttribute("loginId")==null){
            return "redirect:/goLogin";
        }
        //이거는 primary key int이므로 진짜 로그인 아이디를 찾아야한다
        int memberId= (int)httpSession.getAttribute("loginId");
        boardDTO.setWriter(memberId);

        boardService.insertBoard(boardDTO);

        return "redirect:/goBoardList";
    }
}
