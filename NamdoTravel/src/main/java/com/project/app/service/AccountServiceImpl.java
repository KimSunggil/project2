package com.project.app.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.AccountDAO;
import com.project.app.vo.AccountVO;

@Service
public class AccountServiceImpl implements AccountService{
	
	@Inject
	private AccountDAO accountDao;
	
	@Override
	public AccountVO getAccountDetail(String userId) {
		// TODO Auto-generated method stub
		return accountDao.getAccountDetail(userId);
	}
	
	@Override
	public int addAccount(AccountVO acc) {
		return accountDao.addAccount(acc);
	}

	@Override
	public void updateAccont(AccountVO acc) {
		// TODO Auto-generated method stub
		accountDao.updateAccount(acc);
	}


}
