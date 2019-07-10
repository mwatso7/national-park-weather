package com.techelevator.npgeek.weather;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.park.Park;

@Component
public class JDBCweatherDAO implements WeatherDAO{
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCweatherDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
}

	@Override
	public List<Weather> getWeatherByCode(String parkcode) {
		List<Weather> theWeather = new ArrayList<Weather>();
		String sqlSelectAllWeather = "SELECT * FROM weather WHERE parkcode = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllWeather, parkcode);
		while (results.next()) {
		Weather dailyWeather = mapRowToWeather(results);
		theWeather.add(dailyWeather);
		}
		return theWeather;
	}

	private Weather mapRowToWeather(SqlRowSet results) {
		Weather theWeather = new Weather();
		theWeather.setParkcode(results.getString("parkcode"));
		theWeather.setFivedayforecastvalue(results.getInt("fivedayforecastvalue"));
		theWeather.setLow(results.getInt("low"));
		theWeather.setHigh(results.getInt("high"));
		theWeather.setForecast(results.getString("forecast"));

		return theWeather;
	}
}