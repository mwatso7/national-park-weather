package com.techelevator.npgeek;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.npgeek.park.Park;
import com.techelevator.npgeek.park.ParkDAO;

@Controller
public class ParkController {
	
	@Autowired 
	private ParkDAO parkDAO;
	
	@RequestMapping("/")
	public String displayHome(ModelMap modelHolder) {
		List<Park> allParks = parkDAO.getAllParks();
		
		modelHolder.put("parks", allParks);
		
		return "home";
	}
	
	@RequestMapping("/survey")
	public String displaySurvey() {
		return "survey";
	}
	
	@RequestMapping("/parkDetail")
	public String displayParkDetail(@RequestParam String parkcode, ModelMap modelHolder) {
		Park aPark = parkDAO.getParkByCode(parkcode);
		
		modelHolder.put("parkDetail", aPark);
		return "parkDetail";
	}
	

}
