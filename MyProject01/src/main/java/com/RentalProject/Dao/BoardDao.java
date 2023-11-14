package com.RentalProject.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.RentalProject.Dto.Board;

public interface BoardDao {

	ArrayList<Board> getBoardList();

	Board getBoardDetail(String bno);

	int increaseReply(String bno);

	ArrayList<Board> getNoticeBoardList();

	int selectMaxBno();

	int insertWrite(@Param("buyerId") String buyerId, @Param("bno") int bno, @Param("btitle") String btitle, @Param("bcontents") String bcontents, @Param("bhits") int bhits, @Param("bstate")String bstate);

	int deleteBoard(@Param("bno") int bno, @Param("bwriter") String bwriter);

	Board selectBwriter(@Param("bwriter")String bwriter, @Param("bno")int bno);

	int updateBoard(@Param("bwriter") String bwriter, @Param("bno") int bno,@Param("btitle") String btitle,@Param("bcontents") String bcontents);

	int getBoardListCount(String boardType);

	// 11-06 추가
	ArrayList<String> getBoardContents(String mid);

}

