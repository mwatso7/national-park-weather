package com.techelevator.npgeek.survey;

import java.util.List;

public interface SurveyDAO {

	public List<Survey> getAllSurveysByCode(String parkcode);
	
	public boolean save(Survey newSurvey);
}
