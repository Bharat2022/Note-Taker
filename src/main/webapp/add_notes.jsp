<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="all_js_css.jsp" %>
    <title>Add Notes</title>
    
  </head>
  <body>
  	  	<div class="container-fluid p-0 m-0">
  			<%@include file="navbar.jsp" %>
  		</div>
  	<br>
  	<div class="container">
	    <h3 class="text-center">Please fill your note details</h3><br>
	    <form action="SaveNoteServlet" method="post">
			  <div class="mb-3">
			    <label for="title" class="form-label">Note Title</label>
			    <input required type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter here" name="title">
			  </div>
			  <div class="mb-3">
			    <label for="content" class="form-label">Note Description</label>
			    <textarea name="content" required id="content" placeholder="Enter your content" class="form-control" style="height: 270px"></textarea>
			  </div>
			  <div class="container text-center">
			  <button type="submit" class="btn btn-success">Submit</button>
			  </div>
		</form>
	</div>
  </body>
  </html>