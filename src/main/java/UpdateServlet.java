
import java.io.IOException;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.todo.NoteTaker.dto.Note;


public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			EntityManager entityManager = Persistence.createEntityManagerFactory("test").createEntityManager();
			EntityTransaction entityTransaction = entityManager.getTransaction();
			Note note=entityManager.find(Note.class, noteId);
			entityTransaction.begin();
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			
			entityTransaction.commit();
			entityManager.close();
			
			response.sendRedirect("all-notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
