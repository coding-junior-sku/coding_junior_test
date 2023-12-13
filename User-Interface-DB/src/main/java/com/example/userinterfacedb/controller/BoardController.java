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
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/goBoardDetail")
    //글 디테일 들어갔다가 다시 목록으로 나올때(리스트컨트롤러) 봤던 페이지 page amount를 기억해서 넘겨주고 리스트 컨트롤러한테 넘겨주어야한다.
    // 기본적으로 파라미터는 string으로 받아진다
    // @RequestParam은 자동으로 타입을 변환해준다.
    public String goBoardDetail(@RequestParam(value="id")int id, Criteria criteria , Model model){
        if(criteria.getPage() == 0){
            criteria.create(1, 5);
        }
        //startindex를 계산해야하기때문
        else{
            int currentPage=criteria.getPage();
            int currentAmount=criteria.getAmount();
            criteria.create(currentPage,currentAmount);
        }
        System.out.println("criteria:"+criteria);
       BoardDTO boardDTO= boardService.selectBoardById(id);
       model.addAttribute("board",boardDTO);
       model.addAttribute("criteria",criteria);
       return "board-detail";
    }
    @GetMapping("/goBoardWrite")
    public String boardWrite (HttpSession httpSession){
        if(httpSession.getAttribute("loginId")==null){
            return "redirect:/goLogin";
        }
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
