package com.project.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.app.method.Paging;
import com.project.app.service.AccountService;
import com.project.app.service.AdminService;
import com.project.app.service.BoardService;
import com.project.app.vo.AccountVO;
import com.project.app.vo.PostVO;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value="/admin")
public class AdminPageController {
	
	@Autowired
	@Qualifier("adminServiceImpl")
	AdminService adminService;
	
	@Autowired
	@Qualifier("accountServiceImpl")
	AccountService accountService;
	
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainAdminPage(Model model) {
		
	    return "redirect: /userpage1_1" ;
	}
	
	@RequestMapping(value = "/{currentTab}page{userPage}_{postPage}", method = RequestMethod.GET)
	public String mainAdminPage(@PathVariable("currentTab") String currentTab, @PathVariable("userPage") int userPage, @PathVariable("postPage") int postPage, Model model) {
		
		Paging paging = new Paging();
		
		int postAllPage = adminService.getPostPaging();
		int userAllPage = adminService.getUserPaging();
		
		paging.makePage(postPage);
		paging.makeLastPageNum(postAllPage);
		
		Integer postBlockStartNum = paging.getPageStartNum();
		Integer postBlockLastNum = paging.getPageEndNum();
		Integer postLastPageNum = paging.getLastPageNum();
		
		paging.makePage(userPage);
		paging.makeLastPageNum(postAllPage);
		
		Integer userBlockStartNum = paging.getPageStartNum();
		Integer userBlockLastNum = paging.getPageEndNum();
		Integer userLastPageNum = paging.getLastPageNum();
		
		List<AccountVO> allUser = adminService.getAllUserDetail((userPage-1)*10);
		List<PostVO> post = adminService.getAllPostListDetail((postPage-1)*10);
		
		//리스트 출력
		model.addAttribute("users",allUser);
		model.addAttribute("posts", post);
		
		//게시글 관리 페이징 관련
		model.addAttribute("postPages",postPage);
		model.addAttribute("postAllPages",postAllPage);
		model.addAttribute("postBlockStartNums", postBlockStartNum);
		model.addAttribute("postBlockLastNums", postBlockLastNum);
		model.addAttribute("postLastPageNums", postLastPageNum);
		
		//유저 관리 페이징 관련
		model.addAttribute("userPages",userPage);
		model.addAttribute("userAllPages",userAllPage);
		model.addAttribute("userBlockStartNums", userBlockStartNum);
		model.addAttribute("userBlockLastNums", userBlockLastNum);
		model.addAttribute("userLastPageNums", userLastPageNum);
		
	    return "admin" ;
	}
	
	@RequestMapping(value="/updateAcc", method = RequestMethod.POST)
	public String updateAccount(@ModelAttribute AccountVO acc, Model model) {
		accountService.updateAccont(acc);
		
		return "redirect: /";
	}
	
	@RequestMapping(value="/resetPass", method = RequestMethod.POST)
	public String resetPassword(@ModelAttribute AccountVO acc, Model model) {
		System.out.println(acc.getUserId());
		System.out.println("resetPass");
		adminService.resetPassword(acc.getUserId());
		
		return "redirect: /";
	}
	
	@RequestMapping(value="/deleteAccount", method=RequestMethod.POST)
	public String deleteAccount(Model model) {
		System.out.println("Account Delete");
		
		return "redirect: /";
	}
	
	// 게시글 삭제 요청
	@RequestMapping(value="/deletePost_{postId}", method=RequestMethod.POST)
	public String deletePost(@PathVariable("postId") int postId, Model model){
		boardService.deletePost(postId);
		
		return "redirect: /";
	}
}













