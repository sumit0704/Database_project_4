<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<style>
.error {
	padding: 15px;
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
<body onload='document.loginForm.username.focus();'>

<div id = Container-login-page align="center">
	<br><br><br><br>
	<h1>Category Approaches For Chemical Safety</h1>

	<div id="login-box">

		<h2>Login with Username and Password</h2>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<c:url value="/login" var="loginUrl" />
		<form name='loginForm' action='${loginUrl}' method='POST'>

		    <table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='password' /></td>
			</tr>
			<tr>
		        <td colspan='2'>
		        	<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	                <input name="submit" type="submit" value="submit" />
	            </td>
			</tr>
		   </table>

		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		   <br><br><br>Name = "${_csrf.parameterName}"<br> Value = "${_csrf.token}" 
		   <br>LoginUrl = '${loginUrl}' <br>
		</form>
	</div>
	</div> <!-- end of container-login-page -->

</body>
</html>