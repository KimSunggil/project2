package com.project.app;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.app.service.WheatherService;
import com.project.app.vo.WheatherVO;

@Controller	
public class WheatherController {
	
	@Qualifier("wheatherServiceImpl")
	WheatherService wheatherService;
	
	private static final Logger logger = LoggerFactory.getLogger(WheatherController.class);
	
	@RequestMapping(value = "/wheather", method = RequestMethod.GET)
	public String wheather(Model model) {
		List<WheatherVO> wheathers = wheatherService.getWheather();				
		model.addAttribute("wheathers", wheathers );
		return "wheather";
	}
}