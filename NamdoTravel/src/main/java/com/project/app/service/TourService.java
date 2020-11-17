package com.project.app.service;

import java.util.List;

import com.project.app.vo.TourVO;

public interface TourService {
	public List<TourVO> tourList();
	public List<TourVO> roomList();
	public List<TourVO> foodList();
	public List<TourVO> getTourismList();
}
