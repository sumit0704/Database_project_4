<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="../fragments/header.jsp" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>2016 Publication</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/database_project/scripts/css/Publ2016.css" />

<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>



<br>
&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
2016 Publication 


	<br><br>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project" target = _blank>
		Back to Home Page</a>

	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
	<a href = "/database_project/Open/CrudeOil"
		target = _blank>
		Crude Oil Processing</a>



	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
	<a href = "http://pubs.rsc.org/en/content/articlelanding/2016/gc/c6gc01147k#!divAbstract"
		target = _blank>
		2016 Journal Paper</a>
<br><br><br><br><br>


Table 1 Chemical-biological data-based grouping of petroleum substances in ToxPi

<table style="width:80%">
  <tr>
    <th># </th>
    <th>Sample </th>
    <th>Category </th>
       <th>CAS </th>
       <th>ToxPi (biological)</th>
    <th>ToxPi (volatility) </th>
    <th>ToxPi (chem-biol)</th>
  </tr>
  <c:forEach var="i" begin="0" end="20">
<tr><td>${i + 1}</td><td><div class="dropdown">
  		<button class="dropbtn">${chemicals.get(i).getSample()}</button><div class="dropdown-content">
  			<a href="/database_project/Open/CrudeOil">Source</a>
    		<a href="Cells?Category=${chemicals.get(i).getCategory()}&Cells=Cardio">Cardiomyocytes</a>
    		<a href="Cells?Category=${chemicals.get(i).getCategory()}&Cells=Hepa">Hepatocytes</a>	
  		</div></div></td>
  	<td> ${chemicals.get(i).getCategory()} </td><td>${chemicals.get(i).getCas()},</td>	
  	<td>${chemicals.get(i).getToxpibio()},</td><td>${chemicals.get(i).getToxpichemo()}, </td>
  	<td>${chemicals.get(i).getToxpibiochemo()}</td></tr>
  	
  	
  	</c:forEach>


</table> 
<div class="cas64741-43-1" onmouseover="bigImg(this)" onmouseout="normalImg(this)" ></div>
SRGO for Straight Run Gas Oil. OGS for Other Gas Oil. VHGO for Vacuum & Hydrotreated Gas Oil. 
RAE for Residual Aromatic Extract. HFO for Heavy Fuel Oil. 
Here is <a href="/database_project/Open/CrudeOil">a crude oil processing diagram.</a>
	
<script>
function bigImg(x) {
	// alert(" : ) ");
	$(".cas64741-43-1").css("font-size","24px");
	$(".cas64741-43-1").css("background-color","#C4E1E1");
    //x.style.font-size = "16px";
    // x.style.width = "264px";
}

function normalImg(x) {
	$(".cas64741-43-1").css("font-size","20px");
	$(".cas64741-43-1").css("background-color","white");
    // x.style.width = "232px";
}
    

// alert("here");
$(".cas64741-43-1").hover(function(e) {
	// alert("here");
    $("#foo").css({
        left: e.pageX + 1,
        top: e.pageY + 1
        }).stop().show(100);},
 		// alert("here 2");}, 
     function() {$("#foo").hide(100);}
     );	// end of hover    
</script>




<br><br>




<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>