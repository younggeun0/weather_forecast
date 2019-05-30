package com.weather.younggeun0.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
public class ForecastController {

	@RequestMapping(value="index.do", method=GET)
	public String weatherForecast(String flag) {
		
		if (flag == null) {
			return "redirect:index.do?flag=weather";
		}
	
		if ("weather".equals(flag)) {
			
		} else if ("matter".equals(flag)) {
			
		}
		
		return "main";
	}
}
