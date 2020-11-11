package com.project.app.dao;

import java.util.List;

import com.project.app.vo.PostVO;

public interface HomeDAO {
	public List<PostVO> getRecentPostList();
	public List<PostVO> getRecommendPostList();
}
