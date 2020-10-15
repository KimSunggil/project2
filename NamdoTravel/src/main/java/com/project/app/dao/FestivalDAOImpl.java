package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.FestivalVO;

@Repository
public class FestivalDAOImpl implements FestivalDAO{
	
	@Inject
	private SqlSession sqlSession;

	
	@Override
	public List<FestivalVO> festivalList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.festival.festivalList");
	}

}
