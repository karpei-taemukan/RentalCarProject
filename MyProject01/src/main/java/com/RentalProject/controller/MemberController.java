package com.RentalProject.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.RentalProject.Dto.Member_buyer;
import com.RentalProject.Dto.Member_seller;
import com.RentalProject.Dto.Reserve;
import com.RentalProject.Dto.myInfoSchdue;
import com.RentalProject.Service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService msvc;

	@RequestMapping(value = "/memberJoinForm")
	public ModelAndView memberJoinForm() {
		System.out.println("회원가입 페이지 이동요청 - /memberJoinForm");
		ModelAndView mav = new ModelAndView();

		mav.setViewName("member/MemberJoin");
		return mav;
	}

	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(String joinEmail_host, String joinEmail_id, String mbname, String mbid, String mbpw,
			MultipartFile mbfile, RedirectAttributes ra, HttpSession session, String type)
			throws IllegalStateException, IOException {
		System.out.println("회원가입 요청 - /memberJoin");
		ModelAndView mav = new ModelAndView();
		String email = joinEmail_id + "@" + joinEmail_host;

		if (type.equals("buyer")) {
			Member_buyer member_buy = new Member_buyer();
			System.out.println("구매자");
			member_buy.setMbemail(email);
			member_buy.setMbfile(mbfile);
			member_buy.setMbid(mbid);
			member_buy.setMbname(mbname);
			member_buy.setMbpw(mbpw);

			int memberJoin = msvc.registbuyer(member_buy, ra, session);
		} else {
			Member_seller member_sell = new Member_seller();
			System.out.println("판매자");

			member_sell.setMsemail(email);
			member_sell.setMsfile(mbfile);
			member_sell.setMsid(mbid);
			member_sell.setMsname(mbname);
			member_sell.setMspw(mbpw);
			int memberJoin = msvc.registseller(member_sell, ra, session);
		}

		mav.setViewName("redirect:/");
		return mav;
	}

	@RequestMapping(value = "/loginForm")
	public ModelAndView memberlogin() {
		System.out.println("로그인페이지 이동 요청 - /loginForm");
		ModelAndView mav = new ModelAndView();

		mav.setViewName("member/LoginForm");
		return mav;
	}

	@RequestMapping(value = "/Buyerlogin")
	public ModelAndView Buyerlogin(String inputid, String inputpw, RedirectAttributes ra, HttpSession session) {
		System.out.println("로그인 요청 - /Buyerlogin");
		ModelAndView mav = new ModelAndView();

		Member_buyer loginbuyer = msvc.getLoginMemberInfo(inputid, inputpw);

		Member_seller loginseller = msvc.getLoginSellerMemberInfo(inputid, inputpw);

		if (loginseller != null) {
			System.out.println("판매자 로그인");
			session.setAttribute("loginSId", loginseller.getMsid());
			session.setAttribute("loginName", loginseller.getMsname());
			session.setAttribute("loginProfile", loginseller.getMsprofile());
			session.setAttribute("loginState", loginseller.getMsstate());
			ra.addFlashAttribute("msg", "로그인 되었습니다.");
			mav.setViewName("redirect:/");
		} else if (loginbuyer != null) {
			// session.setAttribute("loginMember", loginMember);
			System.out.println("구매자 로그인");
			session.setAttribute("loginBId", loginbuyer.getMbid());
			session.setAttribute("loginName", loginbuyer.getMbname());
			session.setAttribute("loginProfile", loginbuyer.getMbprofile());
			session.setAttribute("loginState", loginbuyer.getMbstate());
			ra.addFlashAttribute("msg", "로그인 되었습니다.");
			mav.setViewName("redirect:/");
		} else if (loginseller == null) {
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.setViewName("redirect:/loginForm");
		}

		return mav;
	}

	@RequestMapping(value = "/memberInfo")
	public ModelAndView memberInfo(HttpSession session, String loginInfo) {
		System.out.println("내정보 조회 - /memberInfo");
		ModelAndView mav = new ModelAndView();

		Member_buyer loginbuyer = msvc.selectBuyerDetailInfo(loginInfo);
		Member_seller loginseller = msvc.selectSellerDetailInfo(loginInfo);
		System.out.println(loginbuyer);
		if (loginbuyer != null) {

			String reserveMember = loginbuyer.getMbid();

			ArrayList<String> reserveCcode = msvc.selectCcode(reserveMember);

			ArrayList<Reserve> reserveInfo = msvc.selectBuyerInfo(reserveMember);
			
			ArrayList<myInfoSchdue> myInfoSchdule = new ArrayList<myInfoSchdue>();
			
			ArrayList<String> getReserveCCode = msvc.selectCCode();
			
			for(int i = 0 ; i < getReserveCCode.size(); i++) {
				myInfoSchdue myinfo = new myInfoSchdue();
				String ReserveCCode = getReserveCCode.get(i);
				myinfo.setCcode(ReserveCCode);
				System.out.println("ReserveCCode : " + ReserveCCode);
				
				ArrayList<myInfoSchdue> myInfoReserveDate = msvc.getReserveCcode(ReserveCCode);
				System.out.println(myInfoReserveDate);
				String reserve_date = myInfoReserveDate.get(0).getReservedate().substring(0, 10) + " ~ " + myInfoReserveDate.get(myInfoReserveDate.size()-1).getReservedate().substring(0, 10);
				myinfo.setReservedate(reserve_date);
				System.out.println(reserve_date);
				myinfo.setMbid(myInfoReserveDate.get(0).getMbid());
				System.out.println("myInfoReserveDate : " + myInfoReserveDate);
				
				String myInfoReserveCarImg = msvc.getReserveCarImg(ReserveCCode);
				myinfo.setCarImg(myInfoReserveCarImg);
				System.out.println("myInfoReserveCarImg : " + myInfoReserveCarImg);
				myInfoSchdule.add(myinfo);
			}
			System.out.println("확인");
			System.out.println(myInfoSchdule);
			
			for (int i = 0; i < reserveCcode.size(); i++) {
				System.out.println("reserveCcode: " + reserveCcode.get(i));
				mav.addObject("reserveCcode", reserveCcode.get(i));
			}

				mav.addObject("reserveInfo", myInfoSchdule);
				mav.addObject("loginbuyer", loginbuyer);

		} else if (loginseller != null) {
			System.out.println(loginseller);
			mav.addObject("loginseller", loginseller);
		}

		mav.setViewName("member/MemberInfo");
		return mav;
	}

	@RequestMapping(value = "/memberCheck")
	public @ResponseBody String memberCheck(String checkURL) {
		System.out.println("아이디 중복 확인 - /memberCheck");

		System.out.println("입력한 아이디 : " + checkURL);

		String result = msvc.checkID(checkURL);

		return result;
	}

	@RequestMapping(value = "/memberLogin_kakao")
	public @ResponseBody String memberLogin_kakao(String id, String profile, HttpSession session,
			RedirectAttributes ra) {
		System.out.println("카카오 로그인 요청 - /memberLogin_kakao");
		System.out.println("카카오 id : " + id);

		Member_buyer loginMember_Buyer = msvc.getLoginMemberInfo_kakao_Buyer(id);
		Member_seller loginMember_Seller = msvc.getLoginMemberInfo_kakao_Seller(id);

		if (loginMember_Buyer == null && loginMember_Seller == null) {
			System.out.println("카카오 계정 정보 없음");
			return "N";
		} else if (loginMember_Buyer != null) {
			System.out.println("구매자 로그인");
			System.out.println(loginMember_Buyer);
			session.setAttribute("loginBId", loginMember_Buyer.getMbid());
			session.setAttribute("loginName", loginMember_Buyer.getMbname());
			session.setAttribute("loginProfile", loginMember_Buyer.getMbprofile());
			session.setAttribute("loginState", loginMember_Buyer.getMbstate());
			ra.addFlashAttribute("msg", "로그인 되었습니다.");
			return "Y";
		} else if (loginMember_Seller != null) {
			System.out.println("판매자 로그인");
			System.out.println(loginMember_Seller);
			session.setAttribute("loginSId", loginMember_Seller.getMsid());
			session.setAttribute("loginName", loginMember_Seller.getMsname());
			session.setAttribute("loginProfile", loginMember_Seller.getMsprofile());
			session.setAttribute("loginState", loginMember_Seller.getMsstate());
			ra.addFlashAttribute("msg", "로그인 되었습니다.");
			return "Y";
		} else {
			System.out.println("카카오 계정 정보 있음");
			System.out.println("로그인 처리");
			return "Y";
		}
	}

	@RequestMapping(value = "/memberJoin_kakao")
	public @ResponseBody int memberJoin_kakao(String mid, String mname, String memail, String mprofile, String mstate) {
		System.out.println("카카오 회원가입 요청 - /memberJoin_kakao");
		int result = 0;
		if (mstate.equals("Buyer")) {
			result = msvc.joinMemberKakao_Buyer(mid, mname, memail, mprofile);
		} else if (mstate.equals("Seller")) {
			result = msvc.joinMemberKakao_Seller(mid, mname, memail, mprofile);
		}

		return result;

	}

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		System.out.println("로그아웃 요청 - /logout");
		ModelAndView mav = new ModelAndView();
		session.invalidate();

		mav.setViewName("redirect:/");
		return mav;
	}

	@RequestMapping(value = "/delete_reserve")
	public ModelAndView delete_reserve(HttpSession session, String ccode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("Delete_Reserve: " + ccode);
		String loginid = (String) session.getAttribute("loginBId");
		// update
		int delete_reserve = msvc.deleteMemberReserve(ccode);

		if (delete_reserve > 0) {
			ArrayList<Reserve> re_select_reserveInfo = msvc.reSelectReserve(ccode);
			mav.addObject("reserveInfo", re_select_reserveInfo);
			mav.setViewName("redirect:/memberInfo?loginInfo=" + loginid);
		}

		// update 된 정보 select

		return mav;
	}

}
