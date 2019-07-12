<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>
<main>
<h1>National Park Geek Favorite Park Winners!</h1>
<div>
<c:forEach var="park" items="${favoritepark}">
<c:url var = "image" value ="/img/parks/${park.parkcode}.jpg"/>
<div>
	<a href="parkDetail?parkcode=${park.parkcode}&celOrFar=${celOrFar}"><img src="${image}"/></a>
</div>

<p>${park.parkname} : ${park.numberOfSurveys}</p>

</c:forEach>
</div>
</main>
</body>
</html>