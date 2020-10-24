package com.project.app.service;

import java.util.List;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.FavorVO;
import com.project.app.vo.PostVO;
import com.project.app.vo.ReplyVO;

public interface BoardService {
	//본문 관련
	//select
	PostVO getPost(int boardId);
	List<PostVO> getPostList(int boardId);
	//insert
	void addPost(AddPostVO addPost);
	//update
	void modifyPost(PostVO addPost);
	void plusHits(int postId);
	//delete
	void deletePost(int postId);
	
	// 좋아요/싫어요 관련
	String seachPostFavor(FavorVO fav);
	void addPostFavor(FavorVO fav);
	
	//댓글 관련
	//select
	List<ReplyVO> getReplyList(int postId);
	//insert
	void addReply(ReplyVO reply);
	//update
	void modifyReply(ReplyVO reply);
	//delete
	void deleteReply(int replyId);
}
