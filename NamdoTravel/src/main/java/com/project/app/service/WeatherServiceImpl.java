package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.WeatherDAO;
import com.project.app.vo.WeatherVO;

@Service
public class WeatherServiceImpl implements WeatherService{

	@Inject
	private WeatherDAO weatherDao;
	
	@Override
	public List<WeatherVO> getWeather() {
		return weatherDao.getWeather();
	}

}
