package com.project.app.vo;

public class TourVO {
	
	private String tourArea;
	private String tourNm;
	private String tourAddress;
	private String parking;
	private String tourHp;
	
	public String gettourArea() {
		return tourArea;
	}
	public void settourArea(String tourArea) {
		this.tourArea = tourArea;
	}
	public String gettourNm() {
		return tourNm;
	}
	public void settourNm(String tourNm) {
		this.tourNm = tourNm;
	}
	public String gettourAddress() {
		return tourAddress;
	}
	public void settourAddress(String tourAddress) {
		this.tourAddress = tourAddress;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String gettourHp() {
		return tourHp;
	}
	public void settourHp(String tourHp) {
		this.tourHp = tourHp;
	}
	@Override
	public String toString() {
		return "tourVO [tourArea=" + tourArea + ", tourNm=" + tourNm + ", tourAddress=" + tourAddress + ", parking="
				+ parking + ", tourHp=" + tourHp + "]";
	}
	
	
	
}
