package com.project.app;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.app.service.WeatherService;
import com.project.app.vo.WeatherVO;

@Controller	
public class WeatherController {
	
	@Autowired
	@Qualifier("weatherServiceImpl")
	WeatherService weatherService;
	
	private static final Logger logger = LoggerFactory.getLogger(WeatherController.class);
	
	@RequestMapping(value = "/weather", method = RequestMethod.GET)
	public String weathers(Model model) {
		List<WeatherVO> weathers = weatherService.getWeather();				
		model.addAttribute("weathers", weathers );
		return "weather";
	}
	@RequestMapping(value = "/allpage", method = RequestMethod.GET)
	public String allpage(Model model) {
		return "allpage";
	}
}