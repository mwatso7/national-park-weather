package com.techelevator.npgeek.weather;

import java.util.List;

import com.techelevator.npgeek.park.Park;

public interface WeatherDAO {

	public List<Weather> getWeatherByCode(String parkcode);
	
}
