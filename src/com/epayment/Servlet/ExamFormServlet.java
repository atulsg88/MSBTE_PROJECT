package com.epayment.Servlet;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import com.epayment.Bean.ExamFormBean;
import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.MSBTEBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Bean.SubjectBean;
import com.epayment.Controller.Controller;
import com.google.gson.Gson;

/**
 * Servlet implementation class SubjectMaster
 */
@WebServlet("/ExamForm")
public class ExamFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		HttpSession session = request.getSession(true);
		
		if (action.equalsIgnoreCase("examform")) {
		    int sid = (int) session.getAttribute("sid");
		    ExamFormBean eb = new Controller().getExamFormDetails(sid);
		    if (eb != null && (eb.getStatus().equals("1") || eb.getStatus().equals("2"))) {
				response.sendRedirect("ExamForm?action=examFormStatus");
		        }
		    else
		    {
		        List<SubjectBean> subList = new ArrayList();
		        Controller cntrl = new Controller();                      
		        subList = cntrl.subList();                              
		        request.setAttribute("sublist", subList);                       
		        StudentBean sb = new StudentBean();
		        sb = cntrl.editStudent(String.valueOf(sid));
		        request.setAttribute("sb", sb);
		        request.getRequestDispatcher("examForm.jsp").forward(request, response);
		    }
		}
		else if(action.equalsIgnoreCase("examList"))
		 {
			String institute_name= (String) session.getAttribute("institute_name");
			List<ExamFormBean> examList=new Controller().selectExamList(institute_name);
			request.setAttribute("examList", examList);
			request.getRequestDispatcher("examFormApproval.jsp").forward(request, response);	
		 }
		else if(action.equalsIgnoreCase("editExamForm"))
		 { 
			ExamFormBean  eb=new ExamFormBean(); 
		    String exam_id=request.getParameter("exam_id"); 
		    Controller cntrl=new Controller(); 
		    eb=cntrl.editExamForm(exam_id);
		    request.setAttribute("eb", eb);
			/*
			 * List<ExamFormBean> examList = new ArrayList(); examList =cntrl.examList();
			 * request.setAttribute("examList", examList);
			 */
		    request.getRequestDispatcher("examFormInstitute.jsp").forward(request,response); 
		 }
		else if(action.equalsIgnoreCase("getFormDetails")) 
	    {
			 String course_name =request.getParameter("course_name"); 
			 String semester =request.getParameter("semester"); 
			 List<SubjectBean> jslist=new ArrayList<SubjectBean>();
			 Controller cntrl =new Controller();
			 jslist=cntrl.getAjaxSubjectDetails(course_name,semester);
			 String jo=new Gson().toJson(jslist);
			 response.setContentType("application/json");
			 PrintWriter out = response.getWriter();
		     out.print(jo);
		     out.close();
			 JSONObject jobj= new JSONObject(jslist);
			 response.getWriter().write(String.valueOf(jobj));
	    }
		
		else if (action.equalsIgnoreCase("hallTicket")) {
			ExamFormBean eb = new ExamFormBean();
			int sid = (int) session.getAttribute("sid");
			Controller cntrl = new Controller();
			eb = cntrl.printHallTicket(sid);
			request.setAttribute("print", eb);
			request.getRequestDispatcher("hallticket.jsp").forward(request, response);
		}
		 		
		else if (action.equalsIgnoreCase("examFormStatus")) {
			ExamFormBean eb = new ExamFormBean();
			int sid = (int) session.getAttribute("sid");
			Controller cntrl = new Controller();
			eb = cntrl.examFormStatus(sid);
			request.setAttribute("ebs", eb);
			request.getRequestDispatcher("ExamStatus.jsp").forward(request, response);
		}

		  else if(action.equalsIgnoreCase("statusChange"))
		  { 
			  String exam_id=request.getParameter("exam_id");
			  String status=request.getParameter("status"); 
			  ExamFormBean eb= new ExamFormBean();
			  eb.setExam_id(Integer.parseInt(exam_id));
			  eb.setStatus(status); 
		      Controller cntrl = new Controller(); 
		      cntrl.statusChange(exam_id,eb);
		      response.sendRedirect("ExamForm?action=examList"); 
		   }
		  else if(action.equalsIgnoreCase("examformapprove"))
			 {
				List<ExamFormBean> examlist=new Controller().examFormApprove("2");
				request.setAttribute("examlist", examlist);
				request.getRequestDispatcher("examFormApproveMSBT.jsp").forward(request, response);	
			 }
		  else if(action.equalsIgnoreCase("generateseatno"))
			 { 
				ExamFormBean  eb=new ExamFormBean(); 
			    String exam_id=request.getParameter("exam_id"); 
			    Controller cntrl=new Controller(); 
			    eb=cntrl.generateSeat(exam_id);
			    request.setAttribute("ebgsn", eb); 
			    request.getRequestDispatcher("generateSeatNo.jsp").forward(request,response); 
			 }
		  else if(action.equalsIgnoreCase("seatNoListMSBT"))
			 {
				List<ExamFormBean> seatlist=new Controller().seatList();
				request.setAttribute("seatlist", seatlist);
				request.getRequestDispatcher("examFormApproveMSBT.jsp").forward(request, response);	
			 }
		  else if(action.equalsIgnoreCase("seatNoListInstitute"))
			 {
			    String institute_name= (String) session.getAttribute("institute_name");
				List<ExamFormBean> seatlist1=new Controller().seatListIn(institute_name);
				request.setAttribute("seatlist1", seatlist1);
				request.getRequestDispatcher("seatNoList.jsp").forward(request, response);	
			 }


		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
	    int sid = (int) session.getAttribute("sid");
		String action=request.getParameter("action");
		String stud_photo = request.getParameter("stud_photo");
		String fullname=request.getParameter("fullname");
		String dob=request.getParameter("dob");
		String enrollment_no=request.getParameter("enrollment_no");
		String institute_name=request.getParameter("institute_name");
		String institute_code=request.getParameter("institute_code");
		String course_name=request.getParameter("course_name");
		String semester=request.getParameter("semester");
		String subject = request.getParameter("subject");
		String payment = request.getParameter("payment");
		String seatno= request.getParameter("seat_no");
		String status= "1";
		String seat_status="3";
		
		ExamFormBean eb = new ExamFormBean();
		eb.setStud_photo("image");
		eb.setFullname(fullname);
		eb.setDob(dob);
		eb.setEnrollment_no(enrollment_no);
		eb.setInstitute_name(institute_name);
		eb.setInstitute_code(institute_code);
		eb.setCourse_name(course_name);
		eb.setSemester(semester);
		eb.setSubject(subject);
		eb.setPayment(payment);
		eb.setSid(String.valueOf(sid)); 
		eb.setSeatno(seatno);
		eb.setStatus(status);
		eb.setSeat_status(seat_status);
		
	   	if(action.equalsIgnoreCase("saveExam"))
	   	{
			if (request.getParameter("exam_id") == "") {
				Controller cntrl = new Controller();
				cntrl.saveExamform(eb);
				response.sendRedirect("ExamForm?action=examform");

			} else {
				String exam_id = request.getParameter("exam_id");
				eb.setExam_id(Integer.parseInt(exam_id));
				Controller cntrl = new Controller();
				cntrl.updateExamForm(eb);
			}
	   	}
	   	else if(action.equalsIgnoreCase("saveSeat"))
	   	{
	   		int exam_id=Integer.parseInt(request.getParameter("exam_id"));
			eb.setExam_id(exam_id);
		    Controller cntrl= new Controller();
	        cntrl.saveseat(eb);
	        response.sendRedirect("ExamForm?action=seatNoListMSBT");
	   	}
		
	}

}
