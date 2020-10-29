package com.project.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.app.dao.AdminDAO;
import com.project.app.vo.AccountVO;
import com.project.app.vo.PostVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO adminDao;
	
	@Override
	public List<AccountVO> getAllUserDetail(int pageIndex) {
		// TODO Auto-generated method stub
		return adminDao.getAllUserDetail(pageIndex);
	}

	@Override
	public List<PostVO> getAllPostListDetail(int pageIndex) {
		// TODO Auto-generated method stub
		return adminDao.getAllPostDetail(pageIndex);
	}

	@Override
	public int getUserPaging() {
		// TODO Auto-generated method stub
		return adminDao.getUserPaging();
	}

	@Override
	public int getPostPaging() {
		// TODO Auto-generated method stub
		return adminDao.getPostPaging();
	}
	
	@Override
	public void resetPassword(String id) {
		// TODO Auto-generated method stub
		adminDao.resetPassword(id);
	}

}
