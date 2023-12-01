<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<jsp:include page="all_js_css.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<jsp:include page="navbar.jsp" />
		<br />
		<h1>Please fill your note Detail</h1>
		<br />

		<!-- This add form -->
		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Note
					Title</label> <input type="text" class="form-control" id="title" name="title"
					aria-describedby="emailHelp" placeholder="Enter here" required>

			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea class="form-control" style="height: 300px" id="content" name="content"
					placeholder="Enter your content here" required></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>

		</form>
	</div>

</body>
</html>