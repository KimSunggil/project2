package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.BoardDAO;
import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;
import com.project.app.vo.ReplyVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;
	
	@Override
	public List<PostVO> getPostList(int boardId) {
		// TODO Auto-generated method stub
		return boardDao.getPostList(boardId);
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
	public String getPostContent(int postId) {
		// TODO Auto-generated method stub
		return boardDao.getPostContent(postId);
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
	public void plusLike(int postId) {
		// TODO Auto-generated method stub
		boardDao.plusLike(postId);
	}

	@Override
	public void plusDisLike(int postId) {
		// TODO Auto-generated method stub
		boardDao.plusDisLike(postId);
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
	
}
