package com.project.app;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.app.service.TourService;
import com.project.app.vo.TourVO;

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
	@RequestMapping(value = "/tour", method = RequestMethod.GET)
	public String Tour(Model model) {
		List<TourVO> tour = tourService.tourList();
		model.addAttribute("tour", tour);
		return "tour";
	}
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String Room(Model model) {
		List<TourVO> room = tourService.roomList();
		model.addAttribute("room", room);
		return "room";
	}
	
	@RequestMapping(value = "/food", method = RequestMethod.GET)
	public String Food(Model model) {
		List<TourVO> food = tourService.foodList();
		model.addAttribute("food", food);
		return "food";
	}
	
}