package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.PostVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PostVO> getPost(int boardId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.board.getPost", boardId);
	}

	@Override
	public void addPost(AddPostVO addPost) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.project.app.board.addPost", addPost);
	}
	
	

}
