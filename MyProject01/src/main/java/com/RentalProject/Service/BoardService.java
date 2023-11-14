package com.RentalProject.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.RentalProject.Dao.BoardDao;
import com.RentalProject.Dto.Board;


@Service
public class BoardService {

	@Autowired
	BoardDao bdao;
	
	public ArrayList<Board> getBoardList() {
		
		return bdao.getBoardList();
	}

	public Board getBoardDetail(String bno) {
		
		int result = bdao.increaseReply(bno);
		
		return bdao.getBoardDetail(bno);
	}

	// 공지사항 이동
	public ArrayList<Board> getNoticeBoardList() {
		
		return bdao.getNoticeBoardList();
	}

	//글 작성실행
	public int BoardWrite(Board board, String buyerId) {
		
		System.out.println("글작성");
		int bno = bdao.selectMaxBno()+1;
		if(bno==0) {
			return 0;
		}
		
		board.setBno(bno);
		
		bno = board.getBno();
		String btitle = board.getBtitle();
		String bcontents = board.getBcontents();
		int bhits = board.getBhits();
		String bstate = board.getBstate();
		
		System.out.println(buyerId+bno+btitle+bcontents+bhits+bstate);
		int result = bdao.insertWrite(buyerId,bno,btitle,bcontents,bhits,bstate);
	
		return result;
	}

	public int boardDelete(int bno, String bwriter) {
		int boardDelete = bdao.deleteBoard(bno,bwriter); 
		return boardDelete;
	}

	public Board getbwriterUpdateInfo(String bwriter, int bno) {
		Board BwriterInfo = bdao.selectBwriter(bwriter,bno);
		
		return BwriterInfo;
	}

	public int boardUpdate(String bwriter, int bno, String btitle, String bcontents) {
		int BoardUpdate = bdao.updateBoard(bwriter,bno,btitle,bcontents);
		
		return BoardUpdate;
	}

	public int getBoardListCount(String boardType) {
		
		return bdao.getBoardListCount(boardType);
	}
	
	// 23-11-06 추가
	public ArrayList<Board> getHomeBoardList() {
	
		return bdao.getNoticeBoardList();
	}

	public ArrayList<String> getBoardContents(String mid) {

		return bdao.getBoardContents(mid);
	}
	
	
	
}
