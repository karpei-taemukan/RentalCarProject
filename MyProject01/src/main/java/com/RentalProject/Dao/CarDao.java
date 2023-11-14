package com.RentalProject.Dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.RentalProject.Dto.Car;
import com.RentalProject.Dto.CarDetail;
import com.RentalProject.Dto.Member_buyer;
import com.RentalProject.Dto.schedule;

public interface CarDao {

	int insertCarInfo(Car car);

	String selectMaxCcode();

	ArrayList<Car> selectCarList();

	Car selectCarDetail(String ccode);

	int insertCarDetailInfo(@Param("ccode") String ccode,@Param("cdage") String cdage,@Param("cdcareer") String cdcareer,@Param("cdlicense") String cdlicense,@Param("cdblackbox") String cdblackbox,@Param("cdrearcam") String cdrearcam, @Param("cdnavigation")
			String cdnavigation,@Param("cdbluetooth") String cdbluetooth,@Param("cdnosmoke") String cdnosmoke,@Param("cdhotseat") String cdhotseat,@Param("cdcartype") String cdcartype);

	int insertCarSchedule(@Param("ccode") String ccode, @Param("scdate") String scdate, @Param("dayPrice") String dayprice);

	CarDetail selectDetailCar(String ccode);

	List<schedule> selectCarSchedule(String ccode);

	List<schedule> selectCarScheduleDate(String calccode);

	List<Car> selectCarInfo_ajax(String calccode);

	List<schedule> selectCarDetailInfo_ajax(String calccode);

	Member_buyer getEmailInfo(String loginInfo);

	String getMaxRecode();

	int insertReserveCarInfo(@Param("recode") String recode,@Param("loginBuyerId") String loginBuyerId,@Param("ccode") String ccode,@Param("reserveDate") String reserveDate);

	ArrayList<String> getreserveCheckList();
	
	ArrayList<Car> selectCarList_filter_ABC(CarDetail cd);

	ArrayList<Car> selectCarList_filter_AB(CarDetail cd);

	ArrayList<Car> selectCarList_filter_AC(CarDetail cd);

	ArrayList<Car> selectCarList_filter_A(String scdate);

	ArrayList<Car> selectCarList_filter_BC(CarDetail cd);

	ArrayList<Car> selectCarList_filter_B(String ctype);

	ArrayList<Car> selectCarList_filter_C(CarDetail cd);

	String getCarImg(String ccode);






}
