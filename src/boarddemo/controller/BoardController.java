package boarddemo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boarddemo.action.ListAction;
import boarddemo.action.ViewAction;

@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);

	} // end doGet();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);

	} // end doPost();

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		// /webdemo/board/*
		System.out.println(uri);
		String path = "";
		String action = uri.substring(uri.lastIndexOf("/"));

		if (action.equals("/*")) {
			ListAction list = new ListAction();
			list.execute(req, resp);
			path = "/boardview/list.jsp";
		} else if (action.equals("/view.do")) {
			ViewAction view = new ViewAction();
			view.execute(req, resp);
			path = "/boardview/view.jsp";
		} else if (action.equals("/writeForm.do")) {

			path = "/boardview/writeform.jsp";
		}

		if (path != "") {
			RequestDispatcher dis = req.getRequestDispatcher(path);
			dis.forward(req, resp);
		}

	} // process()

} // end class
