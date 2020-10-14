package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import com.project.app.dao.WheatherDAO;
import com.project.app.vo.WheatherVO;

public class WheatherServiceImpl implements WheatherService{

	@Inject
	private WheatherDAO wheatherDao;
	
	@Override
	public List<WheatherVO> getWheather() {
		return wheatherDao.getWheather();
	}

}
