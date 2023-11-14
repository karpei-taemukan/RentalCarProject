package com.RentalProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.RentalProject.Dto.Reply;
import com.RentalProject.Service.CarService;
import com.RentalProject.Service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	ReplyService rsvc;

	@RequestMapping(value = "/replyInsert")
	public ModelAndView replyInsert(Reply re, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String loginBId = (String) session.getAttribute("loginBId");
		String loginSId = (String) session.getAttribute("loginSId");

		String checKakao = (String) session.getAttribute("loginState");
		
		if (loginBId != null) {
			if (checKakao.equals("KA")) {
				loginBId = (String) session.getAttribute("loginName");
			}
			re.setRemid(loginBId);
			
		} else if (loginSId != null) {
			System.out.println(loginSId);
			if (checKakao != null) {
				loginSId = (String) session.getAttribute("loginName");
			}
			re.setRemid(loginSId);
		}
		int result = rsvc.InsertReply(re);

		mav.setViewName("redirect:/boardDetailmove?bno=" + re.getRebno());
		return mav;
	}

	@RequestMapping(value = "/replyDelete")
	public ModelAndView replyInsert(String renum, String bno, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();

		System.out.println("renum : " + renum);
		System.out.println("bno : " + bno);

		int result = rsvc.deleteReply(renum);
		if (result > 0) {
			ra.addFlashAttribute("msg", "댓글을 삭제했습니다");
		} else {
			ra.addFlashAttribute("msg", "알수없는 이유로 삭제하지 못했습니다");
		}
		mav.setViewName("redirect:/boardDetailmove?bno=" + bno);
		return mav;
	}

}
