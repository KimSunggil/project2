package com.project.app.service;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

public interface BoardService {
	//select
	PostVO getPost(int boardId);
	List<PostVO> getPostList(int boardId);
	//insert
	String getPostContent(int postId);
	void addPost(AddPostVO addPost);
	//update
	void modifyPost(AddPostVO addPost);
	//delete
	void deletePost(int postId);
}
