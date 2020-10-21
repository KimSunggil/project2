package com.project.app.service;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

public interface BoardService {
	PostVO getPost(int boardId);
	List<PostVO> getPostList(int boardId);

	String getPostContent(int postId);
	void addPost(AddPostVO addPost);
}
