package com.techelevator.npgeek.weather;

public class Weather {
	
	//Data Members************************************************************************************************
	
	private String parkcode;
	private int fivedayforecastvalue;
	private int low;
	private int high;
	private String forecast;

	//CTOR********************************************************************************************************
	
	public Weather() {
		String parkcode = "unasigned";
		int fivedayforecastvalue = 0;
		int low = 0;
		int high = 0;
		String forecast = "unassigned";

	}
		
	//Get/Set*****************************************************************************************************
	public String getParkcode() {
		return parkcode;
	}

	public void setParkcode(String parkcode) {
		this.parkcode = parkcode;
	}

	public int getFivedayforecastvalue() {
		return fivedayforecastvalue;
	}

	public void setFivedayforecastvalue(int fivedayforecastvalue) {
		this.fivedayforecastvalue = fivedayforecastvalue;
	}

	public int getLow() {
		return low;
	}

	public void setLow(int low) {
		this.low = low;
	}

	public int getHigh() {
		return high;
	}

	public void setHigh(int high) {
		this.high = high;
	}

	public String getForecast() {
		return forecast;
	}

	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	
	//Methods*****************************************************************************************************
	
	
	
}
