<%@page import="com.entities.NoteTaker"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp" %>
<title>Update Notes</title>
</head>
<body>
	<div class="container-fluid p-0 m-0">
  			<%@include file="navbar.jsp" %>
  	</div><br>
  	<%
  		int noteId=Integer.parseInt(request.getParameter("note_id").trim());
		Session s= FactoryProvider.getFactory().openSession();
		NoteTaker note=	(NoteTaker)s.get(NoteTaker.class, noteId);
  	%>
  	<div class="container">
	    <h3 class="text-center">Update your note details</h3><br>
	    <form action="UpdateServlet" method="post">
	    	  <input value="<%= note.getId()%>" name="noteId" type="hidden">
			  <div class="mb-3">
			    <label for="title" class="form-label">Note Title</label>
			    <input required type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter here" name="title" value="<%=note.getTitle()%>">
			  </div>
			  <div class="mb-3">
			    <label for="content" class="form-label">Note Description</label>
			    <textarea name="content" required id="content" placeholder="Enter your content" class="form-control" style="height: 270px"><%=note.getContent() %></textarea>
			  </div>
			  <div class="container text-center">
			  <button type="submit" class="btn btn-success">Save</button>
			  </div>
		</form>
	</div>
</body>
</html>