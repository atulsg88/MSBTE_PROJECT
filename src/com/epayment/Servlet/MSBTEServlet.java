package com.epayment.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.MSBTEBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Controller.Controller;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/MSBTE")
public class MSBTEServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MSBTEServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
       String action=request.getParameter("action");
		HttpSession session = request.getSession(true);
		
		 if(action.equalsIgnoreCase("msbteregistration"))
		 {
			request.getRequestDispatcher("msbte_register.jsp").forward(request,response );
		 }
		 else if(action.equalsIgnoreCase("msbList"))
			{
			    List<MSBTEBean> msbList=new ArrayList();
			    Controller cntrl =new Controller();
			    msbList =cntrl.msbList();
				request.setAttribute("msbList", msbList);
				request.getRequestDispatcher("listmsbte.jsp").forward(request, response);
				
			}
		 else if(action.equalsIgnoreCase("editMsbte"))
		 { 
			MSBTEBean ab=new MSBTEBean(); 
			String msbte_id = request.getParameter("msbte_id");
		    Controller cntrl=new Controller(); 
		    ab=cntrl.editMsbte(msbte_id);
		    List<MSBTEBean> msbList=new ArrayList();
		    msbList =cntrl.msbList();
			request.setAttribute("msbList", msbList);
		    request.setAttribute("ab", ab);
		    request.getRequestDispatcher("msbte_register.jsp").forward(request,response); 
		 }
		 else if(action.equalsIgnoreCase("MSBTEProfile")) 
			{
				MSBTEBean ab=new MSBTEBean(); 
			    int msbte_id= (int)session.getAttribute("msbte_id"); 
			    Controller cntrl=new Controller(); 
			    ab=cntrl.MSBTEProfile(msbte_id);
			    List<MSBTEBean> msbList=new ArrayList();
			    msbList =cntrl.msbList();
				request.setAttribute("msbList", msbList);
			    request.setAttribute("ab", ab);
			    request.getRequestDispatcher("msbte_Profile.jsp").forward(request,response); 
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String action=request.getParameter("action");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String username=request.getParameter("username");
		String password =request.getParameter("password");
		
		MSBTEBean msb=new MSBTEBean();
		msb.setName(name);
		msb.setEmail(email);
		msb.setUsername(username);
		msb.setPassword(password);
	    

		if (action.equalsIgnoreCase("savemsbte")) {
		if (request.getParameter("msbte_id") == "") 
		{
			Controller cntrl = new Controller();
			cntrl.saveMsbte(msb);
			response.sendRedirect("login?action=msbteLogin");
		} 
		else 
		{
			String msbte_id = request.getParameter("msbte_id");
			msb.setMsbte_id(Integer.parseInt(msbte_id));
			Controller cntrl = new Controller();
			cntrl.updateMsbte(msb);
			response.sendRedirect("MSBTE?action=msbList");
		   
		}	
	}
	   if (action.equalsIgnoreCase("resetPassword")) {
			int msbte_id=Integer.parseInt(request.getParameter("msbte_id"));
			String new_password =request.getParameter("new_password");
			msb.setMsbte_id(msbte_id);
			msb.setPassword(new_password);
			Controller cntrl = new Controller();
			cntrl.resetPassword(msb);
			response.sendRedirect("login?action=msbteLogin"); 
		}
		
		
	}
}

