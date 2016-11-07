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
  <title>Project Request</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.min.js"></script> 
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/globalize/0.1.1/globalize.min.js"></script>
<script type="text/javascript" src="/database_project/scripts/js/projects.js"></script>
<link href="/database_project/scripts/external/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
 
  
  <body>
  
  <div class="container">
  
  
  <div class="dropdown-project" id="dropdown1">
  <h4>Choose your project</h4><br>
  <select>
  <option value="project1">Project 1</option>
  <option value="project1">Project 1</option>
  <option value="project1">Project 1</option>
  <option value="project1">Project 1</option>
</select>
  </div>
  
  <div class="dropdown-project" id="dropdown1" style="margin-top: 5x">
  <h4>Choose your role</h4><br>
  <select>
  <option value="manager">Project Manager</option>
  <option value="member">Project Member</option>
  <option value="reviewer">Project Reviewer</option>
</select>
  </div>
  
  <!-- 
  <div class="dropdown" id="dropdown1">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Select project
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">HTML</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">CSS</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="#">JavaScript</a></li>
    </ul>
  </div>
  
  
   -->
  <button type="button" class="btn btn-default" style="margin-top: 5x">Submit</button>
  
</div>
  
  
	
</body>

<jsp:include page="../fragments/footer.jsp" />
</html>