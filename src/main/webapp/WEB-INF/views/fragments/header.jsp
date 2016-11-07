<%@ page session="false"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Web ToxPi</title>



<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.min.js"></script> 
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/globalize/0.1.1/globalize.min.js"></script>

<link href="/database_project/scripts/external/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link rel="shortcut icon" href="/database_project/img/favicon.png" type="image/x-icon" sizes="64x64">
</head>

<spring:url value="/" var="urlHome" />

<spring:url value="/users" var="urlListUser" />
<spring:url value="/users/add" var="urlAddUser" />

<spring:url value="/projects" var="urlViewProject" />
<spring:url value="/projects/add" var="urlAddProject" />
<spring:url value="/projects/request" var="urlRequestProject" />

<spring:url value="/import" var="urlImport" />
<spring:url value="/export" var="urlExport" />

<spring:url value="/analysis/${projectId}" var="urlDisplayAnalysis" />
<spring:url value="/profile" var="urlProfile" />
<spring:url value="/contact" var="urlContact" />
<spring:url value="/approval" var="urlUserList" />
<spring:url value="/compoundSearch" var="compoundSearch" />





<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
		   <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
			<a class="navbar-brand" href="${urlHome}" style="padding: 5px;">
				<!--  <span class="glyphicon glyphicon-home" aria-hidden="true">-->
					<img src="/database_project/img/ctv_logo.png" alt="logo" height="40" width="150" style="display: inline-block; ">
				<!--</span>-->
			</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
			
				
			<li><a href="${urlHome}">Home</a></li>
			<li class="dropdown active">
              <a href="${urlViewProject}" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Project <span class="caret"></span></a>
              <ul class="dropdown-menu">
                
                <!-- <li><a href="${urlListProject}">View project</a></li> -->
                <li><a href="${urlViewProject}">View Project</a></li> 
                <li><a href="${urlAddProject}">Create Project</a></li> 
                <li><a href="${urlRequestProject}">Request project access</a></li>
              </ul>
            </li>	
				
				<li class="active"><a href="${urlImport}">Import</a></li>
				<li class="active"><a href="${urlExport}">Export</a></li>
				
				<li class="active"><a href="${urlDisplayAnalysis}">Analysis</a></li>
				
				<li class="active"><a href="${urlContact}"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Contact</a></li>	
				<li class="active"><a href="${urlUsers}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> My Page</a></li>			
				
			<sql:setDataSource var="snapshot" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/webtoxpi"
     user="postgres"  password="root"/>
 
	<sql:query dataSource="${snapshot}" var="result">
SELECT login FROM users WHERE login = '${user_id}';
</sql:query>

<c:set var="administrator" value="${result.rows[0].login}"/>
<!--<spring:url value="/approval" var="urlUserList" />-->

	

				<c:choose>
 				<c:when test="${administrator == 'admin'}">

   				<li class="active"><a href="${urlUserList}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Admin</a></li>
   				<li class="active"><a href="${compoundSearch}">Compound search</a></li>
 				</c:when>  
				</c:choose> <!-- end of if YES administrator --> 
				<!-- 
				<li class="not-active"><a id="proj">Selected project: ${currentProjectCode}</a></li> -->
				<li class="active"><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Sign out</a></li>	
			</ul>
		</div>
	</div>
</nav>

<jsp:include page="../fragments/alert.jsp" />