package com.epayment.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.MSBTEBean;
import com.epayment.Bean.SubjectBean;
import com.epayment.Controller.Controller;

/**
 * Servlet implementation class SubjectServlet
 */
@WebServlet("/SubjectServlet")
public class SubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("addsubject")) 
		 {
			request.getRequestDispatcher("addsubject.jsp").forward(request,response );
		 }
		else if(action.equalsIgnoreCase("subList"))
		 {
			List<SubjectBean> subList=new Controller().selectSubjectList("1");
			request.setAttribute("subList", subList);
			request.getRequestDispatcher("listsubject.jsp").forward(request, response);	
		 }
		else if(action.equalsIgnoreCase("editSubject"))
		 { 
			SubjectBean subB=new SubjectBean(); 
		    String sub_id=request.getParameter("sub_id"); 
		    Controller cntrl=new Controller(); 
		    subB=cntrl.editSubject(sub_id);
		    List<SubjectBean> subList = new ArrayList();
			subList =cntrl.subList();
			request.setAttribute("subList", subList);
		    request.setAttribute("subB", subB);
		    request.getRequestDispatcher("addsubject.jsp").forward(request,response); 
		 }
		else if (action.equalsIgnoreCase("deleteSubject"))
		{
			String sub_id=request.getParameter("sub_id");
			String sub_status=request.getParameter("sub_status");
			new Controller().deleteSubject(sub_id,sub_status);		
			response.sendRedirect("SubjectServlet?action=subList");	
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String course_name= request.getParameter("course_name");
		String semester=request.getParameter("semester");
		String subject = request.getParameter("subject");
		String checkbox = request.getParameter("exam_mode");
		String sub_status= "1";
		
		SubjectBean subB =new SubjectBean();
		subB.setCourse_name(course_name);
		subB.setSemester(semester);
		subB.setSubject(subject);
		subB.setCheckbox(checkbox);
		subB.setSub_status(sub_status);
		
		if (request.getParameter("sub_id") == "") 
		{
			Controller cntrl = new Controller();
			cntrl.saveSubject(subB);
			response.sendRedirect("SubjectServlet?action=subList");
		} 
		else 
		{
			String sub_id = request.getParameter("sub_id");
			subB.setSub_id(Integer.parseInt(sub_id));
			Controller cntrl = new Controller();
			cntrl.updateSubject(subB);
			response.sendRedirect("SubjectServlet?action=subList");
		   
		}
		
	}

}
