package com.project.app.dao;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

public interface BoardDAO {
	public List<PostVO> getPost(int boardId);
	public String getPostContent(int postId);
	public void addPost(AddPostVO addPost);
}
