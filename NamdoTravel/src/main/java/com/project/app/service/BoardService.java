package com.project.app.service;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

public interface BoardService {
	List<PostVO> getPost(int boardId);
	void addPost(AddPostVO addPost);
}
