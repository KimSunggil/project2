package com.project.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.AccountVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<AccountVO> getAllUserDetail() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.project.app.admin.getAllUserDetail");
	}

	@Override
	public void resetPassword(String id) {
		// TODO Auto-generated method stub
		sqlSession.update("com.project.app.admin.resetPassword",id);
	}

}
