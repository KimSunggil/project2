package com.project.app.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.BoardDAO;
import com.project.app.vo.AddPostVO;
import com.project.app.vo.FavorVO;
import com.project.app.vo.PostVO;
import com.project.app.vo.ReplyVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;
	
	@Override
	public List<PostVO> getPostList(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return boardDao.getPostList(map);
	}
	
	@Override
	public int getPaging(int boardId) {
		return boardDao.getPaging(boardId);
	}
	
	@Override
	public PostVO getPost(int postId) {
		// TODO Auto-generated method stub
		return boardDao.getPost(postId);
	}

	@Override
	public void addPost(AddPostVO addPost) {
		// TODO Auto-generated method stub
		boardDao.addPost(addPost);
	}

	@Override
	public void modifyPost(PostVO addPost) {
		// TODO Auto-generated method stub
		boardDao.modifyPost(addPost);
	}

	@Override
	public void plusHits(int postId) {
		// TODO Auto-generated method stub
		boardDao.plusHits(postId);
	}
	
	@Override
	public void modifyReply(ReplyVO reply) {
		// TODO Auto-generated method stub		
		boardDao.modifyReply(reply);
	}
	
	@Override
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		boardDao.deletePost(postId);
	}

	@Override
	public List<ReplyVO> getReplyList(int postId) {
		// TODO Auto-generated method stub
		return boardDao.getReplyList(postId);
	}

	@Override
	public void addReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		boardDao.addReply(reply);
	}

	@Override
	public void deleteReply(int replyId) {
		// TODO Auto-generated method stub
		boardDao.deleteReply(replyId);
	}

	@Override
	public String seachPostFavor(FavorVO fav) {
		// TODO Auto-generated method stub
		return boardDao.seachPostFavor(fav);
	}

	@Override
	public void addPostFavor(FavorVO fav) {
		// TODO Auto-generated method stub
		boardDao.addPostFavor(fav);
	}
		
}
