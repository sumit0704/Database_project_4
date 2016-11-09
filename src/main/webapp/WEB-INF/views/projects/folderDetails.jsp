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
  <title>Folder details</title>
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
<script type="text/javascript">
document.getElementById("uploadBtn").onchange = function () {
    document.getElementById("uploadFile").value = this.value;
};
</script>  
</head>
<body background="">
<spring:url value="/requestedProject/files" var="urlFolderList" />
<spring:url value="/requestedProject/backToFolderView" var="backToFolderView" />

<ul class="pager">
    <li class="previous"><a href="${backToFolderView}">Back to Folder view</a></li>
    
  </ul>
<!-- <a href="${backToFolderView}">Back to Folder view</a> -->

<div class="container-fluid" id="userResults">


    <div class="col-sm-8 col-md-8 col-lg-8">
    <fieldset>
<legend>Your files</legend>
</fieldset>
   <div class="scrollDiv">
      <div class="row well span12 spacer"> 
    <div class="col-sm-8 col-md-8 col-lg-8">
    File name
    </div>
    
    
    
    <div class="col-sm-4 col-md-4 col-lg-4">
    Share
    </div>
   </div>
   
   <div class="row well span12 spacer"> 
    <div class="col-sm-8 col-md-8 col-lg-8">
    <a href="#" onclick="window.open('file.doc')">File 1</a>
    </div>
    
    <div class="col-sm-2 col-md-2 col-lg-2">
    
    <a href="#">Delete</a>
    </div>
    
    <div class="col-sm-2 col-md-2 col-lg-2">
    <a href="#">Share</a>
    </div>
   </div>
   
   </div> 
    
    </div>
   
    
    <div class="col-sm-4 col-md-4 col-lg-4">
      <fieldset>
<legend>Upload file</legend>
</fieldset>
      
      <button type="button" id="folderCreate" class="btn btn-primary" onClick="$('#myModal').modal()">Upload your file</button>
    </div>
   <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-md">
   <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> Upload file</h4>
        </div>
        <div class="modal-body">
          
			
<div class="fileUpload btn btn-primary">
    
    <input id="uploadBtn" type="file" class="upload btn btn-primary" />
</div>
<input type="submit" value="Upload" class="btn btn-primary"/>
		
        </div>
        <div class="modal-footer">
          
          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
          
        </div>
      </div>
      
    </div>
  </div>
  </div>


  
</body>

<jsp:include page="../fragments/footer.jsp" />
</html>