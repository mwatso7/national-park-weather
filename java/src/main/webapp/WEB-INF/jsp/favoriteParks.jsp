<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>

<div>
<c:forEach var="park" items="${favoriteparks}">
<p>${park.parkname} : ${park.numberOfSurveys}</p>

</c:forEach>
</div>

</body>
</html>