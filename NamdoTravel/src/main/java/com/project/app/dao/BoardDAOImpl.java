package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.AddPostVO;
import com.project.app.vo.FavorVO;
import com.project.app.vo.PostVO;
import com.project.app.vo.ReplyVO;

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
	public void modifyPost(PostVO addPost) {
		// TODO Auto-generated method stub
		sqlSession.update("com.project.app.board.modifyPost",addPost);
		sqlSession.update("com.project.app.board.modifyPostContent",addPost);
	}
	
	@Override
	public void plusHits(int postId) {
		// TODO Auto-generated method stub
		sqlSession.update("com.project.app.board.plusHits",postId);
	}
	
	@Override
	public void modifyReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		sqlSession.update("com.project.app.board.modifyReply",reply);
	}

	@Override
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		sqlSession.delete("com.project.app.board.deletePost",postId);
		sqlSession.delete("com.project.app.board.deletePostContent",postId);
	}

	@Override
	public List<ReplyVO> getReplyList(int postId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.board.getReplyList",postId);
	}

	@Override
	public void addReply(ReplyVO reply) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.project.app.board.addReply",reply);
	}

	@Override
	public void deleteReply(int replyId) {
		// TODO Auto-generated method stub
		sqlSession.delete("com.project.app.board.deleteReply",replyId);
		
	}

	@Override
	public String seachPostFavor(FavorVO fav) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.project.app.board.seachPostFavor", fav);
	}

	@Override
	public void addPostFavor(FavorVO fav) {
		// TODO Auto-generated method stub
		sqlSession.insert("com.project.app.board.addPostFavor",fav);
	}
}
