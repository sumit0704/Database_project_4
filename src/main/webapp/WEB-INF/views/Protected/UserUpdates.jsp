<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<!-- This jsp file accepts user update requests, updates the users table, and send back the results. -->
<html lang="en">
<jsp:include page="../fragments/header.jsp" />
<link rel="stylesheet" type="text/css" href="/database_project/scripts/external/font-awesome/css/font-awesome.min.css" />


<body>

<spring:url value="/profile" var="urlProfile" />
<spring:url value="/import" var="urlImport" />
<spring:url value="/export" var="urlExport" />
<spring:url value="/analysis/${projectId}" var="urlDisplayAnalysis" />


    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Welcome</h1>
            </div>
        </div>




        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Services<br>
                <spring:url value="/" var="urlHome" />

<spring:url value="/users" var="urlListUser" />

                <a href="${urlListUser}">List Users and Applicants</a>
        </div>
    </div>
<jsp:include page="../fragments/footer.jsp" />

</body>
</html>