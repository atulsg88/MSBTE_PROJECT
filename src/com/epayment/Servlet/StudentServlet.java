package com.epayment.Servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.JSONObject;

import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Controller.Controller;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/Student")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	String name = null;   // to store file name
    String fileType = null;     // to store file type
    String fileTypeandURL = null;  //to store file type and the base64 string
    String extension = null;    // to store extension of image
    String datetime = null;    //  to store date and time in miliseconds
    String image = null; 
    String image_in_file; 
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(true);
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("studentreg"))
		{
			List<InstituteBean> itlist = new ArrayList();
			Controller cntrl =new Controller();
			itlist =cntrl.itList();
			request.setAttribute("itlist", itlist);
			request.getRequestDispatcher("student_register.jsp").forward(request, response);
		}
		
		else if(action.equalsIgnoreCase("studList"))
		{
			/*String institute_name = (String)session.getAttribute("institute_name");*/
			InstituteBean  ib=new InstituteBean(); 
		    int institute_id= (int)session.getAttribute("institute_id"); 
		    Controller cntrl=new Controller(); 
		    ib=cntrl.instituteProfile(institute_id);
		    request.setAttribute("ib", ib);
			List<StudentBean> studList=new Controller().selectStudentList("1");
			request.setAttribute("studList", studList);
			request.getRequestDispatcher("liststudent.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("studList2"))
		{
			List<StudentBean> studList=new Controller().selectStudentList("1");
			request.setAttribute("studList", studList);
			request.getRequestDispatcher("liststudent2.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("editStudent")) 
		{
			StudentBean sb=new StudentBean(); 
		    String sid=request.getParameter("sid"); 
		    Controller cntrl=new Controller(); 
		    sb=cntrl.editStudent(sid);
		    request.setAttribute("sb", sb);
		    List<InstituteBean> itlist = new ArrayList();
			itlist =cntrl.itList();
			request.setAttribute("itlist", itlist);
		    request.getRequestDispatcher("student_register.jsp").forward(request,response); 
		}
		else if (action.equalsIgnoreCase("getStudentByName")) 
		{
				String fullname=request.getParameter("fullname");
				JSONObject j=new Controller().getStudentByName(fullname);
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(j.toString());		
		}
		 else if (action.equalsIgnoreCase("deleteStudent"))
			{
				String sid=request.getParameter("sid");
				String stud_status=request.getParameter("stud_status");
				new Controller().deleteStudent(sid,stud_status);		
				response.sendRedirect("Student?action=studList");	
			}
			else if(action.equalsIgnoreCase("StudentProfile")) 
			{
				StudentBean sb=new StudentBean(); 
			    int sid= (int)session.getAttribute("sid"); 
			    Controller cntrl=new Controller(); 
			    sb=cntrl.StudentProfile(sid);
			    request.setAttribute("sb", sb);
			    List<InstituteBean> itlist = new ArrayList();
				itlist =cntrl.itList();
				request.setAttribute("itlist", itlist);
			    request.getRequestDispatcher("student_profile.jsp").forward(request,response); 
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String action=request.getParameter("action");
		String fullname=request.getParameter("fullname");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String dob=request.getParameter("dob");
		String course_name=request.getParameter("course_name");
		String institute_name=request.getParameter("institute_name");
		String institute_code=request.getParameter("institute_code");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String stud_photo = request.getParameter("stud_photo");
		String enrollment= request.getParameter("enrollment");
		String Stud_status = "1";
		if (action.equalsIgnoreCase("saveStudent")) {
		if(request.getParameter("url")==null || request.getParameter("url")=="")
        {
			image=request.getParameter("edit_img_url");
        }
        else{
		   String imgnm;
	 		//code for image store
	 	       image_in_file = request.getParameter("url");
	 	       int i = image_in_file.indexOf(":");
	 	
	 	       if (i > 0) {
	 	           fileTypeandURL = image_in_file.substring(i + 1);
	 	       }
	 	
	 	       int j = fileTypeandURL.indexOf(";");
	 	
	 	       if (j > 0) {
	 	           fileType = fileTypeandURL.substring(0, j);
	 	
	 	       }
	 	
	 	       int k = image_in_file.indexOf(",");
	 	
	 	       if (k > 0) {
	 	           image = image_in_file.substring(k + 1);
	 	
	 	       }
	 	
	 	       if (fileType.equalsIgnoreCase("image/jpeg")) {
	 	           extension = "jpg";
	 	       }
	 	       if (fileType.equalsIgnoreCase("image/png")) {
	 	           extension = "png";
	 	       }
	 	       if (fileType.equalsIgnoreCase("image/gif")) {
	 	           extension = "gif";
	 	       }
	 	       byte[] imageByteArray = decodeImage(image);
	 	
	 	       Calendar calendar = Calendar.getInstance();
	 	       long milis = calendar.getTimeInMillis();
	 	       datetime = Long.toString(milis);
	 	       imgnm = datetime;
	 	
	 	       String path = this.getClass().getClassLoader().getResource("").getPath();
	 	       String fullPath = URLDecoder.decode(path, "UTF-8");
	 	       String[] pathArr = fullPath.split("/WEB-INF/classes/");
	 	       fullPath = pathArr[0];
	 	       String reponsePath = "";
	 	       reponsePath = new File(fullPath).getPath();	
	 	       
	 	       String str = reponsePath.substring(0, reponsePath.length() -14);
	 	      
	 	       reponsePath = String.valueOf(str) + "epayment_images/";
	 	       File outDir = new File(reponsePath);
	 		    outDir.mkdirs();
	 	       FileOutputStream imageOutFile = new FileOutputStream(reponsePath + imgnm+ "." + extension);
	 	       imageOutFile.write(imageByteArray);
	 	
	 	       imageOutFile.close();
	 	       image=imgnm+"."+extension;
        }
		StudentBean sb=new StudentBean();
		sb.setFullname(fullname);
		sb.setMobile(mobile);
		sb.setEmail(email);
		sb.setAddress(address);
		sb.setDob(dob);
		sb.setCourse_name(course_name);
		sb.setInstitute_name(institute_name);
		sb.setInstitute_code(institute_code);
		sb.setUsername(username);
		sb.setPassword(password);
		sb.setStud_status(Stud_status);
		sb.setStud_photo(image);
		sb.setEnrollment(enrollment);
		

		if (request.getParameter("sid")== "") 
		{
			Controller cntrl=new Controller();
			cntrl.savestud(sb);
			response.sendRedirect("Student?action=studList");

		} 
		else 
		{
			String sid = request.getParameter("sid");
			sb.setSid(Integer.parseInt(sid));
			Controller cntrl = new Controller();
			cntrl.updateStudent(sb);
			response.sendRedirect("Student?action=studList");

		}
	
		 if (action.equalsIgnoreCase("resetPassword")) {
				int sid=Integer.parseInt(request.getParameter("sid"));
				String new_password =request.getParameter("new_password");
				sb.setSid(sid);
				sb.setPassword(new_password);
				Controller cntrl = new Controller();
				cntrl.resetPassword(sb);
				response.sendRedirect("login?action=studentLogin"); 
		}
	  }	
	}
	public static byte[] decodeImage(String imageDataString) 
    {
        return Base64.decodeBase64(imageDataString);
    }

}
