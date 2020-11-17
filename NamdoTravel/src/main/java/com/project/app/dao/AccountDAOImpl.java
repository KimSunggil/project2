package com.project.app.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.app.vo.AccountVO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public AccountVO getAccountDetail(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.project.app.account.getAccountDetail",userId);
	}
	
	@Override
	public int addAccount(AccountVO acc) {
		return sqlSession.insert("com.project.app.account.addAccount",acc);
	}
	
	@Override
	public void updateAccount(AccountVO acc) {
		sqlSession.update("com.project.app.account.updateAccount",acc);
	}


}
