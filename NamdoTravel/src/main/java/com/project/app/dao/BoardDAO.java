package com.project.app.dao;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;
import com.project.app.vo.ReplyVO;

public interface BoardDAO {
	// 본문 관련
	//select
	public List<PostVO> getPostList(int boardId);
	public PostVO getPost(int postId);
	//insert
	public String getPostContent(int postId);
	public void addPost(AddPostVO addPost);
	//update
	public void modifyPost(PostVO addPost);
	//delete
	public void deletePost(int postId);
	
	// 댓글 관련
	// select
	public List<ReplyVO> getReplyList(int postId);
	//insert
	public void addReply(ReplyVO reply);
}