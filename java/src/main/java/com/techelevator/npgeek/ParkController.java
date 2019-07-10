package com.techelevator.npgeek;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.park.Park;
import com.techelevator.npgeek.park.ParkDAO;
import com.techelevator.npgeek.weather.WeatherDAO;

@Controller
public class ParkController {
	
	@Autowired 
	private ParkDAO parkDAO;
	
	@Autowired
	private WeatherDAO weatherDAO;
	
	@RequestMapping("/")
	public String displayHome(ModelMap modelHolder) {
		List<Park> allParks = parkDAO.getAllParks();
		
		modelHolder.put("parks", allParks);
		
		return "home";
	}
	
	@RequestMapping(path= "/parkDetail", method= RequestMethod.GET)
	public String displayParkDetail(@RequestParam String parkcode, ModelMap modelHolder) {
		
		modelHolder.put("park", parkDAO.getParkByCode(parkcode.toUpperCase()));
		modelHolder.put("weather", weatherDAO.getWeatherByCode(parkcode.toUpperCase()));
		
		return "parkDetail";
	}
	

}
