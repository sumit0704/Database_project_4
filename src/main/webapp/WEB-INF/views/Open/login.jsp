<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
.error {
	padding: 1px;
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
</style>
<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,200' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/database_project/scripts/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/database_project/scripts/css/style.css" />
<link rel="stylesheet" type="text/scss" href="/database_project/scripts/css/style.scss" />
</head>
<body>

	<div align="right"><a href = "/database_project">
		<img src="/database_project/scripts/images/MB__home.png"/></a>&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;</div>



		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<c:url value="/login" var="loginUrl" />
		<form name='loginForm' action='${loginUrl}' method='POST'>
				<div class="form">
 				 <div class="forceColor"></div>
  					<div class="topbar">
    					<div class="spanColor"></div>
					 <input type="text" class="input" name="username" placeholder="Username or email"/>
   					 <input type="password" class="input" name="password" placeholder="Password"/>
  				</div>
  				<button type="submit" class="submit" >Login</button>
				</div>

		   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		   <!--  
		   <br><br><br>Name = "${_csrf.parameterName}"<br> Value = "${_csrf.token}" 
		   <br>LoginUrl = '${loginUrl}' --><br>
		</form>


</body>
</html>