package com.techelevator.npgeek.park;

public class FavoritePark {
	
	private String parkcode;
	private String parkname;
	private int numberOfSurveys;
	
	public FavoritePark(String parkcode, String parkname, int numberOfSurveys) {
		this.parkcode = parkcode;
		this.parkname = parkname;
		this.numberOfSurveys = numberOfSurveys;
	}
	
	public String getParkcode() {
		return parkcode;
	}
	
	void setParkcode(String parkcode) {
		this.parkcode = parkcode;
	}
	
	public String getParkname() {
		return parkname;
	}
	
	public void setParkname(String parkname) {
		this.parkname = parkname;
	}
	
	public int getNumberOfSurveys() {
		return numberOfSurveys;
	}
	
	public void setNumberOfSurveys(int numberOfSurveys) {
		this.numberOfSurveys = numberOfSurveys;
	}
	
	
}
