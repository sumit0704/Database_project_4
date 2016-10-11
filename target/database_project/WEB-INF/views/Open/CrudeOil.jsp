<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<br><br>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project" target = _blank>
		Back to Home Page</a>

	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project/Open/Publ2016" target = _blank>
		Publication 2016 Chemicals</a>



	<h2>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
Crude Oil Processing</h2>
<br></br>
	Image size: 
	<font color ="blue"><b id="small">Small</b>, <b id="medium">Medium</b>, <b id="large">Large</b>.<br></br>
	</font>
<script>
$(document).ready(function(){
    $("#small").hover(function(){$('#CrudeOil-image').height(200); });
    $("#medium").hover(function(){$('#CrudeOil-image').height(500); });
    $("#large").hover(function(){$('#CrudeOil-image').height(800); });
});
</script>	
<img src="/database_project/img/Crude-Oil.jpg" alt="Crude Oil processing" id = "CrudeOil-image" 
	height="240"><br></br>
&nbsp;	&nbsp;	&nbsp;	&nbsp;	Selection of petroleum substances for bioactivity profiling. Petroleum substances for bioactivity profiling comprised a total of 21 petroleum
substances from five product classes, five straight run gas oils (SRGO), nine vacuum & hydrotreated gas oils (VHGO), two other gas oils (OGO), three
heavy fuel oils (HFO), and two residual aromatic extracts (RAE).
..
</body>
</html>