package com.project.app.dao;

import com.project.app.vo.AccountVO;

public interface AccountDAO {
	public AccountVO getAccountDetail(String userId);
	public int addAccount(AccountVO acc);
	public void updateAccount(AccountVO acc);
}
