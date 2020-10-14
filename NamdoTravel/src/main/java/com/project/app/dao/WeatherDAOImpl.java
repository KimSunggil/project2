package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.WeatherVO;

@Repository
public class WeatherDAOImpl implements WeatherDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<WeatherVO> getWeather() {
		return sqlSession.selectList("com.project.app.weather.getWeather");
	}
}
