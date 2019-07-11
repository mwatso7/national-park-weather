<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>

<c:url var = "image" value ="/img/parks/${park.parkcode}.jpg"/>

<div>
	<img src="${image}"/>
</div>

<div>
	<h1>${park.parkname}</h1>
</div>

<div>
	<p><span class="bold">Location: </span>${park.state}</p>
	<p><span class="bold">Acreage: </span>${park.acreage}</p>
	<p><span class="bold">Elevation: </span>${park.elevationinfeet}</p>
	<p><span class="bold">Total trail length: </span>${park.milesoftrail}</p>
	<p><span class="bold">Number of campsites: </span>${park.numberofcampsites}</p>
	<p><span class="bold">Climate: </span>${park.climate}</p>
	<p><span class="bold">Year founded: </span>${park.yearfounded}</p>
	<p><span class="bold">Annual visitor count: </span>${park.annualvisitorcount}</p>
	<p><span class="bold">Park quote: </span>${park.inspirationalquote}</p>
	<p><span class="bold">Quote source: </span>${park.inspirationalquotesource}</p>
	<p><span class="bold">Park description: </span>${park.parkdescription}</p>
	<p><span class="bold">Entry fee: </span>${park.entryfee}</p>
	<p><span class="bold">Number of animal species: </span>${park.numberofanimalspecies}</p>
</div>

	<p>Display units in (F)arenheit or (C)elsius. Default (F).</p>
<div id="banner">
<div id="cel">
	<a href="parkDetail?parkcode=${park.parkcode}&celOrFar=F">F</a>
	<a href="parkDetail?parkcode=${park.parkcode}&celOrFar=C">C</a>
</div>

</div>
<div id="weatherDisplay">

	<c:forEach var="day" items="${weather}">
		
		<div id="day${day.fivedayforecastvalue}">
			<c:url var = "weatherimage" value ="/img/weather/${day.forecast}.png"/>
			<c:if test="${day.forecast eq 'partly cloudy'}">
				<c:url var = "weatherimage" value ="/img/weather/partlyCloudy.png"/>
			</c:if>
			
			<img id="weatherImg" src="${weatherimage}" />
			
			<c:choose>
			
				<c:when test="${celOrFar eq 'C'}">
					<p class="high">High: ${(5/9)*(day.high - 32)}&degC</p>
					<p class="low">Low: ${(5/9)*(day.low - 32)}&degC</p>
				</c:when>
				
				<c:otherwise>
					<p class="high">High: ${day.high}&degF</p>
					<p class="low">Low: ${day.low}&degF</p>
				</c:otherwise>
				
			</c:choose>
			
				<div id="warning">
					<c:choose>
						<c:when test="${day.fivedayforecastvalue eq 1}">
							<c:choose>
							
								<c:when test="${day.forecast eq 'rain'}">
									<p>Pack rain gear and wear waterproof shoes</p>
								</c:when>
								
								<c:when test="${day.forecast eq 'snow'}">
									<p>Pack snowshoes</p>
								</c:when>
								
								<c:when test="${day.forecast eq 'thunderstorms'}">
									<p>Seek shelter and avoid hiking on exposed ridges</p>
								</c:when>
								
								<c:when test="${day.forecast eq 'rain'}">
									<p>Pack sunblock</p>
								</c:when>
								
							</c:choose>
							
							<c:choose>
							
								<c:when test="${day.high > 75}">
									<p>Bring an extra gallon of water</p>
								</c:when>
								
								<c:when test="${day.high - day.low > 20}">
									<p>Wear breathable layers</p>
								</c:when>
								
								<c:when test="${day.low < 20}">
									<p>Consider yourself warned about the dangers of exposure to frigid temperatures</p>
								</c:when>
								
							</c:choose>
							
							
							
							
							
						</c:when>
					</c:choose>
				</div>
				
		</div>
		
		<div>
			
		</div>
			
	</c:forEach>
</div>


</body>
</html>