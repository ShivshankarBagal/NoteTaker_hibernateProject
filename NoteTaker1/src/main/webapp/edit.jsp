<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">

		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit page : edit your Note</h1>
		<%
		  
		 int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		
		
		Session s=FactoryProvider.getFactory().openSession();
		
		Note note=s.get(Note.class, noteId);
		
		
		
		%>
		<form action="UpdateServlet" method="post">
		
		<input value="<%=note.getId() %>" name="noteId" type=hidden />
  <div class="form-group">
    <label  for="title" >Note title</label>
    <input
    name="title"
     required 
     type="text"
     class="form-control" 
    id="title" 
    aria-describedby="emailHelp"
     placeholder="Enter title" 
    value='<%= note.getTitle() %>'
     />
    
  </div>
  <div class="form-group">
    <label for="content">Note content</label>
    <br>
    <textarea 
    name="content"
    required="required" id="content"
     placeholder="enter content"
      class="form-control"
      style="height: 300px"><%= note.getContent() %>
     </textarea>
  </div>
  
  <div class=" container text-center">
  <button type="submit" class="btn btn-success">Save changes</button></div>
</form>

	</div>
</body>
</html>