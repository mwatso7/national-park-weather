package com.techelevator.npgeek.survey;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.park.FavoritePark;
import com.techelevator.npgeek.park.Park;

@Component
public class JDBCSurveyDAO implements SurveyDAO{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCSurveyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Survey> getAllSurveysByCode(String parkcode) {
		List<Survey> theSurveys = new ArrayList<Survey>();

		String sqlGetAllSurveys = "SELECT * FROM survey_result ORDER BY surveyid";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllSurveys);

		while (results.next()) {
			Survey theSurvey = mapRowToSurvey(results);
			theSurveys.add(theSurvey);
		}
		return theSurveys;
	}
	
	@Override
	public List<FavoritePark> getFavoriteParks() {
		List<FavoritePark> theParks = new ArrayList<FavoritePark>();

		String sqlGetAllFavoritePark = 	"SELECT park.parkcode, parkname, COUNT(survey_result.parkcode) AS thecount " + 
										"FROM survey_result, park " + 
										"WHERE survey_result.parkcode = park.parkcode " + 
										"GROUP BY park.parkcode " + 
										"ORDER BY thecount DESC, parkname";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllFavoritePark);

		while (results.next()) {
			FavoritePark thePark = new FavoritePark(results.getString("parkcode"), results.getString("parkname"), results.getInt("thecount"));
			theParks.add(thePark);
		}
		return theParks;
	}

	@Override
	public boolean save(Survey userSurvey) {
		try{
			int id = getNextId();
			String sqlInsertSurvey = "INSERT INTO survey_result(surveyid, parkcode, emailaddress, state, activitylevel) VALUES (?,?,?,?,?)";
			jdbcTemplate.update(sqlInsertSurvey, id, userSurvey.getParkcode(), userSurvey.getEmailaddress(), userSurvey.getState(), userSurvey.getActivitylevel());
		} catch (Exception e){
			return false;
		}
		return true;
	}
	
	private Survey mapRowToSurvey(SqlRowSet results) {
		Survey theSurvey = new Survey();
		theSurvey.setSurveyid(results.getLong("surveyid"));
		theSurvey.setParkcode(results.getString("parkcode"));
		theSurvey.setEmailaddress(results.getString("emailaddress"));
		theSurvey.setState(results.getString("state"));
		theSurvey.setActivitylevel(results.getString("activitylevel"));
		return theSurvey;
	}
	
	private int getNextId() {
		String sqlSelectNextId = "SELECT NEXTVAL('seq_surveyid')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		int id;
		if (results.next()) {
			id = results.getInt(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}

}
