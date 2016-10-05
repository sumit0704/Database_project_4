<%@ page session="false"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">


<jsp:include page="../fragments/header.jsp" />

<body>
<sql:setDataSource var="snapshot" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/webtoxpi"
     user="postgres"  password="postgres"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT admin FROM users WHERE login = '${user_id}';
</sql:query>


<c:set var="administrator" value="${result.rows[0].admin}"/>
<c:choose>
  <c:when test="${administrator == 'YES'}">
User_id: ${user_id}







	<div class="container">

		<h1>All Users</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#ID</th>
					<th>Name</th>
					<th>lastName</th>
					<th>Email</th>
					<th>Approved<br>Change</th>
				</tr>
			</thead>

			<c:forEach var="user" items="${users}">
				<tr>
					<td>
						${user.id}
					</td>
					<td>${user.firstname}</td>
					<td>${user.lastname}</td>
					<td>${user.email}</td>
					<td>
						<spring:url value="/users/${user.id}" var="userUrl" />
						<spring:url value="/users/delete/${user.id}" var="deleteUrl" /> 
						<spring:url value="/users/update/${user.id}" var="updateUrl" />

						<button class="btn btn-info" onclick="location.href='${userUrl}'">Query</button>
						<button class="btn btn-primary" onclick="location.href='${updateUrl}'">Update</button>
						<button class="btn btn-danger" onclick="this.disabled=true;post('${deleteUrl}')">Delete</button></td>
				</tr>
				Phone: ${user.phone}
			</c:forEach>
		</table>
Users[0].lastname: ${users[0].lastname}
	</div>
	
	
 </c:when>  
  <c:otherwise>
    Insufficient authorization to see this page.  
  </c:otherwise>
</c:choose> <!-- end of if YES administrator -->
<br>
	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>