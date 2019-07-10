<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>

<p>park detail page</p>

<c:url var = "image" value ="/img/parks/${park.parkcode}.jpg"/>

<div>
	<img src="${image}"/>
</div>

<div>
	<p>${park.parkname} (${park.parkcode})</p>
</div>

<div>
	<p>Location: ${park.state}</p>
	<p>Acreage: ${park.acreage}</p>
	<p>Elevation: ${park.elevationinfeet}</p>
	<p>Total trail length: ${park.milesoftrail}</p>
	<p>Number of campsites: ${park.numberofcampsites}</p>
	<p>Climate: ${park.climate}</p>
	<p>Year founded: ${park.yearfounded}</p>
	<p>Annual visitor count: ${park.annualvisitorcount}</p>
	<p>Park quote: ${park.inspirationalquote}</p>
	<p>Quote source: ${park.inspirationalquotesource}</p>
	<p>Park description: ${park.parkdescription}</p>
	<p>Entry fee: ${park.entryfee}</p>
	<p>Number of animal species: ${park.numberofanimalspecies}</p>
</div>

<div>
	<a href="parkDetail?parkcode=${park.parkcode}&celOrFar=C">C</a>
	<a href="parkDetail?parkcode=${park.parkcode}&celOrFar=F">F</a>
</div>

<div>
	<c:forEach var="day" items="${weather}">
		
		<div id="day${day.fivedayforecastvalue}">
		<c:url var = "weatherimage" value ="/img/weather/${day.forecast}.png"/>
		<c:if test="${day.forecast eq 'partly cloudy'}">
			<c:url var = "weatherimage" value ="/img/weather/partlyCloudy.png"/>
		</c:if>
		<img src="${weatherimage}" />
		<c:choose>
		<c:when test="${celOrFar eq 'C'}">
			<p>High: ${(5/9)*(day.high - 32)} deg C</p>
			<p>Low: ${(5/9)*(day.low - 32)} deg C</p>
		</c:when>
		<c:otherwise>
			<p>${day.high} deg F</p>
			<p>${day.low} deg F</p>
		</c:otherwise>
		</c:choose>
		</div>
			
	</c:forEach>
</div>


</body>
</html>