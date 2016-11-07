<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../fragments/header.jsp" />


<link href="/database_project/scripts/external/select2/css/select2.css" rel="stylesheet" />
<script src="/database_project/scripts/external/select2/js/select2.js"></script>
<script src="/database_project/scripts/external/ckeditor/ckeditor.js"></script>

<body>

<div class="container">

	<c:choose>
		<c:when test="${projectForm['new']}">
			<h1>Create Project</h1>
		</c:when>
		<c:otherwise>
			<h1>Update Project</h1>
		</c:otherwise>
	</c:choose>
	<br />

	<spring:url value="/projects" var="projectActionUrl" />

	<form:form class="form-horizontal" method="post" modelAttribute="projectForm" action="${projectActionUrl}">

		<form:hidden path="id" />

		<spring:bind path="code">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Code</label>
				<div class="col-sm-5">
					<form:input path="code" type="text" class="form-control "
						id="code" placeholder="Project Code" />
					<form:errors path="code" class="control-label" />
				</div>
			</div>
		</spring:bind>

		<spring:bind path="name">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Project Name</label>
				<div class="col-sm-5">
					<form:input path="name" type="text" class="form-control "
						id="name" placeholder="Project Name" />
					<form:errors path="name" class="control-label" />
				</div>
			</div>
		</spring:bind>

		<spring:bind path="access">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Access Level</label>
				<div class="col-sm-5">
					<form:select path="access" class="form-control">
						<form:options items="${accessList}" itemLabel="value" itemValue="id"/>
					</form:select>
					<form:errors path="access" class="control-label" />
				</div>
				<div class="col-sm-5"></div>
			</div>
		</spring:bind>
		
		<spring:bind path="status">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Status</label>
				<div class="col-sm-5">
					<form:select path="status" class="form-control">
						<form:options items="${statusList}" itemLabel="value" itemValue="id" />
					</form:select>
					<form:errors path="status" class="control-label" />
				</div>
				<div class="col-sm-5"></div>
			</div>
		</spring:bind>

   		<spring:bind path="projecttypes">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Project Type</label>
				<div class="col-sm-5">
					<form:select path="projecttypes" class="form-control">
						<c:forEach items="${projectTypesCache}" var="pt">
			                <c:choose>
			                    <c:when test="${projecttypes.getId()==pt.id}">
			                        <option value="${pt.id}" selected="selected">${pt.name}</option>
			                    </c:when>
			                    <c:otherwise>
			                        <option value="${pt.id}">${pt.name}</option>
			                    </c:otherwise>
			                </c:choose>
						</c:forEach>
					</form:select>
				</div>
				<div class="col-sm-5"></div>
			</div>
		</spring:bind>

		<spring:bind path="notes">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Project Description</label>
				<div class="col-sm-5">
					<form:textarea path="notes" rows="5" class="form-control" id="ckeditornotes" placeholder="Description" />
					<form:errors path="notes" class="control-label" />
				</div>
			</div>
		</spring:bind>
		<script type="text/javascript">CKEDITOR.replace('ckeditornotes');</script>


 		<%-- <spring:bind path="projectmanagerses">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Project Managers</label>
				<div class="col-sm-5">
					<form:select multiple="true" path="projectmanagerses" class="form-control">
						<c:forEach items="${usersCache}" var="user">
			                <c:set var="isSelected" value="false" />
			                <c:forEach items="${projectForm.projectmanagerses}" var="pr">
			                    <c:if test="${pr.id eq user.id}">
			                        <c:set var="isSelected" value="true" />
			                    </c:if>
			                </c:forEach>
			                <c:choose>
			                    <c:when test="${isSelected}">
			                        <option value="${user.id}" selected="selected">${user.getFullName()}</option>
			                    </c:when>
			                    <c:otherwise>
			                        <option value="${user.id}">${user.getFullName()}</option>
			                    </c:otherwise>
			                </c:choose>
						</c:forEach>
					</form:select>
				</div>
				<div class="col-sm-5"></div>
			</div>
		</spring:bind>  --%>
		<c:choose>
					<c:when test="${projectForm['new']}">

		<spring:bind path="projectreviewerses">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Project Reviewers</label>
				<div class="col-sm-5">
					<form:select multiple="true" path="projectreviewerses" class="form-control">
						<c:forEach items="${usersCache}" var="user">
			                <c:set var="isSelected" value="false" />
			                <c:forEach items="${projectForm.projectreviewerses}" var="pr">
			                    <c:if test="${pr.getId()==user.id}">
			                        <c:set var="isSelected" value="true" />
			                    </c:if>
			                </c:forEach>
			                <c:choose>
			                    <c:when test="${isSelected}">
			                        <option value="${user.id}" selected="selected">${user.getFullName()}</option>
			                    </c:when>
			                    <c:otherwise>
			                        <option value="${user.id}">${user.getFullName()}</option>
			                    </c:otherwise>
			                </c:choose>
						</c:forEach>
					</form:select>
				</div>
				<div class="col-sm-5"></div>
			</div>
		</spring:bind>
		</c:when>
		</c:choose>
		
		<c:choose>
					<c:when test="${projectForm['new']}">
		<spring:bind path="projectmemberses">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Project Members</label>
				<div class="col-sm-5">
					<form:select multiple="true" path="projectmemberses" class="form-control">
						<c:forEach items="${usersCache}" var="user">
			                <c:set var="isSelected" value="false" />
			                <c:forEach items="${projectForm.projectmemberses}" var="pm">
			                    <c:if test="${pm.getId()==user.id}">
			                        <c:set var="isSelected" value="true" />
			                    </c:if>
			                </c:forEach>
			                <c:choose>
			                    <c:when test="${isSelected}">
			                        <option value="${user.id}" selected="selected">${user.getFullName()}</option>
			                    </c:when>
			                    <c:otherwise>
			                        <option value="${user.id}">${user.getFullName()}</option>
			                    </c:otherwise>
			                </c:choose>
						</c:forEach>
					</form:select>
				</div>
				<div class="col-sm-5"></div>
			</div>
		</spring:bind>
		</c:when>
		</c:choose>
		
		<c:choose>
					<c:when test="${projectForm['new']}">
					</c:when>
					<c:otherwise>
		<spring:bind path="fileupload">
			<div class="form-group ${status.error ? 'has-error' : ''}">
				<label class="col-sm-2 control-label">Uploaded Files</label>
				<div class="col-sm-5">
					<form:select multiple="true" path="fileupload" class="form-control">
						<%-- <c:forEach items="${fileListcache}" var="file">
			                <c:forEach items="${fileListcache.filename}" var="pm">
			                    
			                </c:forEach>
			                <c:choose>
			                    <c:when test="${isSelected}">
			                        <option value="${file.id}" selected="selected">${file.filename}</option>
			                    </c:when>
			                    <c:otherwise>
			                        <option value="${file.id}">${file.filename}</option>
			                    </c:otherwise>
			                </c:choose>
						</c:forEach> --%>
						<form:options items="${fileListcache}" var="fp"/>
					</form:select>
				</div>
				<div class="col-sm-5"></div>
			</div>
		</spring:bind>
		</c:otherwise>
		</c:choose>

		<script type="text/javascript">
			function select2function(selectObject, desc) {
				selectObject.select2({
							placeholder : "Search for a " + desc,
							multiple : true,
							minimumInputLength : 2
						});
			};

			/* select2function($("#projectmanagerses"), "managers"); */
			select2function($("#projectreviewerses"), "reviewers");
			select2function($("#projectmemberses"), "members");
			//select2function($("#fileupload"), "uploadedfiles");
		</script>

	<%
	String valueSelected = request.getParameter("fp");
	%>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<c:choose>
					<c:when test="${projectForm['new']}">
						<button type="submit" class="btn-lg btn-primary pull-right">Add</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn-lg btn-primary pull-right">Update Values</button>
						<spring:url value="/projects/deletefile/${project.id}/<%=valueSelected %>" var="deleteurl" />
						<button class="btn btn-danger" onclick="this.disabled=true;post('${deleteurl}')">Delete Files</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form:form>

</div>

</body>
<jsp:include page="../fragments/footer.jsp" />
</html>