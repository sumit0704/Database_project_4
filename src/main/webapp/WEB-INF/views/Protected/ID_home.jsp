<%@ page import="edu.tamu.ctv.controller.ID_HomeController"%>
<%@ page session="false"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/header.jsp" />
<link rel="stylesheet" type="text/css" href="/database_project/scripts/external/font-awesome/css/font-awesome.min.css" />


<body>
<!--  
<sql:setDataSource var="snapshot" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/webtoxpi"
     user="postgres"  password="root"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT login FROM users WHERE login = '${user_id}';
</sql:query>

<c:set var="administrator" value="${result.rows[0].login}"/>
<spring:url value="/users" var="urlListUser" />

value= "${result.rows[0].login}"

<c:choose>
  <c:when test="${administrator == 'admin'}">

   <p><a href="${urlListUser}">List Users and Applicants</a><p>
 </c:when>  
</c:choose> <!-- end of if YES administrator --> 

<spring:url value="/profile" var="urlProfile" />
<spring:url value="/import" var="urlImport" />
<spring:url value="/export" var="urlExport" />
<spring:url value="/analysis/${projectId}" var="urlDisplayAnalysis" />

    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <div class = "col-sm-6 col-md-6 col-lg-6">
      	<button type="submit" class="btn btn-primary">Create a project</button>
      	</div>
      	<div class = "col-sm-6 col-md-6 col-lg-6">
      	<button type="submit" class="btn btn-danger">View a project</button>
      	</div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <img class="img-responsive" src="/database_project/scripts/images/test.png" alt="">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Services</h2>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-user fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>My Page</h4>
                        <p>Information about your projects.</p>
                        <a href="${urlProfile}" class="btn btn-primary">GoTo</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-download fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Import</h4>
                        <p>Import data from csv file.</p>
                        <a href="${urlImport}" class="btn btn-primary">Goto</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-upload fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Export</h4>
                        <p>Export data to csv file.</p>
                        <a href="${urlExport}" class="btn btn-primary">GoTo</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-bar-chart fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>Analysis</h4>
                        <p>Analysis all data in current project.</p>
                        <a href="${urlDisplayAnalysis}" class="btn btn-primary">GoTo</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

<br>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>