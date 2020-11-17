package com.project.app.dao;

import java.util.List;

import com.project.app.vo.TourVO;

public interface TourDAO {
	public List<TourVO> tourList();
	public List<TourVO> roomList();
	public List<TourVO> foodList();
	public List<TourVO> getTourismList();
}
