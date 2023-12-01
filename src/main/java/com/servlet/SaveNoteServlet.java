package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todo.NoteTaker.dto.Note;

public class SaveNoteServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Note note = new Note(title, content, new Date());

			// hibernate : save

			EntityManager entityManager = Persistence.createEntityManagerFactory("test")
					.createEntityManager();
			EntityTransaction entityTransaction = entityManager.getTransaction();
			
			entityTransaction.begin();
			entityManager.persist(note);
			entityTransaction.commit();
			
			response.setContentType("text/html");
			PrintWriter writer=response.getWriter();
			writer.print("<h1 style='text-align:center;'>Note is Added successfully</h1>");
			writer.print("<h1 style='text-align:center;'><a href='all-notes.jsp'> View all notes</a></h1>");
			
			entityManager.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
