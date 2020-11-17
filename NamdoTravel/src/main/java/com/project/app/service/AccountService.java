package com.project.app.service;

import com.project.app.vo.AccountVO;

public interface AccountService {
	public AccountVO getAccountDetail(String userId);
	public int addAccount(AccountVO acc);
	public void updateAccont(AccountVO acc);
}
