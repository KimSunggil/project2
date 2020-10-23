package com.project.app.service;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;
import com.project.app.vo.ReplyVO;

public interface BoardService {
	//본문 관련
	//select
	PostVO getPost(int boardId);
	List<PostVO> getPostList(int boardId);
	//insert
	String getPostContent(int postId);
	void addPost(AddPostVO addPost);
	//update
	void modifyPost(PostVO addPost);
	void plusHits(int postId);
	void plusLike(int postId);
	void plusDisLike(int postId);
	//delete
	void deletePost(int postId);
	
	//댓글 관련
	//select
	List<ReplyVO> getReplyList(int postId);
	//insert
	void addReply(ReplyVO reply);
}
