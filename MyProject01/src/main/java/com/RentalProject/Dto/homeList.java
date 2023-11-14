package com.RentalProject.Dto;

import lombok.Data;

public class homeList {
private String carimg;
private String mprofile;
private String message;
private String mid;
public String getCarimg() {
	return carimg;
}
public void setCarimg(String carimg) {
	this.carimg = carimg;
}
public String getMprofile() {
	return mprofile;
}
public void setMprofile(String mprofile) {
	this.mprofile = mprofile;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getMid() {
	return mid;
}
public void setMid(String mid) {
	this.mid = mid;
}



}
