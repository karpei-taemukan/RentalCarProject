package com.RentalProject.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.RentalProject.Dto.Board;
import com.RentalProject.Dto.Reply;
import com.RentalProject.Service.BoardService;
import com.RentalProject.Service.ReplyService;



@Controller
public class BoardController {

	@Autowired
	BoardService bsvc;
	
	@Autowired
	ReplyService rsvc;

	@RequestMapping(value = "/boardmove")
	public ModelAndView boardMove(double page) {
		System.out.println("후기 게시판 이동");
		ModelAndView mav = new ModelAndView();

		ArrayList<Board> boardList = bsvc.getBoardList();
		System.out.println("page : "+page);
		//하단 바 위치를 알기 위한 함수
		int nowPageList = (int)Math.ceil(page/10);
		
		// 게시판 페이지 갯수
		String BoardType = "S";
		int boardListCount = bsvc.getBoardListCount(BoardType)/10+1;
//		boardListCount = boardListCount /10 +1;
		
		mav.addObject("nowPageList", nowPageList);
		mav.addObject("boardlist", boardList);
		mav.addObject("boardListCount", boardListCount);
		mav.setViewName("board/boardMain");
		return mav;
	}
	
	@RequestMapping(value = "/noticeMove")
	public ModelAndView noticeMove(double page, HttpSession session) {
		System.out.println("공지사항 이동");
		ModelAndView mav = new ModelAndView();

		ArrayList<Board> boardList = bsvc.getNoticeBoardList();
		
		int nowPageList = (int)Math.ceil(page/10);
		
		// 게시판 페이지 갯수
		String BoardType = "N";
		int boardListCount = bsvc.getBoardListCount(BoardType)/10+1;
//		boardListCount = boardListCount /10 +1;

		// 관리자 확인용 값 
		String state = (String)session.getAttribute("loginState");
		
		mav.addObject("state",state);
		mav.addObject("nowPageList", nowPageList);
		mav.addObject("boardlist", boardList);
		mav.addObject("boardListCount", boardListCount);
		mav.setViewName("board/boardMain");
		
		mav.addObject("boardlist", boardList);
		mav.setViewName("board/noticeMain");
		return mav;
	}

	@RequestMapping(value = "/boardDetailmove")
	public ModelAndView boardDetailmove(String bno) {
		System.out.println("게시판 상세 이동");
		ModelAndView mav = new ModelAndView();

		Board boardDetail = bsvc.getBoardDetail(bno);
		ArrayList<Reply> rpList= rsvc.getReplyList(bno);
		System.out.println(rpList);
		
		mav.addObject("boardDetail", boardDetail);
		System.out.println(boardDetail);
		mav.addObject("replyList", rpList);
		
		mav.setViewName("board/boardDetail");
		return mav;
	}
	
	// 게시판 이동
	@RequestMapping(value = "/boardWriteMove")
	public ModelAndView boardWriteMove() {
		System.out.println("게시판 작성 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardWrite");
		return mav;
	}
	
	@RequestMapping(value = "/noticeWriteMove")
	public ModelAndView noticeWriteMove() {
		System.out.println("공지사항 작성 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/noticeWrite");
		return mav;
	}

	// 게시판 작성 입력
	@RequestMapping(value = "/boardWriteInsert")
	public ModelAndView boardWriteInsert(Board board,HttpSession session,RedirectAttributes ra) {
		System.out.println("게시판 작성 입력");
		ModelAndView mav = new ModelAndView();
		 
		String buyerId = (String)session.getAttribute("loginBId");
		String checKakao = (String)session.getAttribute("loginState");
		if(checKakao.equals("KA")) {
			buyerId = (String)session.getAttribute("loginName");
		}
		
		board.setBstate("S");
		
		try {
			int BoardWrite = bsvc.BoardWrite(board,buyerId);
			System.out.println(BoardWrite);
			
			if(BoardWrite < 0) {
				ra.addFlashAttribute("msg","글작성에 실패했습니다.");
				mav.setViewName("board/boardWrite");
			}else {
				ra.addFlashAttribute("msg","글작성에 성공했습니다.");
				mav.setViewName("redirect:/boardmove?page=1");
			}
				
		} catch (Exception e) {
	
			mav.setViewName("board/boardWrite");
		}
		
		
		return mav;
	}
	// 공지시항 작성 입력
	@RequestMapping(value = "/noticeWriteInsert")
	public ModelAndView noticeWriteInsert(Board board,HttpSession session,RedirectAttributes ra) {
		System.out.println("게시판 작성 입력");
		ModelAndView mav = new ModelAndView();
		
		String buyerId = (String)session.getAttribute("loginBId");
		
		board.setBstate("N");
		
		int BoardWrite = bsvc.BoardWrite(board,buyerId);
		System.out.println(BoardWrite);
		if(BoardWrite < 0) {
			ra.addFlashAttribute("msg","글작성에 실패했습니다.");
			mav.setViewName("board/noticeWrite");
		}else {
			ra.addFlashAttribute("msg","글작성에 성공했습니다.");
			mav.setViewName("redirect:/noticeMove?page=1");
		}
		
		return mav;
	}
	
	// 게시판 삭제
	@RequestMapping(value="/boardDelete")
	public ModelAndView boardDelete(int bno, String bwriter, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(bno + " " +bwriter);
		int BoardDelete = bsvc.boardDelete(bno,bwriter);
		
		ra.addFlashAttribute("msg", "글이 삭제되었습니다.");
		mav.setViewName("redirect:/boardmove?page=1");
		return mav;
	}
	
	// 게시판 수정
	@RequestMapping(value="/boardUpdateForm")
	public ModelAndView boardUpdateForm(HttpSession session, int bno) {
		ModelAndView mav = new ModelAndView();
			System.out.println("수정페이지로 이동");
			String bwriter = (String) session.getAttribute("loginBId");
			
			// 카카오 로그인 체크용
			String checKakao = (String)session.getAttribute("loginState");
			
			if(checKakao.equals("KA")) {
				bwriter = (String)session.getAttribute("loginName");
			}
			
			Board board = bsvc.getbwriterUpdateInfo(bwriter,bno);
			System.out.println("board : " + board);

			mav.addObject("bwriter",board.getBwriter());
			mav.addObject("bno",board.getBno());
			mav.addObject("bcontents",board.getBcontents());
			mav.addObject("btitle",board.getBtitle());

			mav.setViewName("board/boardUpdate");
		return mav;
		
	}
	
	@RequestMapping(value="/boardUpdate")
	public ModelAndView boardUpdate (String btitle, String bcontents,int bno,String bwriter,HttpSession session,RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("bno : " + bno);
		System.out.println("bwriter : " + bwriter);
		System.out.println("bcontents : " + bcontents);
	
		int BoardUpdate = bsvc.boardUpdate(bwriter,bno,btitle,bcontents);
		
		if(BoardUpdate < 0) {
			ra.addFlashAttribute("msg","수정에 실패했습니다");
			mav.setViewName("redirect:/boardmove");
		}else {
			ra.addFlashAttribute("msg","수정에 성공했습니다.");
			mav.setViewName("redirect:/boardDetailmove?bno="+bno);
		}
		return mav;
		
	}

}
