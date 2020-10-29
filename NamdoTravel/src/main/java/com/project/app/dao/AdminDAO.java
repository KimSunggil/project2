package com.project.app.dao;

import java.util.List;

import com.project.app.vo.AccountVO;
import com.project.app.vo.PostVO;

public interface AdminDAO {
	public List<AccountVO> getAllUserDetail(int pageIndex);
	public List<PostVO> getAllPostDetail(int pageIndex);
	public int getUserPaging();
	public int getPostPaging();
	public void resetPassword(String id);
}
