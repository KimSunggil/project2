package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.PostVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PostVO> getRecentPostList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.home.getRecentPostList");
	}

	@Override
	public List<PostVO> getRecommendPostList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.home.getRecommendPostList");
	}
	
}
