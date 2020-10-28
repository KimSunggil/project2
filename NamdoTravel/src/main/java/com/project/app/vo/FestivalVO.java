package com.project.app.vo;

import java.sql.Date;

public class FestivalVO {
	
	private String area;
	private String festivalNm;
	private Date startDt;
	private Date endDt;
	private String festivalContent;
	private String locationNmAddress;
	private String festivalPNum;
	private String festivalHp;
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFestivalNm() {
		return festivalNm;
	}
	public void setFestivalNm(String festivalNm) {
		this.festivalNm = festivalNm;
	}
	public Date getStartDt() {
		return startDt;
	}
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}
	public String getFestivalContent() {
		return festivalContent;
	}
	public void setFestivalContent(String festivalContent) {
		this.festivalContent = festivalContent;
	}
	public String getLocationNmAddress() {
		return locationNmAddress;
	}
	public void setLocationNmAddress(String locationNmAddress) {
		this.locationNmAddress = locationNmAddress;
	}
	public String getFestivalPNum() {
		return festivalPNum;
	}
	public void setFestivalPNum(String festivalPNum) {
		this.festivalPNum = festivalPNum;
	}
	public String getFestivalHp() {
		return festivalHp;
	}
	public void setFestivalHp(String festivalHp) {
		this.festivalHp = festivalHp;
	}
	@Override
	public String toString() {
		return "FestivalVO [area=" + area + ", festivalNnm=" + festivalNm + ", startDt=" + startDt + ", endDt=" + endDt
				+ ", festivalContent=" + festivalContent + ", locationNmAddress=" + locationNmAddress
				+ ", festivalPNum=" + festivalPNum + ", festivalHp=" + festivalHp + "]";
	}
	
	
}
