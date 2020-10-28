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

import com.project.app.service.TourService;
import com.project.app.vo.TourVO;

//import net.sf.json.JSONArray;

/**
 * Handles requests for the application tour page.
 */

@Controller
public class TourController {

	@Resource
	TourService tourService;

	private static final Logger logger = LoggerFactory.getLogger(TourController.class);

	/**
	 * Simply selects the tour view to render by returning its name.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/tour", method = RequestMethod.GET)
	public String Tour(Model model) {
		List<TourVO> tour = tourService.tourList();
		JSONArray tourArray = new JSONArray();
		tour.stream().forEach((ele) -> {
			JSONObject tourObject = new JSONObject();
			tourObject.put("area", ele.getArea());
			tourObject.put("tourismNm", ele.getTourismNm());
			tourObject.put("address", ele.getLocationNmAddress());
			tourArray.add(tourObject);
		});
		model.addAttribute("json", tourArray.toJSONString());
		model.addAttribute("tour", tour);
		
		return "tour";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String Room(Model model) {
		List<TourVO> room = tourService.roomList();
		JSONArray jsonArray = new JSONArray();
		room.stream().forEach((ele) -> {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("area", ele.getArea());
			jsonObject.put("tourismNm", ele.getTourismNm());
			jsonObject.put("address", ele.getLocationNmAddress());
			jsonArray.add(jsonObject);
		});
		model.addAttribute("json", jsonArray.toJSONString());

		model.addAttribute("room", room);
		return "room";

	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String Food(Model model) {
		List<TourVO> food = tourService.foodList();
		JSONArray foodArray = new JSONArray();
		food.stream().forEach((ele) -> {
			JSONObject foodObject = new JSONObject();
			foodObject.put("area", ele.getArea());
			foodObject.put("tourismNm", ele.getTourismNm());
			foodObject.put("address", ele.getLocationNmAddress());
			foodArray.add(foodObject);
		});
		model.addAttribute("json", foodArray.toJSONString());
		model.addAttribute("food", food);
		return "food";
	}

}
