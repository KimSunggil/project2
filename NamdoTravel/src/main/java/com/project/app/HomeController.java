package com.project.app;

import java.security.Principal;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);	
		return "home";
	}
	
	//현재 로그인한 사용자 정보 불러오기 테스트
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String test(Model model, Principal principal) {
		System.out.println(principal);
		
		model.addAttribute("aaa", principal.getName());
		
		return "testroom";
	}
}
