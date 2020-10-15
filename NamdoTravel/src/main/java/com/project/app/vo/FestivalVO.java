package com.project.app.vo;

import java.sql.Date;

public class FestivalVO {
	
	private String fstNm;
	private Date startDt;
	private Date endDt;
	private String fstContent;
	private String fstAddress;
	private String fstNum;
	private String fstHp;
	
	public String getFstNm() {
		return fstNm;
	}
	public void setFstNm(String fstNm) {
		this.fstNm = fstNm;
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
	public String getFstContent() {
		return fstContent;
	}
	public void setFstContent(String fstContent) {
		this.fstContent = fstContent;
	}
	public String getFstAddress() {
		return fstAddress;
	}
	public void setFstAddress(String fstAddress) {
		this.fstAddress = fstAddress;
	}
	public String getFstNum() {
		return fstNum;
	}
	public void setFstNum(String fstNum) {
		this.fstNum = fstNum;
	}
	public String getFstHp() {
		return fstHp;
	}
	public void setFstHp(String fstHp) {
		this.fstHp = fstHp;
	}
	
	@Override
	public String toString() {
		return "FestivalVO [fstNm=" + fstNm + ", startDt=" + startDt + ", endDt=" + endDt + ", fstContent=" + fstContent
				+ ", fstAddress=" + fstAddress + ", fstNum=" + fstNum + ", fstHp=" + fstHp + "]";
	}
	
}
