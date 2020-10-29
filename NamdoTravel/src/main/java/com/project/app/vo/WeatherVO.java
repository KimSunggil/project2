package com.project.app.vo;

public class WeatherVO {
	private String city;
	private String gridX;
	private String gridY;
	private double latitude;
	private double longitude;
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGridX() {
		return gridX;
	}
	public void setGridX(String gridX) {
		this.gridX = gridX;
	}
	public String getGridY() {
		return gridY;
	}
	public void setGridY(String gridY) {
		this.gridY = gridY;
	}
}