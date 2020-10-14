package com.project.app.dao;

import java.util.List;

import com.project.app.vo.WeatherVO;

public interface WeatherDAO {

	public List<WeatherVO> getWeather();
}
