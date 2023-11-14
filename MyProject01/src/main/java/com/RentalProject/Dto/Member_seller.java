package com.RentalProject.Dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

public class Member_seller {
	private String msid;
	private String mspw;
	private String msname;
	private String msemail;
	private String msprofile;
	private String msstate;
	
	private MultipartFile msfile;

	public String getMsid() {
		return msid;
	}

	public void setMsid(String msid) {
		this.msid = msid;
	}

	public String getMspw() {
		return mspw;
	}

	public void setMspw(String mspw) {
		this.mspw = mspw;
	}

	public String getMsname() {
		return msname;
	}

	public void setMsname(String msname) {
		this.msname = msname;
	}

	public String getMsemail() {
		return msemail;
	}

	public void setMsemail(String msemail) {
		this.msemail = msemail;
	}

	public String getMsprofile() {
		return msprofile;
	}

	public void setMsprofile(String msprofile) {
		this.msprofile = msprofile;
	}

	public String getMsstate() {
		return msstate;
	}

	public void setMsstate(String msstate) {
		this.msstate = msstate;
	}

	public MultipartFile getMsfile() {
		return msfile;
	}

	public void setMsfile(MultipartFile msfile) {
		this.msfile = msfile;
	}
	
	
}
