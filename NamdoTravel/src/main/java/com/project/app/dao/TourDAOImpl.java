package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.TourVO;

@Repository
public class TourDAOImpl implements TourDAO{
	
	@Inject
	private SqlSession sqlSession;

	
	@Override
	public List<TourVO> tourList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.tour.tourList");
	}
	@Override
	public List<TourVO> roomList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.tour.roomList");
	}
	@Override
	public List<TourVO> foodList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.tour.foodList");
	}

}
