package com.RentalProject.Dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

public class Member_buyer {
	private String mbid;
	private String mbpw;
	private String mbname;
	private String mbemail;
	private String mbprofile;	
	private String mbstate;
	
	private MultipartFile mbfile;

	public String getMbid() {
		return mbid;
	}

	public void setMbid(String mbid) {
		this.mbid = mbid;
	}

	public String getMbpw() {
		return mbpw;
	}

	public void setMbpw(String mbpw) {
		this.mbpw = mbpw;
	}

	public String getMbname() {
		return mbname;
	}

	public void setMbname(String mbname) {
		this.mbname = mbname;
	}

	public String getMbemail() {
		return mbemail;
	}

	public void setMbemail(String mbemail) {
		this.mbemail = mbemail;
	}

	public String getMbprofile() {
		return mbprofile;
	}

	public void setMbprofile(String mbprofile) {
		this.mbprofile = mbprofile;
	}

	public String getMbstate() {
		return mbstate;
	}

	public void setMbstate(String mbstate) {
		this.mbstate = mbstate;
	}

	public MultipartFile getMbfile() {
		return mbfile;
	}

	public void setMbfile(MultipartFile mbfile) {
		this.mbfile = mbfile;
	}
	
	
}
