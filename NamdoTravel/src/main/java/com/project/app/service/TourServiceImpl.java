package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.TourDAO;
import com.project.app.vo.TourVO;

@Service
public class TourServiceImpl implements TourService{

	@Inject
	private TourDAO tourDao;
	
	@Override
	public List<TourVO> tourList() {
		// TODO Auto-generated method stub
		return tourDao.tourList();
	}

	@Override
	public List<TourVO> roomList() {
		// TODO Auto-generated method stub
		return tourDao.roomList();
	}

	@Override
	public List<TourVO> foodList() {
		// TODO Auto-generated method stub
		return tourDao.foodList();
	}

	@Override
	public List<TourVO> getTourismList() {
		// TODO Auto-generated method stub
		return tourDao.getTourismList();
	}

	@Override
	public List<String> getAreaList() {
		// TODO Auto-generated method stub
		return tourDao.getAreaList();
	}

	@Override
	public List<String> getSortationList() {
		// TODO Auto-generated method stub
		return tourDao.getSortationList();
	}

}
