package com.epayment.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeSevlet
 */
@WebServlet("/Home")
public class HomeSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("Dashboard"))
		{
			request.getRequestDispatcher("index.jsp").forward(request,response );
		}
		 else if(action.equalsIgnoreCase("msbteDashboard")) 
		 {
			request.getRequestDispatcher("msbteOption.jsp").forward(request,response );	
		 }
		 else if(action.equalsIgnoreCase("instituteDashboard")) 
		 {
			request.getRequestDispatcher("instituteOption.jsp").forward(request,response );	
		 }
		 else if(action.equalsIgnoreCase("studentDashboard")) 
		 {
			request.getRequestDispatcher("studentOption.jsp").forward(request,response );	
		 }
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
