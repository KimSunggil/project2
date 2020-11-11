package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.HomeDAO;
import com.project.app.vo.PostVO;

@Service
public class HomeServiceImpl implements HomeService {

	@Inject
	HomeDAO homeDao;
	
	@Override
	public List<PostVO> getRecentPostList() {
		// TODO Auto-generated method stub
		return homeDao.getRecentPostList();
	}

	@Override
	public List<PostVO> getRecommendPostList() {
		// TODO Auto-generated method stub
		return homeDao.getRecommendPostList();
	}

}
