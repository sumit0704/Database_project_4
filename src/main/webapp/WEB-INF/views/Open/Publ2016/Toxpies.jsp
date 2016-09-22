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

	<br></br>
&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project" target = _blank>Back Home Page</a>

	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "/database_project/Open/Publ2016" target = _blank>
		Publication 2016 Chemicals</a>



<% 
String Fig_name = (String)request.getAttribute("Fig_name"); 
String image = "";
String Title = "";


if( Fig_name.equals( "Bio" ) ){
	Title = "Bioactivity profiling and categorization of petroleum substanes";
	image = "/database_project/img/Toxpi-bio.jpg";}
else if( Fig_name.equals( "Chemo" ) ){
	Title = "Evaporation profiles";
	image = "/database_project/img/Toxpi-chemo.jpg";}

else if( Fig_name.equals( "BioChemo" ) ){
	Title = "Bioactivity and chemical data integeration and categorization of petroleum substanes";
	image = "/database_project/img/Toxpi-biochemo.jpg";}

else if( Fig_name.equals( "Gene-exp" ) ){
	Title = "Differencially Expressed Genes";
	image = "/database_project/img/Gene-exp.jpg";}
%>




<% 
String Legend = "";
if( Fig_name.equals( "Bio" ) ){
	Legend = "&nbsp;	&nbsp;	&nbsp;	&nbsp; Bioactivity profiling and categorization of petroleum " +
		"substances in ToxPi. Point-of-departure values derived from sixteen distinct assays or " +
		"assay parameters were integrated for quantitative bioactivity profiling of 21 petroleum " + 
		"substances in ToxPi (a). The plot reflects a global ranking of petroleum substances " +
		"according to their cumulative ToxPi score, i.e. each data point represents the sum of " +
		"individual assay scores shown in the respective bioactivity profiles. Potential " +
		"bioactivity-based correlations were analyzed using the hclust function in r (b). [VHGO = " +
		"vacuum & hydrotreated gas oils; SRGO = straight run gas oils; OGO = other gas oils; HFO = " +
		"heavy fuel oils; RAE = residual aromatic extracts].";	
}
else if( Fig_name.equals( "Chemo" ) ){
	Legend = "&nbsp;	&nbsp;	&nbsp;	&nbsp; Physico-chemical data-integrative grouping of " +
		"petroleum substances. Mass % evaporation data (in 50 °C increments) for Concawe samples " +
		"from four product groups (SRGO, OGO, VHGO, and RAE) were integrated in ToxPi to yield " +
		"evaporation profiles, as well as a chemical ranking according to their overall volatility, " +
		"i.e. mass % evaporation data derived ToxPi score (a). Potential correlations in the " +
		"originating data set were analyzed using the hclust function in r (b). Physico-chemical " +
		"data derived ToxPi scores were subsequently correlated with bioactivity data-derived ToxPi " +
		"scores (c). [VHGO = vacuum & hydrotreated gas oils; SRGO = straight run gas oils; OGO = " +
		"other gas oils; RAE = residual aromatic extracts].";		
}
else if( Fig_name.equals( "BioChemo" ) ){
	Legend = "&nbsp;	&nbsp;	&nbsp;	&nbsp; Chemical-biological data-integrative categorization " +
		"of petroleum substances. Combinatorial integration of physico-chemical and bioactivity " +
		"data for groupings of petroleum substances in ToxPi was achieved through parameter-specific " +
		"clustering of assay parameters (a). Four major and equally weighed (= 25%) data clusters " +
		"reflected eight cardiophysiology phenotypes, three cardiotoxicity and five hepatotoxicity " +
		"parameters, and two physico-chemical descriptors, i.e. initial and final boiling points. " +
		"Cluster analysis was performed using the hclust function in r (b). [VHGO = vacuum & " +
		"hydrotreated gas oils; SRGO = straight run gas oils; OGO = other gas oils; HFO = heavy " +
		"fuel oils; RAE = residual aromatic extracts].";		
}
else if( Fig_name.equals( "Gene-exp" ) ){
	Legend = "&nbsp;	&nbsp;	&nbsp;	&nbsp; Petroleum substances induce group-specific " +
		"differentially expressed genes. Targeted gene expression analysis using TempO-Seq, was" +
		"applied to determine petroleum substance and group-specific effects on hepatic gene " +
		"expression patterns. ma plots show the change in the average level of each transcript " +
		"of the s1500+ gene set for a representative straight-run gas oil (CON-02) and a heavy " +
		"fuel oil (A087/13) relative to the respective averages determined for dmso controls (a), " +
		"with differentially expressed genes (degs) highlighted in red. Although the specific " +
		"differentially	expressed genes varied among the different petroleum substances, the " +
		"overall treatment effect was found to be correlated (r2 = 0.49) (b). Data points in b " +
		"represent individual transcripts, and the different colors indicate if each gene is " +
		"common (pink) or unique (aqua, black) to CON-02 and A087/13. Principal components " +
		"analysis of global changes in gene expression revealed a clustering trend of petroleum " +
		"substances, with the heavy fuel oil separating significantly from the other chemicals (c). " +
		"[Deg = differentially expressed genes; ns = not significant; VHGO = vacuum & " +
		"hydrotreated gas oils; SRGO = straight run gas oils; HFO = heavy fuel oils].";		
}
%>
	<h2>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;
	<%=Title %> </h2>
	Image size: 
	<font color ="blue"><b id="small">Small</b>, <b id="medium">Medium</b>, <b id="large">Large</b>.<br></br>
	</font>
<script>
$(document).ready(function(){
    $("#small").hover(function(){$('#toxpi-image').height(200); });
    $("#medium").hover(function(){$('#toxpi-image').height(500); });
    $("#large").hover(function(){$('#toxpi-image').height(800); });
});
</script>	
	
&nbsp;	&nbsp;	&nbsp;&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
<img src = <%=image %> id="toxpi-image" style="height:200px"/>
<br></br>
<%=Legend %>
<br><br></br>
</body>
</html>