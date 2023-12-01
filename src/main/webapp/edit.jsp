<%@page import="com.todo.NoteTaker.dto.Note"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<jsp:include page="all_js_css.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />
		<h1>This is edit page</h1>
		
		<%
			int noteId=Integer.parseInt(request.getParameter("note-id").trim());
		
			EntityManager entityManager=Persistence.createEntityManagerFactory("test").createEntityManager();
			
			Note note=entityManager.find(Note.class, noteId);
			
			
			
		%>
		
		<!-- This edit form -->
		<form action="UpdateServlet" method="post">
		
		<input value="<%=note.getId()%>" name="noteId" type="hidden">
			<div class="mb-3">
				<label for="title" class="form-label">Note
					Title</label> <input type="text" class="form-control" id="title" name="title"
					aria-describedby="emailHelp" placeholder="Enter here" required value="<%= note.getTitle()%>">

			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea class="form-control" style="height: 300px" id="content" name="content"
					placeholder="Enter your content here" required><%= note.getContent()%></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>

		</form>
	</div>

</body>
</html>