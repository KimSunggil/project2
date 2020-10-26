package com.project.app.jsondb;

public class Control {
	public static void main(String[] args) {
		// 동내 기상 JSON데이터를 얻기위해 필요한 요청변수를 입력해줍니다.
		// baseDate : 기준날짜, baseTime : 기준시간, x : 경도, y : 위도 참고문서를 확인하세요
		String baseDate = "20201014";
		String baseTime = "0500"; // 0200, 0500, 0800, 1100, 1400, 2000, 2300
		int x = 92;
		int y = 131;
		

		// 기상데이터를 얻어오는 객체를 생성
		VillageWeatherJSON vwJson = new VillageWeatherJSON();
		// 기상데이터를 JSON형태로 받아 VillageWeather에 저장
		VillageWeather vw = vwJson.getVillageWeather(baseDate, baseTime, x, y);
		// 데이터베이스에 접속에 관련하는객체를 만들고 데이터베이스에 입력
		VillageWeatherDAO vwDao = new VillageWeatherDAO();
		vwDao.intertVillageWeather(6, vw);
	}
}
