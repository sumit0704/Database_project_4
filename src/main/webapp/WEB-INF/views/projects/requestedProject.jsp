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
<head>
  <title>Requested project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.min.js"></script> 
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/globalize/0.1.1/globalize.min.js"></script>
<script type="text/javascript" src="/database_project/scripts/js/projects.js"></script>
<link href="/database_project/scripts/external/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
 <link rel="stylesheet" type="text/css" href="/database_project/scripts/css/main.css">
  <style type="text/css">


.span12{
border:none;
background-color:silver;
margin-left: 5 px;
padding-left: 15 px;
margin-right: 20px;
 
}  
.spacer {
    margin-top: 40px; /* define margin as you see fit */
    
}
.scrollDiv{
	max-height:800px;
    overflow-y:scroll;
    overflow-x:hidden;
}
::-webkit-scrollbar {
    width: 8px;
}
 
::-webkit-scrollbar-track {
    -webkit-box-shadow:none;
    border-radius: 0px;
    background-color:#aaa;
}
 
::-webkit-scrollbar-thumb {
    border-radius: 0px;
    -webkit-box-shadow: inset 1px 1px 6px #333; 
    background-color:#666;
}


  </style>
  
</head>
<body background="">
<spring:url value="/requestedProject/files" var="urlFolderList" />
<spring:url value="/requestedProject/backToProject" var="backToProject" />

<ul class="pager">
    <li class="previous"><a href="${backToProject}">Back to Project view</a></li>
    
  </ul>


<div class="container-fluid" id="userResults">



    <div class="col-sm-6 col-md-6 col-lg-6" id="projectFiles">
    <fieldset>
<legend>Project folder</legend>
</fieldset>
   <div class="scrollDiv">
      
   <div class="row well span12 spacer"> 
    <div class="col-sm-8 col-md-8 col-lg-8">
    <a href="${urlFolderList}">Folder 1</a>
    </div>
    
    
    <div class="col-sm-4 col-md-4 col-lg-4">
    <a href="#">Share</a>
    </div>
   </div>
   
   </div> 
    
    </div>
   
    
    <div class="col-sm-6 col-md-6 col-lg-6" id="projectAccessRequests">
      
	<fieldset>
<legend>Project access requests</legend>
</fieldset>

<div class="scrollDiv">
      <div class="row well span12 spacer">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Last name</b></p>
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>First name</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Phone</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Approve/Reject</b></p>
      	</div>
      	
      </div>
  
</div>
      
    
      
  </div>
  
</div>
  
</body>

<jsp:include page="../fragments/footer.jsp" />
</html>