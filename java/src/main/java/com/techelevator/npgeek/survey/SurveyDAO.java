package com.techelevator.npgeek.survey;

import java.util.List;

import com.techelevator.npgeek.park.FavoritePark;

public interface SurveyDAO {

	public List<Survey> getAllSurveysByCode(String parkcode);
	
	public List<FavoritePark> getFavoriteParks();
	
	public boolean save(Survey newSurvey);
}
