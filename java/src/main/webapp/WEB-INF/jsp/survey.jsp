<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp">
<c:param name="pageTitle" value="ParkHomePage" />
</c:import>
<h1>National Parks Survey Form</h1>
<h2>Vote for your favorite park!</h2>
<c:url var="formAction" value="/survey"/>
<form:form method ="POST" action="${formAction}" modelAttribute="survey">
		
		<table id="surv"><tr>
		<td>
		<label for="favoritePark">Choose a Park</label>
		</td><td>
			<select name ="parkcode" id="parkcode">
				<c:forEach var="park" items="${parks}">
					<option value="${park.parkcode}">${park.parkname}</option>
				</c:forEach>
			</select>
		</td>
		</tr><tr>
		<td>
			 <label for="emailaddress">Enter Your email Address</label>
		</td><td>
		 	 <form:input path="emailaddress"/>
		 	 <form:errors path="emailaddress" id="er" cssClass="error"/>
		</td>
		</tr><tr>
		<td>
			<label for="state">Choose a state</label>
		</td><td>
				<select name="state">
					<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
					<option value="AZ">Arizona</option>
					<option value="AR">Arkansas</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DE">Delaware</option>
					<option value="DC">District Of Columbia</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="IA">Iowa</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="ME">Maine</option>
					<option value="MD">Maryland</option>
					<option value="MA">Massachusetts</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MS">Mississippi</option>
					<option value="MO">Missouri</option>
					<option value="MT">Montana</option>
					<option value="NE">Nebraska</option>
					<option value="NV">Nevada</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NY">New York</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VT">Vermont</option>
					<option value="VA">Virginia</option>
					<option value="WA">Washington</option>
					<option value="WV">West Virginia</option>
					<option value="WI">Wisconsin</option>
					<option value="WY">Wyoming</option>
					<option value="na">Other</option>
				</select>
		</td>
		</tr><tr>
		<td>
			 <label for="activitylevel">Select an Activity Level</label>
		</td><td>
			 	<input type="radio" name="activitylevel" id="activitylevel" value="Extreme!!!" checked/> Extreme!!!
		 	 	<input type="radio" name="activitylevel" id="activitylevel" value="High"/> High
		 	 	<input type="radio" name="activitylevel" id="activitylevel" value="Medium"/> Medium
		 	 	<input type="radio" name="activitylevel" id="activitylevel" value="Low"/> Low
		</td>
		</tr><tr><td></td><td>
		 <input class="button" type="submit" value="Submit">
		 </td>
		</tr></table>

</form:form>
</body>
</html>