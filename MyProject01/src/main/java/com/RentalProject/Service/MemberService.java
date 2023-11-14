package com.RentalProject.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.RentalProject.Dao.MemberDao;
import com.RentalProject.Dto.Member_buyer;
import com.RentalProject.Dto.Member_seller;
import com.RentalProject.Dto.Reserve;
import com.RentalProject.Dto.myInfoSchdue;

@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;

	public int registbuyer(Member_buyer member, RedirectAttributes ra, HttpSession session)
			throws IllegalStateException, IOException {
		System.out.println("회원가입 - /memberJoin");
		MultipartFile mbfile = member.getMbfile(); // 첨부파일
		String mbprofile = ""; // 파일명 저장할 변수
		String savePath = session.getServletContext().getRealPath("/resources/users/mbProfile");
		if (!mbfile.isEmpty()) { // 첨부파일 확인
			// 첨부파일이 있는 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			String code = uuid.toString();
			mbprofile = code + "_" + mbfile.getOriginalFilename();
			// 저장할 경로 /resources/users/memberProfile 폴더에 파일 저장
			System.out.println("savePath : " + savePath);
			File newFile = new File(savePath, mbprofile);
			mbfile.transferTo(newFile);
		}
		System.out.println("파일 이름 : " + mbprofile);
		member.setMbprofile(mbprofile);
		System.out.println(member);
		return mdao.insertMember_buyer(member);
	}

	public Member_seller selectSellerDetailInfo(String loginId) {

		return mdao.selectSellerDetailInfo(loginId);
	}

	public Member_buyer selectBuyerDetailInfo(String loginId) {
		return mdao.selectBuyerDetailInfo(loginId);
	}

	public Member_buyer getLoginMemberInfo(String inputid, String inputpw) {
		System.out.println("SERVICE - getLoginMemberInfo() 호출");

		return mdao.selectMemberInfo(inputid, inputpw);
	}

	public Member_seller getLoginSellerMemberInfo(String inputid, String inputpw) {
		System.out.println("SERVICE - getLoginSellerMemberInfo() 호출");
		System.out.println(inputid + " " + inputpw);
		return mdao.selectSellerMemberInfo(inputid, inputpw);

	}

	public String checkID(String checkURL) {

		String result = "N";

		String check_buyer = mdao.checkID_buyer(checkURL);
		String check_seller = mdao.checkID_seller(checkURL);

		if (check_buyer == null & check_seller == null) {
			result = "Y";
		}

		return result;
	}

	public int registseller(Member_seller member_sell, RedirectAttributes ra, HttpSession session)
			throws IllegalStateException, IOException {
		System.out.println("회원가입 - /memberJoin");
		MultipartFile mbfile = member_sell.getMsfile(); // 첨부파일
		String msprofile = ""; // 파일명 저장할 변수
		String savePath = session.getServletContext().getRealPath("/resources/users/msProfile");
		if (!mbfile.isEmpty()) { // 첨부파일 확인
			// 첨부파일이 있는 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			String code = uuid.toString();
			msprofile = code + "_" + mbfile.getOriginalFilename();
			// 저장할 경로 /resources/users/memberProfile 폴더에 파일 저장
			System.out.println("savePath : " + savePath);
			File newFile = new File(savePath, msprofile);
			mbfile.transferTo(newFile);
		}
		System.out.println("파일 이름 : " + msprofile);
		member_sell.setMsprofile(msprofile);
		System.out.println(member_sell);
		return mdao.insertMember_seller(member_sell);
	}

	public Member_buyer getLoginMemberInfo_kakao_Buyer(String id) {
		System.out.println("Service - getLoginMemberInfo_kakao_Buyer");
		return mdao.getLoginMemberInfo_kakao_Buyer(id);
	}

	public Member_seller getLoginMemberInfo_kakao_Seller(String id) {
		System.out.println("Service - getLoginMemberInfo_kakao_Seller");
		return mdao.getLoginMemberInfo_kakao_Seller(id);
	}

	public int joinMemberKakao_Buyer(String mid, String mname, String memail, String mprofile) {

		return mdao.joinMemberKakao_Buyer(mid, mname, memail, mprofile);
	}

	public int joinMemberKakao_Seller(String mid, String mname, String memail, String mprofile) {

		return mdao.joinMemberKakao_Seller(mid, mname, memail, mprofile);
	}

	public ArrayList<String> selectCcode(String reserveMember) {
		return mdao.selectCcode(reserveMember);
	}

	public ArrayList<Reserve> selectBuyerInfo(String reserveMember) {
		return mdao.selectReserveInfo(reserveMember);
	}

	public int deleteMemberReserve(String ccode) {
		return mdao.deleteMemberReserve(ccode);
	}

	public ArrayList<Reserve> reSelectReserve(String ccode) {
		return mdao.reSelectReserve(ccode);
	}

	public ArrayList<String> selectCCode() {
		
		return mdao.selectCCode();
	}

	public ArrayList<myInfoSchdue> getReserveCcode(String reserveCCode) {
		
		return mdao.getReserveCcode(reserveCCode);
	}

	public String getReserveCarImg(String reserveCCode) {
		return mdao.getReserveCarImg(reserveCCode);
	}
	
	// 추가함 23-11-06
	public ArrayList<Reserve> getReserveList() {

		return mdao.getReserveList();
	}

	public String getMidProfile(String mid) {
		// TODO Auto-generated method stub
		return mdao.getMidProfile(mid);
	}
}
