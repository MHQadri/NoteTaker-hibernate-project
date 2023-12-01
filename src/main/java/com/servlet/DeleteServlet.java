package com.servlet;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todo.NoteTaker.dto.Note;

public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int noteId = Integer.parseInt(request.getParameter("note-id").trim());
			
			EntityManager entityManager=Persistence.createEntityManagerFactory("test").createEntityManager();
			EntityTransaction transaction=entityManager.getTransaction();
			
			Note note=entityManager.find(Note.class, noteId);
			transaction.begin();
			entityManager.remove(note);
			transaction.commit();
			entityManager.close();
			
			response.sendRedirect("all-notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
