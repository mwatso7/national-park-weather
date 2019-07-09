<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>npgeek-header</title>
</head>

<body>
	<header>
	
		<c:url value="/" var="homePageHref" />
		
		<ul>
			<li ><a href="${homePageHref }"><img src="img/logo.png*****DELETETHIS*******"/></a></li>
			<li><a href="${homePageHref }">Home</a></li>
			<li><a href="survey">Survey</a></li>
		</ul>	
	
	</header>