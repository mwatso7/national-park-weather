package com.techelevator.npgeek;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.npgeek.park.FavoritePark;
import com.techelevator.npgeek.park.Park;
import com.techelevator.npgeek.park.ParkDAO;
import com.techelevator.npgeek.survey.Survey;
import com.techelevator.npgeek.survey.SurveyDAO;

@Controller
public class SurveyController {

	@Autowired 
	private ParkDAO parkDAO;
	
	@Autowired
	private SurveyDAO surveyDAO;
	
	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String displaySurvey(ModelMap modelHandler) {
		if( ! modelHandler.containsAttribute("survey")) {        // If the modelHolder ModelMap does not have a "SignUp" entry
			modelHandler.addAttribute("survey", new Survey());   //    add one
		}
		modelHandler.put("parks", parkDAO.getAllParks());
		
		return "survey";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String sumbitSurvey(	@RequestParam String parkcode, 
								@RequestParam String emailaddress, 
								@RequestParam String state, 
								@RequestParam String activitylevel, 
								ModelMap modelHandler,
								@Valid @ModelAttribute("survey") Survey registerFormValues,
								BindingResult result,                                       
								RedirectAttributes flashData) {
		
		if(result.hasErrors()) {                             
			flashData.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "survey", result);  
			                                                                           
			flashData.addFlashAttribute("survey", registerFormValues);                      
			return "redirect:/survey";
		}

		flashData.addFlashAttribute("message", "You have successfully submitted your survey.");
		
		Survey userSurvey = new Survey();
		userSurvey.setParkcode(parkcode);
		userSurvey.setEmailaddress(emailaddress);
		userSurvey.setState(state);
		userSurvey.setActivitylevel(activitylevel);
		
		surveyDAO.save(userSurvey);
		
		return "redirect:/favoriteparks";
	}
	
	@RequestMapping("/favoriteparks")
	public String displayFavoriteParks(ModelMap modelHandler) {
		List<FavoritePark> favoriteParks = surveyDAO.getFavoriteParks();

		modelHandler.put("favoriteparks", favoriteParks);
		return "favoriteParks";
	}
}
