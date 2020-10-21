package com.project.app.dao;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

public interface BoardDAO {
	public List<PostVO> getPostList(int boardId);
	public PostVO getPost(int postId);

	public String getPostContent(int postId);
	public void addPost(AddPostVO addPost);
}
