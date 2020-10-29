package com.project.app;

import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.app.service.FestivalService;
import com.project.app.vo.FestivalVO;

/**
 * Handles requests for the application festival page.
 */

@Controller
public class FestivalController {

	@Resource
	FestivalService festivalService;
	
	private static final Logger logger = LoggerFactory.getLogger(FestivalController.class);
	
	/**
	 * Simply selects the festival view to render by returning its name.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/festival", method = RequestMethod.GET)
	public String Festival(Model model) {
		List<FestivalVO> festival = festivalService.festivalList();
		JSONArray festivalArray = new JSONArray();
		festival.stream().forEach((ele) -> {
			JSONObject festivalObject = new JSONObject();			
			festivalObject.put("area", ele.getArea());
			festivalObject.put("address", ele.getLocationNmAddress());
			festivalArray.add(festivalObject);
		});
		model.addAttribute("json", festivalArray.toJSONString());
		model.addAttribute("festival", festival);
		return "festival";
	}
	
}
