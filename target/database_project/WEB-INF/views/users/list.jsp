<%@ page session="false"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

<jsp:include page="../fragments/header.jsp" />

<body>
<<<<<<< HEAD
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







=======
<h5>Logged In User: ${user_id}</h5>
>>>>>>> branch 'master' of https://github.com/sumit0704/Database_project_4
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
					<td>User/<font color=blue>Change</font></td>
					<td>
						<spring:url value="/users/${user.id}" var="userUrl" />
						<spring:url value="/users/delete/${user.id}" var="deleteUrl" /> 
						<spring:url value="/users/update/${user.id}" var="updateUrl" />

						<button class="btn btn-info" onclick="location.href='${userUrl}'">Query</button>
						<button class="btn btn-primary" onclick="location.href='${updateUrl}'">Update</button>
						<button class="btn btn-danger" onclick="this.disabled=true;post('${deleteUrl}')">Delete</button></td>
				</tr>
				
			</c:forEach>
		</table>
<<<<<<< HEAD
Users[0].lastname: ${users[0].lastname}
=======
>>>>>>> branch 'master' of https://github.com/sumit0704/Database_project_4
	</div>
	
	
 </c:when>  
  <c:otherwise>
    Insufficient authorization to see this page.  
  </c:otherwise>
</c:choose> <!-- end of if YES administrator -->


<!-- Start of a new query. -->
<sql:update dataSource="${snapshot}" var="result2">
UPDATE users SET approved = 'Yes' WHERE login = 'admin';;
</sql:update>


<c:set var="administrator2" value="${result.rows[0].admin}"/>


<script type='text/javascript'>

$('#emf_selection').on('change', function() {
	emf_YN = $('#emf_selection').val();
   	alert('emf_YN = ' + emf_YN); 
});


</script>




<br>
	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>