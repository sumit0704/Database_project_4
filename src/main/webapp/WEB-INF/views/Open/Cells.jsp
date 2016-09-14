<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>

<% 
String Category = (String)request.getAttribute("Category"); 
String Cells = (String)request.getAttribute("Cells"); 
String x = "";
String y = "";
String h = "";

if( Cells.equals( "Cardio" ) )
	x = "-100px";
else if( Cells.equals( "Hepa" ) )
	x = "-720px";


if(Category.equals( "SRGO" ))
    	y = "-150px";
else if(Category.equals( "VHGO" ))
    	y = "-620px";
else if(Category.equals( "OGO" ))
	y = "-1180px";
else if(Category.equals( "HFO" ))
	y = "-1650px";
else if(Category.equals( "RAE" ))
	y = "-2115px";

if(Category.equals( "VHGO" ))
	h = "570px";
else h = "450px";
%>
<%--
else if( mOption.equals( "FP" ) )
{
           if(muser_id != pt1.getCollected_By())
             mFlag = 1;
}
else if( mOption.equals( "CUSTOMER" ) )
{
           if(mCustomer != pt1.getCustomer_Id())
               mFlag = 1;
}
--%>

<style>


#img {
    background-image: url(/database_project/img/Cells.jpg);
    background-repeat: no-repeat;
    background-position: <%= x %> <%= y %>; /* Start of Visible coordinates in image */
    height: <%= h %>; /* Visible height */
    width: 600px; /* Visible width */
    display: inline-block; 
}

</style>

</head>
<body>

	<br></br>
&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project" target = _blank>Back Home Page</a>

	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project/Open/Publ2016" target = _blank>
		Publication 2016 Chemicals</a>



	<h2>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
<% 
String methods = "";
if( Cells.equals( "Cardio" ) ){
	out.print("Cardiomyocytes");
	methods = "&nbsp;	&nbsp;	&nbsp;	&nbsp;iCell cardiomyocytes, which are induced pluripotent " +
		"stem cells, were treated with " +
		"the petroleum substances listed above and the intensity of the fluorescence was video " +
		"recorded.  The beats per minute (BPM) were read from the fluorescent intensity variation. "+
		"DMSO was the solvent, The final concentrationof DMSO in assay wells following addition of " +
		"test substances was 1% (v/v), an amount of DMSO consistent with previous reports "+
		"which by itself had no effect on cardiomyocyte- or hepatocyte-derived phenotypes. " + 
		"Data points represent means of duplicate determinations (n = 2)";	
}
else if( Cells.equals( "Hepa" ) ){
	out.print("Hepatocytes");
    methods = "&nbsp;	&nbsp;	&nbsp;	&nbsp;iCell hepatocytes, which are induced pluripotent stem " + 
		"cells,  were treated with the " +
		"petroleum substances listed above, and the cell viability was recorded. For more detail " + 
    	"please check the publication. DMSO was the solvent, The final concentrationof DMSO in assay " + 
		"wells following addition of test substances was 1% (v/v), an amount of DMSO consistent with " + 
    	"previous reports which by itself had no effect on cardiomyocyte- or hepatocyte-derived " +
		"phenotypes. Data points represent means of duplicate determinations (n = 2)";		
}
%>
</h2>
&nbsp;	&nbsp;	&nbsp;&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	<div id="img"></div>
<br></br>
<%=methods %>
<br><br></br>
</body>
</html>