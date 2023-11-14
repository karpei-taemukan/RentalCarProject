package com.RentalProject.Dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

public class Car {
	private String cname;
	private String cyear;
	private String camount;
	private String ctype;
	private String ccode;
	private String carimg;
	
	private MultipartFile cfile;

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCyear() {
		return cyear;
	}

	public void setCyear(String cyear) {
		this.cyear = cyear;
	}

	public String getCamount() {
		return camount;
	}

	public void setCamount(String camount) {
		this.camount = camount;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}

	public String getCarimg() {
		return carimg;
	}

	public void setCarimg(String carimg) {
		this.carimg = carimg;
	}

	public MultipartFile getCfile() {
		return cfile;
	}

	public void setCfile(MultipartFile cfile) {
		this.cfile = cfile;
	}

	@Override
	public String toString() {
		return "Car [cname=" + cname + ", cyear=" + cyear + ", camount=" + camount + ", ctype=" + ctype + ", ccode="
				+ ccode + ", carimg=" + carimg + ", cfile=" + cfile + "]";
	}
	
	
	
}
