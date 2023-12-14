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

        int memberId= (int)httpSession.getAttribute("loginId");
        boardDTO.setWriter(memberId);

        boardService.insertBoard(boardDTO);

        return "redirect:/goBoardList";
    }

    @GetMapping("/goBoardUpdate")
    public String goBoardUpdate(int id, Criteria criteria ,HttpSession httpSession ,Model model){
        if(httpSession.getAttribute("loginId")==null){
            return "redirect:/goLogin";
        }

        BoardDTO boardDTO= boardService.selectBoardById(id);

        //수정페이지로 갈때는 화면에서 줄바꿈으로 위해 db에 저장한 <br>을 자바에서 엔터로 인식하는 값으로 바꾼다
        //그러면 나중에 수정한 값을 db에 저장할때 어짜피 <br>로 처리하는 코드가 있으니까
        boardDTO.setTitle(boardDTO.getTitle().replaceAll("<br>", "\r\n"));
        boardDTO.setContent(boardDTO.getContent().replaceAll("<br>", "\r\n"));

        model.addAttribute("board",boardDTO);
        model.addAttribute("criteria",criteria);
        return "board-update-ui";
    }

    @PostMapping("/boardUpdateOk")
    public String boardUpdateOk(BoardDTO boardDTO, Criteria criteria, HttpSession httpSession ){
        if(httpSession.getAttribute("loginId")==null){
            return "redirect:/goLogin";
        }
// 어짜피 해당 원작자만 수정하기를 눌러서 수정하고, 글쓴이를 바꿀 필요 없으니 굳이 안넣어줘도 된다
//        int memberId= (int)httpSession.getAttribute("loginId");
//        boardDTO.setWriter(memberId);

       System.out.println("updateboardDTO"+boardDTO);

        boardService.boardUpdate(boardDTO);

        int page=criteria.getPage();
        int amount=criteria.getAmount();
        int id=boardDTO.getId();
        return "redirect:/goBoardDetail?id="+id+"&page="+page+"&amount="+amount;
    }

    //게시글 삭제
    @GetMapping("/boardDelete")
    public String boardDelete (@RequestParam(value="id")int id, Criteria criteria, HttpSession httpSession){
        if(httpSession.getAttribute("loginId")==null){
            return "redirect:/goLogin";
        }

        boardService.boardDelete(id);

        return "redirect:/goBoardList?page="+criteria.getPage()+"&amount="+criteria.getAmount();
    }
}
