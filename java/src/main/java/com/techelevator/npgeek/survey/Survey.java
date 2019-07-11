package com.techelevator.npgeek.survey;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Survey {
	
	//Data Members************************************************************************************************
	
	private long surveyid;
	
	private String parkcode;
	
	@NotBlank(message="** email is required **") 
	@Email(message="** email must be a valid email address **")
	private String emailaddress;

	private String state;
	 
	private String activitylevel;
	
	
	//Get/Set*****************************************************************************************************
	
	public long getSurveyid() {
		return surveyid;
	}
	
	public void setSurveyid(long surveyid) {
		this.surveyid = surveyid;
	}
	
	public String getParkcode() {
		return parkcode;
	}
	
	public void setParkcode(String parkcode) {
		this.parkcode = parkcode;
	}
	
	public String getEmailaddress() {
		return emailaddress;
	}
	
	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getActivitylevel() {
		return activitylevel;
	}
	
	public void setActivitylevel(String activitylevel) {
		this.activitylevel = activitylevel;
	}

	
	
}