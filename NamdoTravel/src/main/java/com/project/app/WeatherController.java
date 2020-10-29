package com.project.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.app.jsondb.APISerializer;
import com.project.app.service.WeatherService;
import com.project.app.vo.WeatherVO;

@Controller("weather.weatherController")
@RequestMapping("/weather/*")
public class WeatherController {
	@Autowired
	private APISerializer api;
	
	@Resource
	WeatherService weatherService;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public ModelAndView main(ModelAndView mav , Model model) throws Exception {
		List<WeatherVO> weather = weatherService.getWeather();
		model.addAttribute("weather", weather);
		mav.setViewName("main");
		return mav;
	}
	@RequestMapping(value="search2", produces="appliction/json;charset=utf-8")
	@ResponseBody
	public String search2(
			@RequestParam String base_date,
			@RequestParam String base_time,
			@RequestParam String nx,
			@RequestParam String ny
			) throws Exception {
		String result="";
		// 초단기 예보
		String urlDef="http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
		// 키
		String serviceKey="mdCptxvVYDgerO2kQkkuIFXuPM8%2FLFH6gcxsiUFfV0uU%2FvG1W4qL85BRYIQap5BfxfheIqd0l3a2PcjgyjI7Gg%3D%3D";
		// 한페이지 결과수
		int numOfRows=67;
		// 페이지
		int pageNo=1;
		// 타입(XML/JSON)
		String dataType="JSON";
		
		urlDef += "?serviceKey="+serviceKey;
		urlDef += "&numOfRows="+numOfRows;
		urlDef += "&pageNo="+pageNo;
		urlDef += "&base_date="+base_date;
		urlDef += "&base_time="+base_time;
		urlDef += "&nx="+nx;
		urlDef += "&ny="+ny;
		urlDef += "&dataType="+dataType;
		
		result = api.receiveToString(urlDef);
		
		return result;
	}
}