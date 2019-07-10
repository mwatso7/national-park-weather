package com.techelevator.npgeek.survey;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Survey {
	
	//Data Members************************************************************************************************
	
	private long surveyid;
	
	@NotBlank(message="Park is required") 
	private String parkcode;
	
	@NotBlank(message="Email is required") 
	@Email(message="Email must be a valid email address")
	private String emailaddress;
	
	@NotBlank(message="State is required") 
	private String state;
	
	@NotBlank(message="Activity is required") 
	private String activitylevel;
	
	//CTOR********************************************************************************************************
	
	public Survey() {
		surveyid = 0;
		parkcode = "unassigned";
		emailaddress = "unassigned";
		state = "unassigned";
		activitylevel = "unassigned";
	}
	
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