package com.RentalProject.Dto;

import lombok.Data;

@Data
public class Reserve {
private String recode;
private String mbid;
private String ccode;
private String scdate;
private String cstate;
public String getRecode() {
	return recode;
}
public void setRecode(String recode) {
	this.recode = recode;
}
public String getMbid() {
	return mbid;
}
public void setMbid(String mbid) {
	this.mbid = mbid;
}
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
public String getCstate() {
	return cstate;
}
public void setCstate(String cstate) {
	this.cstate = cstate;
}



}

