package com.project.app.dao;

import java.util.List;

import com.project.app.vo.PostVO;

public interface BoardDAO {
	public List<PostVO> getPost(int boardId);
}
