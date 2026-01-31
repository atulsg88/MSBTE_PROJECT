package com.epayment.Servlet;

import java.io.IOException;

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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 String action=request.getParameter("action");
		
		 if(action.equalsIgnoreCase("msbteLogin")) 
		 {
			request.getRequestDispatcher("msbte_login.jsp").forward(request,response );
		 }
		 else if(action.equalsIgnoreCase("instituteLogin")) 
	     {
			request.getRequestDispatcher("institute_login.jsp").forward(request,response );
		 }
		 else if(action.equalsIgnoreCase("studentLogin")) 
		 {
			request.getRequestDispatcher("student_login.jsp").forward(request,response );	
		 }
		 else if(action.equalsIgnoreCase("msbteLogout")) 
		 {
			request.getRequestDispatcher("msbte_login.jsp").forward(request,response );
		 }
		 else if(action.equalsIgnoreCase("instituteLogout")) 
		 {
				request.getRequestDispatcher("institute_login.jsp").forward(request,response );		
		 }
		 else if(action.equalsIgnoreCase("studLogout")) 
		 {
			request.getRequestDispatcher("student_login.jsp").forward(request,response );
		 }
		 
		 
		 else if (action.equalsIgnoreCase("forgotpassword"))
		 {
				request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
		 }
		 else if (action.equalsIgnoreCase("instituteforgotpassword"))
		 {
			 request.getRequestDispatcher("instituteforgotPassword.jsp").forward(request, response);

		 }
		 
		 else if (action.equalsIgnoreCase("studforgotpassword"))
		 {
			 request.getRequestDispatcher("studforgotPassword.jsp").forward(request, response);
		 }
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//doGet(request, response);
		String action=request.getParameter("action");
		HttpSession session= request.getSession(true);
		session.setMaxInactiveInterval(60* 60* 24);
		
		if(action.equalsIgnoreCase("msbteLogin"))
		{
		    String username = request.getParameter("username");
	        String password = request.getParameter("password");   	

	    	MSBTEBean msb=new Controller().getMsbteByLoginDetails(username,password);
	    	if(msb!=null)
	    	{
	    		session.setAttribute("Msbte", msb.getUsername());
			    session.setAttribute("msbte_id", msb.getMsbte_id()); 
	    		session.setAttribute("msb", msb);
	    		request.getRequestDispatcher("msbteOption.jsp").forward(request, response);
	    		
	    	}
	    	else 
	    	{
	    		request.setAttribute("alert","Please ! Enter correct Details!");
	    		request.getRequestDispatcher("msbte_login.jsp").forward(request, response);	
	    	}
		}
		else if(action.equalsIgnoreCase("forgotpassword"))
		{
		    String username = request.getParameter("username");
		    MSBTEBean ab=new Controller().getMSBTEByUsernameDetails(username);
	    	if(ab!=null)
	    	{
	    		session.setAttribute("msbte", ab.getUsername());
	    		request.setAttribute("ab", ab);
			    request.getRequestDispatcher("ResetPassword.jsp").forward(request, response); 
	    	}
	    	else 
	    	{
	    		request.setAttribute("alert","Please ! Enter correct Username!");
	    		request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);	
	    	}
		}
		else if(action.equalsIgnoreCase("studLogin"))
		{ 
			String username=request.getParameter("username"); 
			String password=request.getParameter("password"); 
	
			StudentBean sb=new Controller().getStudentByLoginDetails(username,password); 
			if(sb!=null) 
			{ 
		      session.setAttribute("Student", sb.getUsername());
		      session.setAttribute("sid", sb.getSid()); 
		      request.setAttribute("sb",sb); 
		      request.getRequestDispatcher("studentOption.jsp").forward(request, response);
			}
			else 
			{ 
		      request.setAttribute("alert","Please ! Enter correct Details!"); 
		      request.getRequestDispatcher("student_login.jsp").forward(request, response); 
		    }
		 }
		else if(action.equalsIgnoreCase("studforgotpassword"))
		{
		    String username = request.getParameter("username");
	    	StudentBean sb=new Controller().getStudentByUsernameDetails(username);
	    	if(sb!=null)
	    	{
	    		session.setAttribute("Student", sb.getUsername());
	    		request.setAttribute("sb", sb);
			    request.getRequestDispatcher("studResetPassword.jsp").forward(request, response); 
	    	}
	    	else 
	    	{
	    		request.setAttribute("alert","Please ! Enter correct Username!");
	    		request.getRequestDispatcher("studforgotPassword.jsp").forward(request, response);	
	    	}
		}
		
		else if(action.equalsIgnoreCase("itLogin"))
		{ 
			String username=request.getParameter("username"); 
			String password=request.getParameter("password"); 
			InstituteBean ib=new Controller().getInstituteByLoginDetails(username,password); 
			if(ib!=null) 
			{ 
		      session.setAttribute("Institute", ib.getUsername());
		      session.setAttribute("institute_id", ib.getInstitute_id()); 
		      session.setAttribute("institute_name", ib.getInstitute_name()); 
		      session.setAttribute("institute_name", ib.getInstitute_name());
		      request.setAttribute("ib",ib); 
		      request.getRequestDispatcher("instituteOption.jsp").forward(request, response);
			}
			else 
			{ 
		      request.setAttribute("alert","Please ! Enter correct Details!"); 
		      request.getRequestDispatcher("institute_login.jsp").forward(request, response); 
		    }
		 }
		else if(action.equalsIgnoreCase("instituteforgotpassword"))
		{
		    String username = request.getParameter("username");
	    	InstituteBean ib=new Controller().getInstituteByUsernameDetails(username);
	    	if(ib!=null)
	    	{
	    		session.setAttribute("institute", ib.getUsername());
	    		request.setAttribute("ib", ib);
			    request.getRequestDispatcher("instituteResetPassword.jsp").forward(request, response); 
	    	}
	    	else 
	    	{
	    		request.setAttribute("alert","Please ! Enter correct Username!");
	    		request.getRequestDispatcher("instituteforgotPassword.jsp").forward(request, response);	
	    	}
		}
		
	}

}

