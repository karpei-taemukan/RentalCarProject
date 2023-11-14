package com.RentalProject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.RentalProject.Dao.CarDao;
import com.RentalProject.Dto.Car;
import com.RentalProject.Dto.CarDetail;
import com.RentalProject.Dto.Member_buyer;
import com.RentalProject.Dto.schedule;
import com.RentalProject.Service.CarService;
import com.google.gson.Gson;

@Controller
public class CarController {

	@Autowired
	private CarService csvc;

	@Autowired
	private CarDao cdao;
	
	private String calccode;

	@RequestMapping(value = "/registCar")
	public ModelAndView registCar() {
		ModelAndView mav = new ModelAndView();
		System.out.println("차량등록 이동");
		mav.setViewName("car/registCar");
		return mav;
	}

	@RequestMapping(value = "/carUpdate")
	public ModelAndView carUpdate(Car car, CarDetail cd, String scdate, String dayPrice, RedirectAttributes ra,
			HttpSession session) throws IllegalStateException, IOException {
		System.out.println("차량정보 등록 - /carUpdate");
		ModelAndView mav = new ModelAndView();

		String maxCcode = cdao.selectMaxCcode();

		String ccode = csvc.gencode(maxCcode);
		
		car.setCamount(dayPrice);
		car.setCcode(ccode);
		cd.setCcode(ccode);
		
		String loginSid = (String) session.getAttribute("loginSId");
		System.out.println("SID: " + loginSid);
		
		try {
		int carInfoUd = csvc.carInfoUpdate(car, session);

		if (cd.getCdblackbox() == null) {
			cd.setCdblackbox("NONE");
		}
		if (cd.getCdrearcam() == null) {
			cd.setCdrearcam("NONE");
		}
		if (cd.getCdnavigation() == null) {
			cd.setCdnavigation("NONE");
		}
		if (cd.getCdbluetooth() == null) {
			cd.setCdbluetooth("NONE");
		}
		if (cd.getCdnosmoke() == null) {
			cd.setCdnosmoke("NONE");
		}
		if (cd.getCdcoldseat() == null) {
			cd.setCdcoldseat("NONE");
		}

		int carDetailInfoUd = csvc.carDetailInfo(cd, ccode);
		System.out.println("scdate: " + scdate);
		System.out.println("scdate: " + scdate.split(",")[0]);
		String[] cut = scdate.split(",");

		System.out.println(cut.length);

		for (int i = 0; i < cut.length; i++) {
			System.out.println("ccode: " + ccode);
			System.out.println("scdate: " + cut[i]);
			System.out.println("dayPrice: " + dayPrice);
			int carReserve = csvc.carReserve(ccode, cut[i], dayPrice);
		}

		System.out.println("dayPrice: " + dayPrice);

		if (carInfoUd > 0) {
			System.out.println("차량등록 성공");
			mav.setViewName("redirect:/");
			ra.addFlashAttribute("msg", "차량등록 성공");
		} else {
			System.out.println("차량등록 실패");
			mav.setViewName("redirect:/registCar");
			ra.addFlashAttribute("msg", "차량등록 실패");
		}

		if (carDetailInfoUd > 0) {
			System.out.println("차량상세정보등록 성공");
			mav.setViewName("redirect:/");
			ra.addFlashAttribute("msg", "차량상세정보등록 성공");
		} else {
			System.out.println("차량상세정보등록 실패");
			mav.setViewName("redirect:/registCar");
			ra.addFlashAttribute("msg", "차량상세정보등록 실패");
		}
		}
		catch(Exception e) {
			ra.addFlashAttribute("msg", "차량상세정보가 없습니다");
			mav.setViewName("redirect:/registCar");
		}
		return mav;
	}
	 String[] a = {};
	
	@RequestMapping(value = "/carRentListMove")
	public ModelAndView carRentListMove(Car car, CarDetail cd, String realDate) {
		ModelAndView mav = new ModelAndView();
		System.out.println("차량 예약 페이지 이동");
		
		
		System.out.println("Car: "+car.toString());
		System.out.println("CD: "+cd.toString());
		System.out.println("realDate: "+ realDate);
		// 대여기간 : realDate
		// 차종: car. ctype
		// 옵션: cd 안 6개 
		
		int randomCheck = 0;
		int noneCheck = 0;
		
		if(cd.getCdblackbox() != null ) {
			randomCheck++;
		} else {
			cd.setCdblackbox("NONE");
			noneCheck++;
		}
		if(cd.getCdrearcam() != null ) {	
			randomCheck++;
		} else {
			cd.setCdrearcam("NONE");
			noneCheck++;
		}
		if(cd.getCdnavigation() != null ) {
			randomCheck++;
		} else {
			cd.setCdnavigation("NONE");
			noneCheck++;
		}
		if(cd.getCdbluetooth() != null ) {
			randomCheck++;
		} else {
			cd.setCdbluetooth("NONE");
			noneCheck++;
		}
		if(cd.getCdcoldseat() != null ) {	
			randomCheck++;
		} else {
			cd.setCdcoldseat("NONE");
			noneCheck++;
		}
		if(cd.getCdnosmoke() != null ) {
			randomCheck++;
		} else {
			cd.setCdnosmoke("NONE");
			noneCheck++;
		}
		// -------------------------------------------
		boolean allNone = false;

		
		if( noneCheck == 6) {
			allNone = true;
		}
		
		
		/*  */
		ArrayList<Car> carInfo;
		if(!realDate.equals("")) {
			
			if(!car.getCtype().equals("NONE")) {
				if(randomCheck > 0) {
					// 대여기간, 차종, 옵션
					carInfo = csvc.getRegistCarList_ABC(realDate, car, cd);
					
				} else {
					// 대여기간, 차종
					carInfo = csvc.getRegistCarList_AB(realDate, car, cd, allNone);
				}
				
			} else {
				
				if(randomCheck > 0) {
					//대여기간, 옵션
					carInfo = csvc.getRegistCarList_AC(realDate, cd);
				} else {
					//대여기간
					carInfo = csvc.getRegistCarList_A(realDate);
				}
			}
			
		} else {
			
			if(!car.getCtype().equals("NONE")) {
				
				if(randomCheck > 0) {
					// 차종, 옵션
					carInfo = csvc.getRegistCarList_BC(car, cd);
					
				} else {
					// 차종
					carInfo = csvc.getRegistCarList_B(car);
					
				}
				
				
			} else {
				
				
				if(randomCheck > 0) {
					// 옵션
				carInfo = csvc.getRegistCarList_C(cd);
					
				} else {
					//
					carInfo = csvc.getRegistCarList();
					
				}
				
			}
			
		}
		
		ArrayList<Car> temp = new ArrayList<Car>();
		
		ArrayList<String> ccodeList = new ArrayList<String>();
		for( int i = 0; i < carInfo.size(); i++  ) {
			String ccode = carInfo.get(i).getCcode();
			boolean check = ccodeList.contains( ccode  );
			if(!check) {
				ccodeList.add(ccode);
			}
		}
		
		for(String loopCode : ccodeList) { // c01, c02
			
			for(int i = 0; i < carInfo.size(); i++ ) {
				if(carInfo.get(i).getCcode().equals(loopCode)  ) {
					temp.add(carInfo.get(i));
				}
			}
		}
		
		mav.addObject("carList", temp);
		ArrayList<String> reserveCheckList = csvc.getreserveCheckList();

		mav.addObject("reserveCheckList", reserveCheckList);
		
		for(int i=0; i<a.length; i++) {
			a = realDate.split(",");
			mav.addObject("date", a[i]);			
		}
		
		// String[] a = {};
	
	
	
		
		
		mav.setViewName("car/registCarList");
		return mav;
	}
	@RequestMapping(value = "/carRentListMove_All")
	public ModelAndView carRentListMove_All() {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Car> carInfo = csvc.getRegistCarList();
		ArrayList<String> reserveCheckList = csvc.getreserveCheckList();
		
		mav.addObject("carList", carInfo);

		// 11-08추가함
		mav.addObject("reserveCheckList", reserveCheckList);
		
		mav.setViewName("car/registCarList");
		return mav;
	}

	@RequestMapping(value = "/registCarDetail")
	public ModelAndView registCarDetail(CarDetail cd , HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("예약 차량 정보 조회이동");
		String ccode = cd.getCcode();
		Car carInfo = csvc.getRegistDetail(ccode);

		calccode = ccode;
		CarDetail carDetail = csvc.getCarDetail(ccode);

		List<schedule> carSchedule = csvc.getCarSchedule(ccode);

		mav.addObject("carinfo", carInfo);
		mav.addObject("caroption", carDetail);
		mav.addObject("carCalendarInfo", carSchedule);
		
		UUID uuid = UUID.randomUUID();
		String code = uuid.toString();
		
		session.setAttribute("randomCode", uuid);
		mav.setViewName("car/CarListDetail");
		return mav;
	}
	
	@RequestMapping(value="/calendar_scdate")
	public @ResponseBody List<schedule> calendar_scdate() {
		System.out.println("ajax 요청");

		System.out.println("ccode: "+calccode);
		List<schedule> carSchedule = csvc.getCarScheduleDate(calccode); 
		
		return carSchedule;
	}
	
	// 추가
	@RequestMapping(value="/carReserve_info")
	public @ResponseBody String carReserve_info() {
		System.out.println("ajax 요청");

		List<Car> carSchedule = csvc.getCarInfo_ajax(calccode); 
		
		return new Gson().toJson(carSchedule);
	}
	
	
	@RequestMapping(value="/carReserve_detail_info")
	public @ResponseBody String carReserve_detail_info() {
		System.out.println("ajax 요청");

		List<schedule> carSchedule = csvc.getCarSchedule_ajax(calccode); 
		
		//System.out.println("carSchedule: "+carSchedule);
		return new Gson().toJson(carSchedule);
	}
	
	@RequestMapping(value="/getLogin_Info")
	public @ResponseBody String getLogin_Info(HttpSession session) {
		System.out.println("ajax 요청");
		
		String loginInfo = (String) session.getAttribute("loginBId");
	
		System.out.println("loginInfo: "+ loginInfo);
		return loginInfo;
	}
	
	@RequestMapping(value="/getEmail_Info")
	public @ResponseBody String getEmail_Info(HttpSession session) {
		System.out.println("ajax 요청");
		
		String loginInfo = (String) session.getAttribute("loginBId");
	
		Member_buyer mb = csvc.getEmailInfo(loginInfo);
		String mbemail = mb.getMbemail();
		return mbemail;
	}
	
	
	@RequestMapping(value="/insert_Reserve_Info")
	public @ResponseBody String reserveInfo(@RequestParam(value="loginBuyerId") String loginBuyerId,@RequestParam(value="ccode") String ccode, @RequestParam(value="reserveDate") String[] reserveDate) {
		
		
		System.out.println("loginBuyerId: "+loginBuyerId);
		System.out.println("ccode: "+ ccode);
		System.out.println("reserveDate: "+reserveDate);
		
		int reserveCar = 0;
		
		
		for(int i=0; i<reserveDate.length; i++) {
//			System.out.println("reserveDate: "+ reserveDate[i]);
//			String replaceDate = reserveDate[i].replaceAll("\"", "");
			String replaceDate = reserveDate[i];
			System.out.println(replaceDate);
			reserveCar = csvc.reserveCar(loginBuyerId,ccode,replaceDate);
		}
		
		
		return reserveCar+"";
	}
	

}
