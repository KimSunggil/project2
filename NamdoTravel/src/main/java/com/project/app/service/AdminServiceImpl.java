package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.AdminDAO;
import com.project.app.vo.AccountVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO adminDao;
	
	@Override
	public List<AccountVO> getAllUserDetail() {
		// TODO Auto-generated method stub
		return adminDao.getAllUserDetail();
	}

	@Override
	public void resetPassword(String id) {
		// TODO Auto-generated method stub
		adminDao.resetPassword(id);
	}

}
