<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />

<div class="container">
	<h1>Project Detail</h1>
	<br />

	<div class="row">
		<label class="col-sm-2">Code</label>
		<div class="col-sm-10">${project.code}</div>
	</div>
	
	<div class="row">
		<label class="col-sm-2">Name</label>
		<div class="col-sm-10">${project.name}</div>
	</div>
	
	
	<button data-toggle="tooltip" class="btn btn-primary" onclick="location.href='${editActionUrl}'" title="Edit" style="float: right;"><span class="glyphicon glyphicon-edit"></span> Edit</button>
	<spring:url value="/upload?projectId=${project.id}" var="importActionUrl" />
	<button data-toggle="tooltip" class="btn btn-primary" onclick="location.href='${viewtActionUrl}'" title="Upload Files" style="float: right;"><span class="glyphicon glyphicon-upload"></span> Upload Files</button>
</div>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>