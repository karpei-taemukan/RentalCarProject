package com.RentalProject.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.RentalProject.Dto.Member_buyer;
import com.RentalProject.Dto.Member_seller;
import com.RentalProject.Dto.Reserve;
import com.RentalProject.Dto.myInfoSchdue;

public interface MemberDao {

	int insertMember_buyer(Member_buyer member);

	Member_buyer selectMemberInfo(@Param("inputid") String inputid, @Param("inputpw") String inputpw);

	Member_buyer selectBuyerDetailInfo(String loginId);

	Member_seller selectSellerDetailInfo(String loginId);

	Member_seller selectSellerMemberInfo(@Param("inputid") String inputid,@Param("inputpw") String inputpw);

	String checkID_buyer(String checkURL);
	
	String checkID_seller(String checkURL);

	int insertMember_seller(Member_seller member_sell);

	Member_buyer getLoginMemberInfo_kakao_Buyer(String id);

	Member_seller getLoginMemberInfo_kakao_Seller(String id);

	int joinMemberKakao_Buyer(@Param("mid") String mid, @Param("mname") String mname, @Param("memail") String memail, @Param("mprofile") String mprofile);

	int joinMemberKakao_Seller(@Param("mid") String mid, @Param("mname") String mname, @Param("memail") String memail, @Param("mprofile") String mprofile);

	ArrayList<String> selectCcode(String reserveMember);

	ArrayList<Reserve> selectReserveInfo(String reserveMember);

	int deleteMemberReserve(String ccode);

	ArrayList<Reserve> reSelectReserve(String ccode);

	ArrayList<String> selectCCode();

	ArrayList<myInfoSchdue> getReserveCcode(String reserveCCode);

	String getReserveCarImg(String reserveCCode);
	
	// 추가함 23-11-06
	ArrayList<Reserve> getReserveList();

	String getMidProfile(String mid);
	
	
	
	
	
}
