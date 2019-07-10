package com.techelevator.npgeek.park;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCparkDAO implements ParkDAO{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCparkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Park> getAllParks() {
		List<Park> theParks = new ArrayList<Park>();

		String sqlGetAllParks = "SELECT * FROM park ORDER BY parkname";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllParks);

		while (results.next()) {
			Park thePark = mapRowToPark(results);
			theParks.add(thePark);
		}
		return theParks;
	}

	@Override
	public Park getParkByCode(String parkcode) {
		Park thePark = new Park();
		String sqlSelectAllParks = "SELECT * FROM park WHERE parkcode = ? ORDER BY parkname";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllParks, parkcode);
		if (results.next()) {
		thePark = mapRowToPark(results);
		}
		return thePark;
	}

	private Park mapRowToPark(SqlRowSet results) {
		Park thePark = new Park();
		thePark.setParkcode(results.getString("parkcode"));
		thePark.setParkname(results.getString("parkname"));
		thePark.setState(results.getString("state"));
		thePark.setAcreage(results.getInt("acreage"));
		thePark.setElevationinfeet(results.getInt("elevationinfeet"));
		thePark.setMilesoftrail(results.getDouble("milesoftrail"));
		thePark.setNumberofcampsites(results.getInt("numberofcampsites"));
		thePark.setClimate(results.getString("climate"));
		thePark.setYearfounded(results.getInt("yearfounded"));
		thePark.setAnnualvisitorcount(results.getInt("annualvisitorcount"));
		thePark.setInspirationalquote(results.getString("inspirationalquote"));
		thePark.setInspirationalquotesource(results.getString("inspirationalquotesource"));
		thePark.setParkdescription(results.getString("parkdescription"));
		thePark.setEntryfee(results.getInt("entryfee"));
		thePark.setNumberofanimalspecies(results.getInt("numberofanimalspecies"));

		return thePark;
	}
	
}
