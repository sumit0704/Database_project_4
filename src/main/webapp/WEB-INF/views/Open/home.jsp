<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<style>
.error {  
	padding: 14px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
<!--  The following style were moved from home page -->
#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}


#login-lines {
    color: maroon;
    margin-left: 40px;
	font-family:Arial;
	text-align: center;
	font-weight:bold;
	font-size: 16px;
}

#introduction {
    color: maroon;
    margin-left: 40px;
    margin-right: 40px;
	font-family:Arial;
	text-align: justify;
	font-weight:bold;
	font-size: 14px;
}


@font-face {
    font-family: 'socialfont';
    src: url('http://mediaashley.com/MyFont.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;

}

#first-frame {
  background: #ddd;
	/*width: 150%;*/
  margin: 30px;
}



select {
	width:330px;
  height:30px;
  /*display:inline-block;*/
  font-family:Arial, "Helvetica", sans-serif;
  font-size:16px;
  font-weight:bold;
  color:#fff;
  text-decoration:none;
  text-transform:uppercase;
  text-align:left;
  text-shadow:1px 1px 0px #07526e;

  margin-left:auto;
  margin-right:auto;
border: 2px;
border-style: inset;
border-color:#0000CC;
  position:relative;
  /*cursor:pointer;*/
  background: #109bce;
  background-image: linear-gradient(bottom, rgb(14,137,182) 0%, rgb(22,179,236) 100%);
}


	Deep_maroon{
font:normal 16pt Arial;
color:	#842B00;
font-weight:bold;
}

</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/database_project/scripts/external/font-awesome/css/font-awesome.min.css" />

</head>
<body>



<div id="first-frame">
<br>
<div align="right"><a href = "login" >Sign In</a> &nbsp; &nbsp; &nbsp;
	<a href = "Open/applicant" >Sign Up</a>  &nbsp; &nbsp; &nbsp;</div>
<br><br>


<h3 style= "font:normal 40pt Arial; 
	color:#FFFFFF; text-shadow: 0 1px 0 #ccc, 0 2px 0 #c9c9c9, 0 3px 0 #bbb,
		0 4px 0 #b9b9b9, 0 5px 0 #aaa, 
		0 6px 1px rgba(0,0,0,.1), 
		0 0 5px rgba(0,0,0,.1), 
		0 1px 3px rgba(0,0,0,.3),
		0 3px 5px rgba(0,0,0,.2), 0 5px 10px rgba(0,0,0,.25),
		0 10px 10px rgba(0,0,0,.2),
		0 20px 20px rgba(0,0,0,.15);
	text-align: center;
	">
	
	Category Approaches For Chemical Safety
</h3>


<div id="login-lines">


</div><br>
	<button id="password-submission1" style="
		/*margin:auto;*/
  		width:250px;
  		height:80px;
  		display:inline-block;
  		font-family:Arial;
  		font-size:16px;
  		font-weight:bold;
  		color:#FFFFFF;
  		text-decoration:none;
  		text-transform:uppercase;
  		text-align:center; /*center;*/
  		text-shadow:1px 1px 0px #07526e;
  		padding-top:15px;
  		
  		margin-left:auto;
  		margin-right:auto;
  		left:40%;
  		position:relative;
  		/*cursor:pointer;*/
  		border: none;
  		background: #109bce;
  		background-image: linear-gradient(bottom, rgb(14,137,182) 0%, rgb(22,179,236) 100%);
  		border-radius: 5px;
  		box-shadow: inset 0px 1px 0px #2ab7ec, 0px 5px 0px 0px #07526e, 0px 10px 5px #999;">
  
  This Website is <p> Under Construction</button>
	<br><br>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	
	<a href = "Open/Publ2016"
		target = _blank>
		2016 Publication</a>
<br><br>
	<div id="introduction">
		&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	This web site is part of the New Technologies to 
		Underpin Category Approaches and Read-across in Regulatory Programmes at Texas A&M University.
		One of the most challenging areas in regulatory toxicology is the assessment of UVCBs 
		(Unknown or Variable composition, Complex reaction products and Biological materials). 
		UVCBs present difficult problems for science-informed regulatory decisions. Regulators and 
		registrants have a common interest to understand how to evaluate UVCBs under current 
		chemical regulatory policy and ensure that there is not a large scale underestimation or 
		overestimation of hazard. This project tackles the challenge of UVCBs and will provide 
		regulators and registrants with a cost-effective integrative approach to solve the 
		challenges of UVCBs and will define the best practical strategies for the read-across and 
		grouping approaches. This web site is created and maintained by 
		Dr. Ivan Rusyn's Lab. For questions about this site, please contact 
		dliu(at) cvm(dot) tamu(dot) edu.
	</div>

<br><br><br><br>



</div><!-- End of div first-frame -->


</body>
</html>