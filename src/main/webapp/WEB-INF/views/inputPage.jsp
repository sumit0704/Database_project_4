<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Names</title>
	</head>
	<body>
	
		<p><c:out value="${lastInputedName}" /></p>
	
		<form name="names">
			<input type="text" name="name" placeholder="Please type in a name" />
			<input type="submit" />
		</form>
	</body>
</html>