//package com.project.app;
//
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.project.app.service.WheatherService;
//import com.project.app.vo.WheatherVO;
//
//@Controller	
//@RequestMapping(value = "/home")
//public class WheatherController {
//	
//	@Autowired
//	@Qualifier("wheatherServiceImpl")
//	WheatherService wheatherService;
//	
//	private static final Logger logger = LoggerFactory.getLogger(WheatherController.class);
//	
//	@RequestMapping(value = "/wheather", method = RequestMethod.GET)
//	public String wheather(Model model) {
//		List<WheatherVO> wheather = wheatherService.getWheather();				
//		model.addAttribute("wheathers", wheather );
//		return "wheather";
//	}
//}블록 풀면 500걸립니다.