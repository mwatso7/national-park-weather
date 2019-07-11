<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>

	<c:forEach var="park" items="${parks}">
		<div id="parkHomeDisplay">
			<div id="parkHomeImage">
				<a href="parkDetail?parkcode=${park.parkcode}&celOrFar=${celOrFar}"><img id="logoImg" src="img/parks/${park.parkcode}.jpg"/></a>
			</div>
			
			<div id="parkHomeDescriptionDiv">
				<table>
					<th>
						<tr>
							<td id="tableHeader">${park.parkname}</td>
						</tr>
					</th>
						
						<tr>
							<td>${park.parkdescription}</td>
						</tr>
				</table>
			</div>
		</div>
	
	</c:forEach>
	
</body>
</html>