package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.NoteTaker;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SaveNoteServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			NoteTaker note=new NoteTaker(title, content, new Date());
			System.out.println(note.getId()+":"+note.getTitle());
			//Hibernate Save()
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tr= s.beginTransaction();
				s.save(note);
				tr.commit();
				s.close();
			
			response.setContentType("text/html");
			PrintWriter out =response.getWriter();
			out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
