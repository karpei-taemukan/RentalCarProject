package com.RentalProject.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.RentalProject.Dto.Reserve;
import com.RentalProject.Dto.schedule;


public interface ReserveDao {
	List<schedule> selectCarSchedule(@Param("ccode") String ccode);

	List<schedule> selectCarScheduleDate(@Param("calccode") String calccode);

	String getMaxRecode();

	Reserve insertReserveCarInfo(@Param("recode") String recode,@Param("loginBuyerId") String loginBuyerId,@Param("ccode") String ccode,@Param("string") String string);
}
