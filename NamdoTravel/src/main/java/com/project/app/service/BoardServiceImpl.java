package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.BoardDAO;
import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

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

}
