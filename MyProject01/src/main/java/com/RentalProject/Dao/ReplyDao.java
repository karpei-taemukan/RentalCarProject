package com.RentalProject.Dao;

import java.util.ArrayList;

import com.RentalProject.Dto.Reply;

public interface ReplyDao {

	int InsertReply(Reply re);

	int getMaxCode();

	ArrayList<Reply> getReplyList(String bno);

	int deleteReply(String renum);

}
