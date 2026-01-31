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

import org.json.JSONObject;

import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Controller.Controller;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/Institute")
public class InstituteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InstituteServlet() {
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
		
		 if(action.equalsIgnoreCase("institutereg"))
		 {
			request.getRequestDispatcher("institute_register.jsp").forward(request,response );
		 }	
		 else if(action.equalsIgnoreCase("itList"))
		 {
			List<InstituteBean> itList=new Controller().selectInstituteList("1");
			request.setAttribute("itList", itList);
			request.getRequestDispatcher("listinstitute.jsp").forward(request, response);	
		 }
		 else if(action.equalsIgnoreCase("editInstitute"))
		 { 
			InstituteBean  ib=new InstituteBean(); 
		    String institute_id=request.getParameter("institute_id"); 
		    Controller cntrl=new Controller(); 
		    ib=cntrl.editInstitute(institute_id);
		    request.setAttribute("ib", ib);
		    List<InstituteBean> itList = new ArrayList();
			itList =cntrl.itList();
			request.setAttribute("itList", itList);
		    request.getRequestDispatcher("institute_register.jsp").forward(request,response); 
		 }
		 else if (action.equalsIgnoreCase("deleteInstitute"))
			{
				String institute_id=request.getParameter("institute_id");
				String institute_status=request.getParameter("institute_status");
				new Controller().deleteInstitute(institute_id,institute_status);		
				response.sendRedirect("Institute?action=itList");	
			}
		 else if (action.equalsIgnoreCase("getInstituteByName")) 
			{
					String institute_name=request.getParameter("institute_name");
					JSONObject j=new Controller().getInstituteByName(institute_name);
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(j.toString());		
			}
		 else if(action.equalsIgnoreCase("instituteProfile"))
		 { 
			InstituteBean  ib=new InstituteBean(); 
		    int institute_id= (int)session.getAttribute("institute_id"); 
		    Controller cntrl=new Controller(); 
		    ib=cntrl.instituteProfile(institute_id);
		    request.setAttribute("ib", ib);
		    List<InstituteBean> itList = new ArrayList();
			itList =cntrl.itList();
			request.setAttribute("itList", itList);
		    request.getRequestDispatcher("institute_Profile.jsp").forward(request,response); 
		 }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		String institute_name=request.getParameter("institute_name");
		String institute_code=request.getParameter("institute_code");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String username=request.getParameter("username");
		String password =request.getParameter("password");
		String address=request.getParameter("address");
		String registerd_date=request.getParameter("registerd_date");
		String institute_status= "1";
		
		InstituteBean ib =new InstituteBean();
		ib.setInstitute_name(institute_name);
		ib.setInstitute_code(institute_code);
		ib.setEmail(email);
		ib.setMobile(mobile);
		ib.setUsername(username);
		ib.setPassword(password);
		ib.setAddress(address);
		ib.setRegisterd_date(registerd_date);
	    ib.setInstitute_status(institute_status);

	    if (action.equalsIgnoreCase("saveInstitute")) {
		if (request.getParameter("institute_id") == "") 
		{
			Controller cntrl = new Controller();
			cntrl.saveInstitute(ib);
			response.sendRedirect("login?action=instituteLogin");

		} 
		else 
		{
			String institute_id = request.getParameter("institute_id");
			ib.setInstitute_id(Integer.parseInt(institute_id));
			Controller cntrl = new Controller();
			cntrl.updateInstitute(ib);
			response.sendRedirect("Institute?action=itList");
		}
		}
	    if (action.equalsIgnoreCase("resetPassword")) {
			int institute_id=Integer.parseInt(request.getParameter("institute_id"));
			String new_password =request.getParameter("new_password");
			ib.setInstitute_id(institute_id);
			ib.setPassword(new_password);
			Controller cntrl = new Controller();
			cntrl.resetPassword(ib);
			response.sendRedirect("login?action=instituteLogin"); 
		}
		
	}
}

