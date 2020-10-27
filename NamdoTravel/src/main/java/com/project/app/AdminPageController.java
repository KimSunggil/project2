package com.project.app;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.app.service.AccountService;
import com.project.app.vo.AccountVO;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value="/admin")
public class AdminPageController {
	
	@Autowired
	@Qualifier("accountServiceImpl")
	AccountService accountService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String mainAdminPage() {
		
		
		
	    return "admin" ;
	}
}
