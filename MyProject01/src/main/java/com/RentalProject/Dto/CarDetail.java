package com.RentalProject.Dto;

import lombok.Data;

public class CarDetail {
	private String ccode;
	private String cdage;
	private String cdcareer;
	private String cdlicense;
	private String cdblackbox;
	private String cdrearcam;
	private String cdnavigation;
	private String cdbluetooth;
	private String cdnosmoke;
	private String cdcoldseat;
	private String cdcartype;
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCdage() {
		return cdage;
	}
	public void setCdage(String cdage) {
		this.cdage = cdage;
	}
	public String getCdcareer() {
		return cdcareer;
	}
	public void setCdcareer(String cdcareer) {
		this.cdcareer = cdcareer;
	}
	public String getCdlicense() {
		return cdlicense;
	}
	public void setCdlicense(String cdlicense) {
		this.cdlicense = cdlicense;
	}
	public String getCdblackbox() {
		return cdblackbox;
	}
	public void setCdblackbox(String cdblackbox) {
		this.cdblackbox = cdblackbox;
	}
	public String getCdrearcam() {
		return cdrearcam;
	}
	public void setCdrearcam(String cdrearcam) {
		this.cdrearcam = cdrearcam;
	}
	public String getCdnavigation() {
		return cdnavigation;
	}
	public void setCdnavigation(String cdnavigation) {
		this.cdnavigation = cdnavigation;
	}
	public String getCdbluetooth() {
		return cdbluetooth;
	}
	public void setCdbluetooth(String cdbluetooth) {
		this.cdbluetooth = cdbluetooth;
	}
	public String getCdnosmoke() {
		return cdnosmoke;
	}
	public void setCdnosmoke(String cdnosmoke) {
		this.cdnosmoke = cdnosmoke;
	}
	public String getCdcoldseat() {
		return cdcoldseat;
	}
	public void setCdcoldseat(String cdcoldseat) {
		this.cdcoldseat = cdcoldseat;
	}
	public String getCdcartype() {
		return cdcartype;
	}
	public void setCdcartype(String cdcartype) {
		this.cdcartype = cdcartype;
	}
	@Override
	public String toString() {
		return "CarDetail [ccode=" + ccode + ", cdage=" + cdage + ", cdcareer=" + cdcareer + ", cdlicense=" + cdlicense
				+ ", cdblackbox=" + cdblackbox + ", cdrearcam=" + cdrearcam + ", cdnavigation=" + cdnavigation
				+ ", cdbluetooth=" + cdbluetooth + ", cdnosmoke=" + cdnosmoke + ", cdcoldseat=" + cdcoldseat
				+ ", cdcartype=" + cdcartype + "]";
	}
	
	
}
