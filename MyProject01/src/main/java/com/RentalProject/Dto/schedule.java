package com.RentalProject.Dto;

import lombok.Data;

@Data
public class schedule {
private String ccode;
private String scdate;
private String dayPrice;
public String getCcode() {
	return ccode;
}
public void setCcode(String ccode) {
	this.ccode = ccode;
}
public String getScdate() {
	return scdate;
}
public void setScdate(String scdate) {
	this.scdate = scdate;
}
public String getDayPrice() {
	return dayPrice;
}
public void setDayPrice(String dayPrice) {
	this.dayPrice = dayPrice;
}


}
