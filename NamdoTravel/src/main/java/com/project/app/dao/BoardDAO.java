package com.project.app.dao;

import java.util.List;
import java.util.Map;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.FavorVO;
import com.project.app.vo.PostVO;
import com.project.app.vo.ReplyVO;

public interface BoardDAO {
	// 본문 관련
	//select
	public List<PostVO> getPostList(Map<String,Object> map);
	public int getPaging(int boardId);
	public PostVO getPost(int postId);
	//insert
	public void addPost(AddPostVO addPost);
	//update
	public void modifyPost(PostVO addPost);
	public void plusHits(int postId);
	//delete
	public void deletePost(int postId);
	
	//좋아요/싫어요 관련
	public String seachPostFavor(FavorVO fav);
	public void addPostFavor(FavorVO fav);
	
	// 댓글 관련
	// select
	public List<ReplyVO> getReplyList(int postId);
	//insert
	public void addReply(ReplyVO reply);
	//update
	public void modifyReply(ReplyVO reply);
	//delete
	public void deleteReply(int replyId);
}