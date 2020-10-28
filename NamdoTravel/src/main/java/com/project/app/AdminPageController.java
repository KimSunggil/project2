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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("boardId",1);
		map.put("pageIndex",(1-1)*10);
		
		
		
		List<AccountVO> allUser = adminService.getAllUserDetail();
		List<PostVO> post = boardService.getPostList(map);
			
		model.addAttribute("users",allUser);
		model.addAttribute("posts", post);
		
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
}













