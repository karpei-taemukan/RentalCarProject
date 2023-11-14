package com.RentalProject.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.RentalProject.Dto.Board;
import com.RentalProject.Dto.Reserve;
import com.RentalProject.Dto.homeList;
import com.RentalProject.Service.BoardService;
import com.RentalProject.Service.CarService;
import com.RentalProject.Service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberService msvc;

	@Autowired
	private CarService csvc;

	@Autowired
	private BoardService bsvc;

	@RequestMapping(value = "/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();

		System.out.println("홈으로 이동");

		ArrayList<Reserve> reserve = msvc.getReserveList();

		ArrayList<homeList> homeList = new ArrayList<homeList>();
		ArrayList<Board> boradList = bsvc.getBoardList();

		
		for (int i = 0; i < reserve.size(); i++) {
			homeList home = new homeList();
			
			System.out.println("RESERVE SIZE: "+ reserve.size());
			
			String mid = reserve.get(i).getMbid();
			ArrayList<String> boardResult = bsvc.getBoardContents(mid);
			if(boardResult.size() != 0) {
				
			home.setMid(mid);

			String midImg = msvc.getMidProfile(mid);
			home.setMprofile(midImg);

			String carimg = csvc.getCarImg(reserve.get(i).getCcode());
			home.setCarimg(carimg);
			
				System.out.println("boardResult: "+boardResult);
			//	System.out.println("확인 : "+boardResult.get(0));
			home.setMessage(boardResult.get(0));

			
			homeList.add(home);
			}
		}

		mav.addObject("homeList", homeList);

		ArrayList<Board> homeBoardList = bsvc.getHomeBoardList();

		for (int i = 0; i < homeBoardList.size(); i++) {
			if (homeBoardList.get(i).getBdate() != null) {

				String date_split = homeBoardList.get(i).getBdate().substring(0, 10);
				homeBoardList.get(i).setBdate(date_split);
			}
		}

		mav.addObject("homeBoardList", homeBoardList);
		mav.setViewName("home");
		return mav;
	}

}
