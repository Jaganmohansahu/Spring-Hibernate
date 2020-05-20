<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Customers</title>
<!-- reference to style sheet -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Management</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
		
		<!-- button to add new customer -->
		<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd'; return false;" class="add-button"/>
		
		 <!--  add a search box -->
            <form:form action="search" method="POST">
                Search customer: <input type="text" name="theSearchName" />       
                <input type="submit" value="Search" class="add-button" />
            </form:form>
            
			<!--  HTML Table -->
			<table>
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<!-- loop over and print all the customers -->
				<c:forEach var="tempCustomer" items="${customers}">
				
				<!-- create an update link for customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				</c:url>
				
				<!-- create an delete link for customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}"></c:param>
				</c:url>
						<tr>
							<td> ${tempCustomer.firstName} </td><!-- tempCustomer.getFirstName() -->
							<td> ${tempCustomer.lastName} </td>
							<td> ${tempCustomer.email} </td>
							<!-- display update link -->
							<td> 
							<nobr><a href="${updateLink}">Update</a>
								|
								<a href="${deleteLink}" id="delete">Delete</a></nobr>
								<script type="text/javascript">
								$('#delete').on('click',function(e){
								    var answer=confirm('Do you want to delete?');
								    if(answer){
								     alert('Deleted');
								    }
								    else{
								     e.preventDefault();      
								    }
								});
								</script>
							</td>
						</tr>
					
				</c:forEach>
			</table>
		</div>
	</div>
	
</body>
</html>