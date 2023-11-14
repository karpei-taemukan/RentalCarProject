package com.RentalProject.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.RentalProject.Dao.CarDao;
import com.RentalProject.Dto.Car;
import com.RentalProject.Dto.CarDetail;
import com.RentalProject.Dto.Member_buyer;
import com.RentalProject.Dto.schedule;

@Service
public class CarService {

	@Autowired
	private CarDao cdao;

	public int carInfoUpdate(Car car, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("차량정보 등록 - /carInfoUpdate");
		MultipartFile cfile = car.getCfile(); // 첨부파일
		String carimg = ""; // 파일명 저장할 변수
		String savePath = session.getServletContext().getRealPath("/resources/users/Carimage");

		if (!cfile.isEmpty()) { // 첨부파일 확인
			// 첨부파일이 있는 경우
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			String code = uuid.toString();
			carimg = code + "_" + cfile.getOriginalFilename();
			// 저장할 경로 /resources/users/memberProfile 폴더에 파일 저장
			System.out.println("savePath : " + savePath);
			File newFile = new File(savePath, carimg);
			cfile.transferTo(newFile);
		}

		car.setCarimg(carimg);

		int insertResult = 0;
		System.out.println("car 확인 : " + car);
		try {
			insertResult = cdao.insertCarInfo(car);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertResult;
	}

	public String gencode(String maxCcode) {
		System.out.println("gencode 호출");

		String strCode = maxCcode.substring(0, 1);

		int numCode = Integer.parseInt(maxCcode.substring(1));

		String newCode = strCode + String.format("%06d", numCode + 1);
		System.out.println("new code : " + newCode);
		return newCode;
	}

	public ArrayList<Car> getRegistCarList() {
		System.out.println("SERVICE - getRegistCarList() 호출");

		ArrayList<Car> carList = cdao.selectCarList();

		return carList;
	}

	public Car getRegistDetail(String ccode) {
		System.out.println("SERVICE-getRegistDetailList");

		Car carDetailList = cdao.selectCarDetail(ccode);

		return carDetailList;
	}

	public int carDetailInfo(CarDetail cd, String ccode) {
		String cdage = cd.getCdage();
		String cdcareer = cd.getCdcareer();
		String cdlicense = cd.getCdlicense();
		String cdblackbox = cd.getCdblackbox();
		String cdrearcam = cd.getCdrearcam();
		String cdnavigation = cd.getCdnavigation();
		String cdbluetooth = cd.getCdbluetooth();
		String cdnosmoke = cd.getCdnosmoke();
		String cdcoldseat = cd.getCdcoldseat();
		String cdcartype = cd.getCdcartype();
		System.out.println("cd확인 : " + cd);
		int insertResult = cdao.insertCarDetailInfo(ccode, cdage, cdcareer, cdlicense, cdblackbox, cdrearcam,
				cdnavigation, cdbluetooth, cdnosmoke, cdcoldseat, cdcartype);
		return insertResult;
	}

	public int carReserve(String ccode, String scdate, String dayPrice) {

		int insertschedule = cdao.insertCarSchedule(ccode, scdate, dayPrice);
		return 0;
	}

	public CarDetail getCarDetail(String ccode) {

		CarDetail carDetailList = cdao.selectDetailCar(ccode);
		return carDetailList;
	}

	public List<schedule> getCarSchedule(String ccode) {
		List<schedule> carSchedule = cdao.selectCarSchedule(ccode);

		return carSchedule;
	}

	public List<schedule> getCarScheduleDate(String calccode) {
		System.out.println("SERIVE- getCarScheduleDate()호출");
		System.out.println("ccode: " + calccode);

		List<schedule> carSchedule = cdao.selectCarScheduleDate(calccode);

		return carSchedule;

	}

	public List<Car> getCarInfo_ajax(String calccode) {
		List<Car> carInfo = cdao.selectCarInfo_ajax(calccode);
		return carInfo;
	}

	public List<schedule> getCarSchedule_ajax(String calccode) {
		List<schedule> carinfo = cdao.selectCarDetailInfo_ajax(calccode);
		return carinfo;
	}

	public Member_buyer getEmailInfo(String loginInfo) {
		return cdao.getEmailInfo(loginInfo);
	}

	public int reserveCar(String loginBuyerId, String ccode, String reserveDate) {

		String getRecode = cdao.getMaxRecode();
		String recode = genRecode(getRecode);

		System.out.println("service-date: " + reserveDate);

		int reserveCar = cdao.insertReserveCarInfo(recode, loginBuyerId, ccode, reserveDate);

		return reserveCar;

	}

	public String genRecode(String maxReode) {
		System.out.println("gencode 호출");
		// re00000
		String strCode = maxReode.substring(0, 2);// re
		System.out.println("strCode: " + strCode);
		int numCode = Integer.parseInt(maxReode.substring(2));

		String newCode = strCode + String.format("%05d", numCode + 1);
		System.out.println("newCode: " + newCode);
		return newCode;
	}

	public ArrayList<String> getreserveCheckList() {
		
		return cdao.getreserveCheckList();
	}
	
	/* 기존의 carList*/	
	public ArrayList<Car> selectCarList(Car car, String realDate, CarDetail cd, boolean allNone) {
		// TODO Auto-generated method stub
		cd.setCdcartype(car.getCtype());
		String[] cut = realDate.split(",");//"2023-11-02","2023-11-03"
		ArrayList<Car> selectList = new ArrayList<Car>();
		
		for(int i=0; i<cut.length; i++) {
			cd.setCdage(cut[i]);
			ArrayList<Car> carList = cdao.selectCarList_filter_ABC(cd); // detail 선택안함
			selectList.addAll(carList);
		}
		
		return selectList;
	}
	
	// 23-11-06 추가
	public String getCarImg(String ccode) {

		return cdao.getCarImg(ccode);
	}

	public ArrayList<Car> getRegistCarList_ABC(String realDate, Car car, CarDetail cd) {
		// TODO Auto-generated method stub
		System.out.println("getRegistCarList_ABC");
		cd.setCdcartype(car.getCtype());
		String[] cut = realDate.split(",");//"2023-11-02","2023-11-03"
		ArrayList<Car> selectList = new ArrayList<Car>();
		
		for(int i=0; i<cut.length; i++) {
			cd.setCdage(cut[i]);
			ArrayList<Car> carList = cdao.selectCarList_filter_ABC(cd); // detail 
			selectList.addAll(carList);
		}
		
		return selectList;
	}

	public ArrayList<Car> getRegistCarList_AB(String realDate, Car car, CarDetail cd, boolean allNone) {
		// TODO Auto-generated method stub
		System.out.println("getRegistCarList_AB");
		cd.setCdcartype(car.getCtype());
		String[] cut = realDate.split(",");//"2023-11-02","2023-11-03"
		ArrayList<Car> selectList = new ArrayList<Car>();
		
		for(int i=0; i<cut.length; i++) {
			cd.setCdage(cut[i]);
			if(allNone) {
				ArrayList<Car> carList = cdao.selectCarList_filter_AB(cd); // detail 
				selectList.addAll(carList);				
			}
		}
		
		return selectList;
	}

	public ArrayList<Car> getRegistCarList_AC(String realDate, CarDetail cd) {
		// TODO Auto-generated method stub
		String[] cut = realDate.split(",");//"2023-11-02","2023-11-03"
		ArrayList<Car> selectList = new ArrayList<Car>();
		
		for(int i=0; i<cut.length; i++) {
			cd.setCdage(cut[i]);
			ArrayList<Car> carList = cdao.selectCarList_filter_AC(cd); // detail 
			selectList.addAll(carList);			
		}
		
		return selectList;
	}

	public ArrayList<Car> getRegistCarList_A(String realDate) {
		System.out.println("getRegistCarList_A");
		// TODO Auto-generated method stub
		String[] cut = realDate.split(",");//"2023-11-02","2023-11-03"
		ArrayList<Car> selectList = new ArrayList<Car>();
		
		for(int i=0; i<cut.length; i++) {
			System.out.println("cut[i] : " + cut[i]);
			ArrayList<Car> carList = cdao.selectCarList_filter_A(cut[i]); // detail 
			selectList.addAll(carList);			
		}
		
		return selectList;
	}

	public ArrayList<Car> getRegistCarList_BC(Car car, CarDetail cd) {
		// TODO Auto-generated method stub
		System.out.println("getRegistCarList_BC 실행중");
		cd.setCdcartype(car.getCtype());
		ArrayList<Car> selectList = cdao.selectCarList_filter_BC(cd);
		return selectList;
	}

	public ArrayList<Car> getRegistCarList_B(Car car) {
		// TODO Auto-generated method stub
		String ctype = car.getCtype();
		System.out.println("ctype : " + ctype);
		ArrayList<Car> selectList = cdao.selectCarList_filter_B(ctype);
		return selectList;
	}

	public ArrayList<Car> getRegistCarList_C(CarDetail cd) {
		// TODO Auto-generated method stub
		ArrayList<Car> selectList = cdao.selectCarList_filter_C(cd);
		return selectList;
	}

}
