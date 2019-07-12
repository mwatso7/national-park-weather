<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:url value="/css/styleSheet.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">
<title>npgeek-header</title>
</head>

<body>
	<header>
		<c:url value="/" var="homePageHref" />
		<div id="logo">
			<a href="${homePageHref}"><img id="logoImg" src="img/logo.png"/></a>
		</div>
		<nav>
		<ul>
			<a href="${homePageHref}"><li>Home</li></a>
			<a href="survey"><li>Survey</li></a>
		</ul>	
		</nav>
	</header>