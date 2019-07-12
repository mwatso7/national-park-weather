<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>
<main>
	<h1>Welcome the National Park Geek Weather and Information Center!</h1>
	<c:forEach var="park" items="${parks}">
		<div id="parkHomeDisplay">
			<div id="parkHomeImage">
				<a href="parkDetail?parkcode=${park.parkcode}&celOrFar=${celOrFar}"><img id="logoImg" src="img/parks/${park.parkcode}.jpg"/></a>
			</div>
			
			<div id="parkHomeDescriptionDiv">
				<table>
					<tr>
						<th id="tableHeader">${park.parkname}</th>
					</tr>
						
					<tr>
						<td>${park.parkdescription}</td>
					</tr>
				</table>
			</div>
		</div>
	
	</c:forEach>
</main>	
</body>
</html>