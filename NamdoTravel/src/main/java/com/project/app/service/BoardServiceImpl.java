package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.BoardDAO;
import com.project.app.vo.PostVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDao;
	
	@Override
	public List<PostVO> getPost(int boardId) {
		// TODO Auto-generated method stub
		return boardDao.getPost(boardId);
	}

}
