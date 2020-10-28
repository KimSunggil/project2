package com.project.app.dao;

import java.util.List;

import com.project.app.vo.AccountVO;

public interface AdminDAO {
	public List<AccountVO> getAllUserDetail();
	public void resetPassword(String id);
}
