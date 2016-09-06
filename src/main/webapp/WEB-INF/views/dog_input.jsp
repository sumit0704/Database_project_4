<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
Dog Name Please:<br></br>
Get Method
<form name="dogs" action="ServletDogNames"  method = "get">	<!-- need csrf token for post method -->
			<input type="text" name="dog_name" />
			<input type="submit" />
		</form>

=========================================
<br></br>Post test:<br></br>
CSRF Cookie Name: ${_csrf.parameterName} <br>
value = ${_csrf.token} <br><br>
<form name="dogs2" action="dog_test" method='post'>	<!-- need csrf token for post method -->
			<input type="text" name="dog_name" />
			<input	type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" />
			<button class="btn btn-primary" onclick="var data = {'orderid[]' : currentOrders , 'componentid[]' : currentComponents }; post('/database_project/export/byparams', data, 'GET', '${_csrf.parameterName}', '${_csrf.token}')" title="Export"><span class="glyphicon glyphicon-export"></span></button>
						
		</form>
<script>
   var token = $("meta[name='_csrf']").attr("content");
   var header = $("meta[name='_csrf_header']").attr("content");
</script>
</body>
</html>