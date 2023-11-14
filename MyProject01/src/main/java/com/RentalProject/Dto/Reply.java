package com.RentalProject.Dto;

import lombok.Data;

@Data
public class Reply {
	private int renum;
	private int rebno;
	private String remid;
	private String recomment;
	private String redate;
	private String restate;
	public int getRenum() {
		return renum;
	}
	public void setRenum(int renum) {
		this.renum = renum;
	}
	public int getRebno() {
		return rebno;
	}
	public void setRebno(int rebno) {
		this.rebno = rebno;
	}
	public String getRemid() {
		return remid;
	}
	public void setRemid(String remid) {
		this.remid = remid;
	}
	public String getRecomment() {
		return recomment;
	}
	public void setRecomment(String recomment) {
		this.recomment = recomment;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public String getRestate() {
		return restate;
	}
	public void setRestate(String restate) {
		this.restate = restate;
	}
	
	
	
}
