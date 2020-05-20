<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Save Customer</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css" />
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<h2>CRM - Customer Relationship Management</h2>
			</div>
		</div>
		
		<div id="container">
			<h3>save Customer</h3>
			
			<form:form action="saveCustomer" modelAttribute="customer" method="POST">
			
			<!-- associate this data with customer id by hidden form field -->
			<form:hidden path="id"/>
			
				<table>
					<tbody>
						<tr>
							<td><label>First Name: </label></td>
							<td><form:input path="firstName"/>
						</tr>
						
						<tr>
							<td><label>Last Name: </label></td>
							<td><form:input path="lastName"/>
						</tr>
						
						<tr>
							<td><label>Email: </label></td>
							<td><form:input path="email"/>
						</tr>
						
						<tr>
							<td><input type="submit" value="Save" class="save"/>
						</tr>
					</tbody>
				</table>
			</form:form>
			
			<div style="clear; both"></div><br>
			<a href="${pageContext.request.contextPath}/customer/list">Return to List</a>
			
		</div>
	</body>
</html>