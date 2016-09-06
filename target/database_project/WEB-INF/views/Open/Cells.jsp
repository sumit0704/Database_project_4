<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>

<style>


#img {
    background-image: url(/database_project/img/Cells.jpg);
    background-repeat: no-repeat;
    background-position: -100px -150px; /* Visible coordinates in image */
    height: 450px; /* Visible height */
    width: 600px; /* Visible width */
    display: inline-block; 
}

</style>





</head>
<body>
	<br><br>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project" target = _blank>
		Back to Home Page</a>

	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project/Open/Publ2016" target = _blank>
		Publication 2016 Chemicals</a>



	<h2>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
Cells</h2>
<br></br>
&nbsp;	&nbsp;	&nbsp;&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	<div id="img"></div>
<br></br>
Cardiomyocytes were treated with the chemicals listed above, and the intensity of the 
fluorescence was video recorded. The beats per minute were read from the fluorescent intensity variation.
<br>${Cells}</br>
${Sample}<br />
<%! int day = 3; %> 
<% if (day == 1 | day == 7) { %>
      <p> Today is weekend</p>
<% } else { %>
      <p> Today is not weekend</p>
<% } %>
</body>
</html>