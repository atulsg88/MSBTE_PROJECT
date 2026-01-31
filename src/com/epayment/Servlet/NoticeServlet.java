package com.epayment.Servlet;

import java.util.List;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.NoticeDocBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Controller.Controller;
import com.epayment.Dao.NoticeDocDao;
import com.epayment.Util.Util;

/**
 * Servlet implementation class NoticeDocServlet
 */
@WebServlet("/NoticeDoc")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("addnotice"))
		{
			 request.getRequestDispatcher("addNotice.jsp").forward(request, response);
		}
		else if (action.equalsIgnoreCase("listnotice")) 
		{
			 List<NoticeDocBean> ndList=new Controller().selectNoticeList("1");
			 request.setAttribute("ndList", ndList);
			 request.getRequestDispatcher("listnoticedoc.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("editnotice")) 
		{
			NoticeDocBean nb=new NoticeDocBean(); 
		    String noticedoc_id=request.getParameter("noticedoc_id"); 
		    Controller cntrl=new Controller(); 
		    nb=cntrl.editNotice(noticedoc_id);
		    List<NoticeDocBean> ndList=new Controller().selectNoticeList("1");
		    request.setAttribute("ndList", ndList);
		    request.setAttribute("nb",nb);
		    request.getRequestDispatcher("addNotice.jsp").forward(request,response); 
		}
		else if(action.equalsIgnoreCase("download"))
		{
			response.setContentType("image/png");  
			PrintWriter out = response.getWriter(); 
			String download_img = request.getParameter("download_img");   
			String path = this.getClass().getClassLoader().getResource("").getPath();
	        String fullPath = URLDecoder.decode(path, "UTF-8");
	        String[] pathArr = fullPath.split("/WEB-INF/classes/");
	        fullPath = pathArr[0];
	        String reponsePath = "";
	        reponsePath = new File(fullPath).getPath();
	      /*  String str = reponsePath.substring(0, reponsePath.length() -9); *///local
	        String str = reponsePath.substring(0, reponsePath.length() -14); //Server
	        reponsePath = String.valueOf(str) + "epayment_images/";
			response.setContentType("APPLICATION/OCTET-STREAM");   
			response.setHeader("Content-Disposition","attachment; filename=\"" + download_img + "\"");     
			FileInputStream fileInputStream = new FileInputStream(reponsePath + download_img);  	            
			int i;   
			while ((i=fileInputStream.read()) != -1) 
			{  
			out.write(i);   
			}   
			fileInputStream.close();   
			out.close();   
			}  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	    
		
		String noticedoc_name=request.getParameter("noticedoc_name");
		String noticedoc_img=request.getParameter("noticedoc_img");
		String noticedoc_status="1";
		
		System.out.println("noticedoc_name="+noticedoc_name);
		System.out.println("noticedoc_img="+noticedoc_img);
		
		//variable for edit and save image   
	    String edit_noticedoc_img=request.getParameter("edit_noticedoc_img");
		
		NoticeDocBean nb = new NoticeDocBean();
		nb.setNoticedoc_name(noticedoc_name);
		nb.setNoticedoc_status(noticedoc_status);
		nb.setNoticedoc_img(noticedoc_img);
		
	       
	       if(request.getParameter("noticedoc_id")!="")
	        {
	    	   if(noticedoc_img.isEmpty())
	        	{ noticedoc_img=edit_noticedoc_img;
	        	  nb.setNoticedoc_img(noticedoc_img);}
		    	else
		    	{ String reponsePath=new Util().ImageDelete(edit_noticedoc_img);
		 		  File file = new File(reponsePath); 
		 		  file.delete();
		 		  noticedoc_img= new Util().ImageGeneration(noticedoc_img);	
		 		  nb.setNoticedoc_img(noticedoc_img);}

				  String noticedoc_id=request.getParameter("noticedoc_id");
		     	  nb.setNoticedoc_id(Integer.parseInt(noticedoc_id));
		     	  Controller cntrl = new Controller();
				  cntrl.updatenotice(nb);
			}
	        else
		    {
	             if(!noticedoc_img.isEmpty())
		       	 {noticedoc_img= new Util().ImageGeneration(noticedoc_img);		  
		       	 nb.setNoticedoc_img(noticedoc_img);}
	             Controller cntrl = new Controller();
	    		 cntrl.savenotice(nb);
		    }
        response.sendRedirect("NoticeDoc?action=listnotice");
	}
}
