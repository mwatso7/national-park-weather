<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>
<main>
<c:url var = "image" value ="/img/parks/${park.parkcode}.jpg"/>
<div>
	<h1>${park.parkname}</h1>
</div>
<div id="parkHomeDisplay">
	<span> <img src="${image}" />
	</span>
	<div id="parkHomeDescriptionDiv">
		<table>
			<tr>
				<th id="tableHeader">Park description:</th>
			</tr>

			<tr>
				<td>${park.parkdescription}</td>
			</tr>
				<td>&nbsp</td>
			</tr>
			<tr>
				<th id="tableHeader">Park quote:</th>
			</tr>

			<tr>
				<td>${park.inspirationalquote}</td>
			</tr>
			<tr>
				<td>&nbsp&nbsp&nbsp -- ${park.inspirationalquotesource}</td>
			</tr>
		</table>
	</div>
</div>
<div id="info">
	<div>
		<div class="bold">Location: </div>${park.state}</div>
	<div>
		<div class="bold">Acreage: </div>${park.acreage}</div>
	<div>
		<div class="bold">Elevation: </div>${park.elevationinfeet}</div>
	<div>
		<div class="bold">Total trail length: </div>${park.milesoftrail}</div>
	<div>
		<div class="bold">Number of campsites: </div>${park.numberofcampsites}</div>
	<div>
		<div class="bold">Climate: </div>${park.climate}</div>
	<div>
		<div class="bold">Year founded: </div>${park.yearfounded}</div>
	<div>
		<div class="bold">Annual visitor count: </div>${park.annualvisitorcount}</div>
	<div>
		<div class="bold">Entry fee: </div>${park.entryfee}</div>
	<div>
		<div class="bold">Number of animal species: </div>${park.numberofanimalspecies}</div>
</div>

<div id="weatherDisplay">

	<c:forEach var="day" items="${weather}">
		
		<div id="day${day.fivedayforecastvalue}">
			<c:if test="${day.fivedayforecastvalue eq 1}">
				<ul id="temp">
					<li id="far${celOrFar}"><a href="parkDetail?parkcode=${park.parkcode}&celOrFar=F">&nbspF&nbsp</a></li>
					<li id="cel${celOrFar}"><a href="parkDetail?parkcode=${park.parkcode}&celOrFar=C">&nbspC&nbsp</a></li>
				</ul>
			</c:if>
			<c:url var = "weatherimage" value ="/img/weather/${day.forecast}.png"/>
			<c:if test="${day.forecast eq 'partly cloudy'}">
				<c:url var = "weatherimage" value ="/img/weather/partlyCloudy.png"/>
			</c:if>
			
			<img id="weatherImg" src="${weatherimage}" />
			
			<c:choose>
			
				<c:when test="${celOrFar eq 'C'}">
					<p class="high">High: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${(5/9)*(day.high - 32)}"/>&degC</p>
					<p class="low">Low: <fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${(5/9)*(day.low - 32)}"/>&degC</p>
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

</main>
</body>
</html>