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
display.jsp, Dog name is:　<br></br>
	dog_name: ${dog_name}<br></br>
	<%
		String display_dog_name = (String) request.getAttribute("send_dog_name");

		
		out.print(" " + display_dog_name);
		
	%>
	<h1>hello</h1>
	<c:out value='${dog_name}' />
	User_id: ${user_id}<br></br>


</body>
</html>