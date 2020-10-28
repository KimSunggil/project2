package com.project.app.service;

import java.util.List;

import com.project.app.vo.AccountVO;

public interface AdminService {
	public List<AccountVO> getAllUserDetail();
	public void resetPassword(String id);
}
