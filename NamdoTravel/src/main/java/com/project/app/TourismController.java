package com.project.app;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.app.service.TourService;
import com.project.app.vo.TourVO;

@Controller
@RequestMapping( value="/tourism")
public class TourismController {
	
	@Autowired
	@Qualifier("tourServiceImpl")
	TourService tourService;
	
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Tourism(Model model) {
		List<TourVO> tourism = tourService.getTourismList();
		List<String> areaList = tourService.getAreaList();
		List<String> sortationList = tourService.getSortationList();
		
		JSONArray tourismList = new JSONArray();
		tourism.stream().forEach((ele) -> {
			JSONObject tourismObject = new JSONObject();
			tourismObject.put("area", ele.getArea());
			tourismObject.put("tourismNm", ele.getTourismNm());
			tourismObject.put("locationNmAddress", ele.getLocationNmAddress());
			tourismObject.put("parking", ele.getParking());
			tourismObject.put("tourismHp", ele.getTourismHp());
			tourismObject.put("sortation", ele.getSortation());
			tourismList.add(tourismObject);
		});
		
		model.addAttribute("areaList",areaList);
		model.addAttribute("sortationList",sortationList);
		model.addAttribute("tourismList",tourism);
		model.addAttribute("tourismListJSON",tourismList.toJSONString());
		
		return "tourism";
	}
	
}
