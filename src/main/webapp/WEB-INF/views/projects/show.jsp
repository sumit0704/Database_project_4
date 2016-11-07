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
	
	<spring:url value="/projects/update/${project.id}" var="updateUrl" />
	<button data-toggle="tooltip" class="btn btn-primary" onclick="location.href='${updateUrl}'" title="Edit" style="float: right;"><span class="glyphicon glyphicon-edit"></span> Edit</button>
	<spring:url value="/upload?projectId=${project.id}" var="importActionUrl" />
	<button data-toggle="tooltip" class="btn btn-primary" onclick="location.href='${importActionUrl}'" title="Upload Files" style="float: right;"><span class="glyphicon glyphicon-upload"></span> Upload Files</button>
	
</div>

<div class="container">
<div class="row">
		<label class="col-sm-2">==========================================================================================================================================</label>

	</div>
	<h3>Access Requests</h3>
	<br />

      <div class="scrollDiv">
      <div class="row well span12 spacer">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Name</b></p>
      	</div>
       <div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Request Date</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Grant Access</b></p>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Existing Access(R/W)</b></p>
      	</div>
      	<c:set var="project_id"  value="${project.id}"/>
      	<% 

java.sql.Connection con1;
java.sql.Statement s1;
java.sql.ResultSet rs1;
java.sql.PreparedStatement pst1;

con1=null;
s1=null;
pst1=null;
rs1=null;
String url1= 
"jdbc:postgresql://localhost:5432/webtoxpi";
String id1= "postgres";
String pass1 = "root";
try{
	

	Class.forName("org.postgresql.Driver").newInstance();
con1 = java.sql.DriverManager.getConnection(url1, id1, pass1);

} catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql1 = "select b.firstname,a.registereddt,a.project_id,concat(c.read,'/',c.write) as existing,a.is_Active  From projectusermapping a join users b on a.user_id=b.user_id   left join projectaccess c on a.project_id=c.project_id and a.user_id=c.user_id where  a.project_id=?" ;
int countRequest=0;
try{
pst1 = con1.prepareStatement(sql1);
pst1.setInt(1,Integer.parseInt(pageContext.getAttribute("project_id")+""));
rs1=pst1.executeQuery();
%>
<%
if (!rs1.isBeforeFirst() ) { 
	countRequest=0;
%>
<div class="row well span12">
<h2 style="margin-left:30% "><b>No data to display</b></h2>	
<input type="hidden" id="countRequest" value="<%=countRequest%>" />
</div>

<%
}
else{
	int count=0;
	String value="";
while( rs1.next() ){
	count++;
%>
  <div class="row well span12">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=rs1.getString("firstname") %>
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=rs1.getString("registereddt") %>
      	</div>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<spring:url value="/projects/view/${project.id}" var="viewaccessurl" />
   		<button class="btn btn-info" onclick="location.href='${viewaccessurl}'">View</button>
   		<spring:url value="/projects/updateaccess/${project.id}" var="updateaccess" />
		<button class="btn btn-primary" onclick="location.href='${updateaccess}'">Update</button>
		<spring:url value="/projects/revokeaccess/${project.id}" var="revokeaccess" />
		<button class="btn btn-danger" onclick="location.href='${revokeaccess}'">Revoke</button>
      	</div>
      	<% if (rs1.getString("is_Active")=="N") {
      		value="Access Revoked";
      	}
      	%>
      	
      	<% 
      	 if (rs1.getString("is_Active")=="Y"){
      		value=rs1.getString("is_Active");
      	}
      	%>
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=value %>
      	
      	</div>
      	</div>
      	
      <%
      countRequest++;
}
%>
<input type="hidden" id="countRequest" value="<%=countRequest%>"/>
<%

} 
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs1!=null) 
	rs1.close();
if(s1!=null) 
	s1.close();
if(con1!=null) 
	con1.close();
}

%>
      	
      </div>
	
	 </div>
</div>
<div class="container">
<div class="row">
		<label class="col-sm-2">==========================================================================================================================================</label>

	</div>
	<h3>Files</h3>
	<div class="scrollDiv">
      <div class="row well span12 spacer">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>File Name</b></p>
      	</div>
       <div class = "col-sm-3 col-md-3 col-lg-3">
      	<p style="color:blue;"><b>Upload Date</b></p>
      	</div>
      
      	</div>
      	<% 

java.sql.Connection con2;
java.sql.Statement s2;
java.sql.ResultSet rs2;
java.sql.PreparedStatement pst2;

con2=null;
s2=null;
pst2=null;
rs2=null;
String url2= 
"jdbc:postgresql://localhost:5432/webtoxpi";
String id2= "postgres";
String pass2 = "root";
try{
	

	Class.forName("org.postgresql.Driver").newInstance();
con2 = java.sql.DriverManager.getConnection(url2, id2, pass2);

} catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql2 = "select filename,filelocation,project_id,registereddt from fileupload where project_id=?";
int countRequest1=0;
try{
pst2 = con2.prepareStatement(sql2);
pst2.setInt(1, Integer.parseInt(pageContext.getAttribute("project_id").toString()));
rs2 = pst2.executeQuery();
%>
<%
if (!rs2.isBeforeFirst() ) { 
	countRequest1=0;
%>
<div class="row well span12">
<h2 style="margin-left:30% "><b>No data to display</b></h2>	
<input type="hidden" id="countRequest1" value="<%=countRequest1%>" />
</div>

<%
}
else{
	int count=0;
	String value="";
while( rs2.next() ){
	count++;
%>
  <div class="row well span12">
      	<div class = "col-sm-3 col-md-3 col-lg-3">
      <a href="file:///D:/apache-tomcat-8.0.37-windows-x86 (1)/apache-tomcat-8.0.37/tmpFiles/<%= rs2.getString("project_id")%>/<%= rs2.getString("filename")%>" download ><%=rs2.getString("filename") %></a>	
      	</div>
      <div class = "col-sm-3 col-md-3 col-lg-3">
      	<%=rs2.getString("registereddt") %>
      	</div>
      	</div>
      <%
      countRequest1++;
}
%>
<input type="hidden" id="countRequest1" value="<%=countRequest1%>"/>
<%

} 
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs2!=null) 
	rs2.close();
if(s2!=null) 
	s2.close();
if(con1!=null) 
	con2.close();
}

%>
	

</div>
</div>

<jsp:include page="../fragments/footer.jsp" />

</body>
</html>