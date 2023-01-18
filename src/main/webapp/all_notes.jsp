<%@page import="com.entities.NoteTaker"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp" %>
<title>Show Notes</title>
</head>
<body>
		<div class="container-fluid p-0 m-0">
  			<%@include file="navbar.jsp" %>
  		</div>
  		<br>
  		<div class="container text-center mt-2">
  		<h3 class="text-uppercase">All Notes</h3>
  		<div class="row">
  			<div class="col-12">
  			<%
  			Session s=FactoryProvider.getFactory().openSession();
  			Query qr=s.createQuery("from NoteTaker");
  			List<NoteTaker> ls= qr.list();
  			for(NoteTaker note:ls){
  			%>
  				<div class="card mt-3 ">
				  <img src="img/notes.png " style="max-width:80px;" class="card-img-top m-2 mx-auto" alt="Card Image">
				  <div class="card-body px-10">
				    <h5 class="card-title"><%=note.getTitle() %></h5>
				    <p class="card-text"><%=note.getContent() %></p>
				    <p class="card-text"><b><%=note.getAddedDate()%></b></p>
				    <div class="container text-center mt-2">
				    	<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
				   		<a href="editNotes.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
				    </div>
				  </div>
				</div>
  			<% }
  			s.close();
  			%>
  			</div>
  		</div>
  		</div>
  		
</body>
</html>