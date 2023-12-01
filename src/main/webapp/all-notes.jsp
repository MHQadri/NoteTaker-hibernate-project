<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.todo.NoteTaker.dto.Note"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>

<jsp:include page="all_js_css.jsp"></jsp:include>
</head>
<body>

	<div class="container">
		<jsp:include page="navbar.jsp" />
		<br />
		<h1>All Notes :</h1>

		<div class="row">

			<div class="col-12">

				<%
				EntityManager entityManager = Persistence.createEntityManagerFactory("test").createEntityManager();
				EntityTransaction entityTransaction = entityManager.getTransaction();

				String displayQuery = "select n from Note n";
				List<Note> list = entityManager.createQuery(displayQuery, Note.class).getResultList();

				for (Note note : list) {
				%>
				<div class="card mt-3">
					<img src="img/notepad.png" style="max-width: 100px;"
						class="card-img-top m-3 mx-auto" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
							<%=note.getContent()%></p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note-id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit.jsp?note-id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
				}
				entityManager.close();
				%>

			</div>

		</div>


	</div>

</body>
</html>