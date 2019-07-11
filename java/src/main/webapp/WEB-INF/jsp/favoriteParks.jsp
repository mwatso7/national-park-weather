<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>

<div>
${favoritepark}
<c:forEach var="park" items="${favoritepark}">
<c:url var = "image" value ="/img/parks/${park.parkcode}.jpg"/>
<div>
	<a href="parkDetail?parkcode=${park.parkcode}"><img src="${image}"/></a>
</div>

<p>${park.parkname} : ${park.numberOfSurveys}</p>

</c:forEach>
</div>

</body>
</html>