package com.project.app.service;

import java.util.List;

import com.project.app.vo.AccountVO;
import com.project.app.vo.PostVO;

public interface AdminService {
	public List<AccountVO> getAllUserDetail(int pageIndex);
	public List<PostVO> getAllPostListDetail(int pageIndex);
	public int getUserPaging();
	public int getPostPaging();
	public void resetPassword(String id);
}
