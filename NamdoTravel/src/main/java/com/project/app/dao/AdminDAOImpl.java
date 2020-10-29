package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.AccountVO;
import com.project.app.vo.PostVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<AccountVO> getAllUserDetail(int pageIndex) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.admin.getAllUserDetail",pageIndex);
	}
	
	@Override
	public List<PostVO> getAllPostDetail(int pageIndex) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.admin.getAllPostListDetail",pageIndex);
	}

	@Override
	public int getUserPaging() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.project.app.admin.getUserPaging");
	}

	@Override
	public int getPostPaging() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.project.app.admin.getPostPaging");
	}
	
	@Override
	public void resetPassword(String id) {
		// TODO Auto-generated method stub
		sqlSession.update("com.project.app.admin.resetPassword",id);
	}
}
