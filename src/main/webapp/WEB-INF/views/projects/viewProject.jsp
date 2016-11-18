<%@ page session="false"%> 
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="../fragments/header.jsp" />
<head>
  <title>Request approval</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.min.js"></script> 
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/globalize/0.1.1/globalize.min.js"></script>
<script type="text/javascript" src="/database_project/scripts/js/projects.js"></script>
<link href="/database_project/scripts/external/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
  
  
  <style>
  
  .span12{
border:none;
background-color:silver;
margin-left: 5 px;
padding-left: 15 px;
margin-right: 20px;
 
}  
.spacer {
    margin-top: 40px; /* define margin as you see fit */
    
}

  .scrollDiv{
	max-height:800px;
    overflow-y:scroll;
    overflow-x:hidden;
    
}
::-webkit-scrollbar {
    width: 8px;
}
 
::-webkit-scrollbar-track {
    -webkit-box-shadow:none;
    border-radius: 0px;
    background-color:#aaa;
}
 
::-webkit-scrollbar-thumb {
    border-radius: 0px;
    -webkit-box-shadow: inset 1px 1px 6px #333; 
    background-color:#666;
}
  
  </style>
  
  <body>
  <spring:url value="/projects/requested" var="urlRequestedProject" />
  <div class="container">
  <button id="public" class="btn btn-primary" value="click" disabled="disabled">My projects</button>
    <button id="protected" class="btn btn-primary" value="click" style="margin-left: 10px">Shared projects</button>
</div>
<br>
<br>



<!-- <div class="container-fluid" id="projectResults"> -->

<div class="col-sm-12 col-md-12 col-lg-12" id="publicProjects" style="margin-top: 5 px">

<div class="container scrollDiv" id="searchable-container" style="margin-top: 10 px;width: 70%">

<div class="row well well-sm">
    	<div class="col-sm-2 col-md-2 col-lg-2"><b>Serial no</b></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"><b>Project code</b></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"><b>Project name</b></div>
    	<c:set var="user_id"  value="${user_id}"/>
       	
    </div>

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
String sql1 = "select a.code,a.name,b.role,b.project_id From projects a join projectusermapping b on a.project_id=b.project_id and b.user_id=? and b.role=1";
int countRequest=0;
try{
	pst1 = con1.prepareStatement(sql1);
	pst1.setLong(1,Long.valueOf(pageContext.getAttribute("user_id").toString()));
	rs1=pst1.executeQuery();
%>
<%
if (!rs1.isBeforeFirst() ) { 
	countRequest=0;
%>
<div class="row well well-sm">

<h2 style="margin-left:30% "><b>No data to display</b></h2>	
<input type="hidden" id="countRequest" value="<%=countRequest%>" />
</div>
<%
}
else{
	int count=0;

while( rs1.next() ){
	count++;
	
%>
	
    <div class="row well well-sm">
    	<div class="col-sm-2 col-md-2 col-lg-2"><%=count %></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"><a href="<%= request.getContextPath()%>/projects/<%=rs1.getInt("project_id")%>"><%=rs1.getString("code") %></a></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"><a href="<%= request.getContextPath()%>/projects/<%=rs1.getInt("project_id")%>"><%=rs1.getString("name") %></a></div>
       	
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

<div class="col-sm-12 col-md-12 col-lg-12" id="protectedProjects" style="display: none">
<div class="container scrollDiv" id="searchable-container" style="margin-top: 10 px;width: 70%">

<div class="row well well-sm">
    	<div class="col-sm-4 col-md-4 col-lg-4"><b>Project code</b></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"><b>Project name</b></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"><b>Role</b></div>
    	<c:set var="user_id"  value="${user_id}"/>
       	
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
con1 = java.sql.DriverManager.getConnection(url2, id2, pass2);

} catch(ClassNotFoundException cnfex){
cnfex.printStackTrace();

}
String sql2 = "select a.code,a.name,b.role,b.project_id From projects a join projectusermapping b on a.project_id=b.project_id and b.user_id=? and b.role in (2,3) and b.approved='Y'";
int countRequest1=0;
try{
	pst2 = con1.prepareStatement(sql2);
	pst2.setLong(1,Long.valueOf(pageContext.getAttribute("user_id").toString()));
	rs2=pst2.executeQuery();
%>
<%
if (!rs2.isBeforeFirst() ) { 
	countRequest1=0;
%>
<div class="row well well-sm">

<h2 style="margin-left:30% "><b>No data to display</b></h2>	
<input type="hidden" id="countRequest" value="<%=countRequest%>" />
</div>
<%
}
else{
	int count=0;
	String lRole="";
while( rs2.next() ){
	if(rs2.getInt("role")==1){
		lRole="Manager";
	}
	else if(rs2.getInt("role")==2){
		lRole="Reviewer";
	}
	else if(rs1.getInt("role")==3){
		lRole="Member";
	}
	count++;
%>

    <div class="row well well-sm">
    	<%-- <div class="col-sm-2 col-md-2 col-lg-2"><%=count %></div> --%>
    	<div class="col-sm-4 col-md-4 col-lg-4"><a href="<%= request.getContextPath()%>/projects/<%=rs2.getInt("project_id")%>"><%=rs2.getString("code") %></a></div>
    	<div class="col-sm-4 col-md-4 col-lg-4"><a href="<%= request.getContextPath()%>/projects/<%=rs2.getInt("project_id")%>"><%=rs2.getString("name") %></a></div>
       	<div class="col-sm-4 col-md-4 col-lg-4"><a href="<%= request.getContextPath()%>/projects/<%=rs2.getInt("project_id")%>"><%=lRole %></a></div>
    </div>
    

      <%
      countRequest1++;
}
%>
<input type="hidden" id="countRequest" value="<%=countRequest1%>"/>
<%

} 
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs2!=null) 
	rs2.close();
if(s2!=null) 
	s2.close();
if(con2!=null) 
	con2.close();
}

%>

</div>
</div>



  
	
</body>
<%-- <jsp:include page="../fragments/footer.jsp" /> --%>
</html>