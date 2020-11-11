package com.project.app.service;

import java.util.List;

import com.project.app.vo.PostVO;

public interface HomeService {
	List<PostVO> getRecentPostList();
	List<PostVO> getRecommendPostList();
}
