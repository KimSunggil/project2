package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.FestivalDAO;
import com.project.app.vo.FestivalVO;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Inject
	private FestivalDAO festivalDao;
	
	@Override
	public List<FestivalVO> festivalList() {
		// TODO Auto-generated method stub
		return festivalDao.festivalList();
	}

}
