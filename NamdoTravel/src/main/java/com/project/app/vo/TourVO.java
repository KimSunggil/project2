package com.project.app.vo;

public class TourVO {
	
	private String area;
	private String tourismNm;
	private String locationNmAddress;
	private String parking;
	private String tourismHp;
	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getTourismNm() {
		return tourismNm;
	}

	public void setTourismNm(String tourismNm) {
		this.tourismNm = tourismNm;
	}

	public String getLocationNmAddress() {
		return locationNmAddress;
	}

	public void setLocationNmAddress(String locationNmAddress) {
		this.locationNmAddress = locationNmAddress;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getTourismHp() {
		return tourismHp;
	}

	public void setTourismHp(String tourismHp) {
		this.tourismHp = tourismHp;
	}

	@Override
	public String toString() {
		return "TourVO [area=" + area + ", tourismNm=" + tourismNm + ", locationNmAddress=" + locationNmAddress
				+ ", parking=" + parking + ", tourismHp=" + tourismHp + "]";
	}
}
