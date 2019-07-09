package com.techelevator.npgeek.park;

import java.util.List;

public interface parkDAO {
	
	public List<Park> getAllParks();
	public Park getParkByCode(String parkcode);

}
