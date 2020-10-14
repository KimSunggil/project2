package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.project.app.vo.WheatherVO;

public class WheatherDAOImpl implements WheatherDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<WheatherVO> getWheather() {
		return sqlSession.selectList("com.project.app.home.getWheather");
	}
}
