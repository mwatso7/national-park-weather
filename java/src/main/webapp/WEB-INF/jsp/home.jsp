<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>

<c:forEach var="park" items="${parks}">
	
	<p>${park.parkname}</p>
	<p><a href="parkDetail?parkcode=${park.parkcode}"><img src="img/parks/${park.parkcode}.jpg"/></a></p>
	<p>${park.parkdescription}</p>
	
	</c:forEach>
</body>
</html>