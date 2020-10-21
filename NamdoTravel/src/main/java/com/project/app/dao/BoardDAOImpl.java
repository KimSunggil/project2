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
	public List<PostVO> getPostList(int boardId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.board.getPostList", boardId);
	}
	
	@Override
	public PostVO getPost(int postId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.project.app.board.getPost", postId);
	}

	@Override
	public void addPost(AddPostVO addPost) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.project.app.board.addPost", addPost);
		sqlSession.insert("com.project.app.board.addPostContent", addPost);
	}

	@Override
	public String getPostContent(int postId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.project.app.board.getPostContent", postId);
	}

	@Override
	public void modifyPost(AddPostVO addPost) {
		// TODO Auto-generated method stub
		sqlSession.update("com.project.app.board.modifyPost",addPost);
		sqlSession.update("com.project.app.board.modifyPostContent",addPost);
	}

	@Override
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		sqlSession.delete("com.project.app.board.deletePost",postId);
		sqlSession.delete("com.project.app.board.deletePostContent",postId);
	}
	
	

}
