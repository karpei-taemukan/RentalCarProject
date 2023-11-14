package com.RentalProject.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.RentalProject.Dao.ReplyDao;
import com.RentalProject.Dto.Reply;

@Service
public class ReplyService {
	
	@Autowired
	ReplyDao rdao;
	
	public int InsertReply(Reply re) {
		
		int maxCode = rdao.getMaxCode() + 1;
		
		re.setRenum(maxCode);
		
		return rdao.InsertReply(re);
	}

	public ArrayList<Reply> getReplyList(String bno) {
		
		return rdao.getReplyList(bno);
	}

	public int deleteReply(String renum) {
		
		return rdao.deleteReply(renum);
	}


	
	
	
	
	
}
