package com.epayment.Controller;

import java.sql.Connection;


import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;
import com.epayment.Bean.ExamFormBean;
import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.MSBTEBean;
import com.epayment.Bean.NoticeDocBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Bean.SubjectBean;
import com.epayment.Connection.ManageConnection;
import com.epayment.Dao.ExamDao;
import com.epayment.Dao.InstituteDao;
import com.epayment.Dao.LoginDao;
import com.epayment.Dao.MSBTEDao;
import com.epayment.Dao.NoticeDocDao;
import com.epayment.Dao.StudentDao;
import com.epayment.Dao.SubjectDao;



public class Controller {



	public void saveMsbte(MSBTEBean msb) 
	{
		try (Connection con = ManageConnection.getConnection()) 
		{
			MSBTEDao ad = new MSBTEDao();
			ad.saveMsbte(msb, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

	}

	public MSBTEBean getMsbteByLoginDetails(String username, String password) 
	{
		// TODO Auto-generated method stub
		MSBTEBean msb = new MSBTEBean();
		try (Connection con = ManageConnection.getConnection()) 
		{
			msb = new LoginDao().getMsbteByLoginDetails(username, password, con);
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		return msb;

	}
	
	public void resetPassword(MSBTEBean msb) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			MSBTEDao ad = new MSBTEDao();
			ad.resetPassword(msb, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}
	
	public MSBTEBean getMSBTEByUsernameDetails(String username) {
		MSBTEBean ab = null;
		try (Connection con = ManageConnection.getConnection()) 
		{
			ab = new LoginDao().getMSBTEByUsernameDetails(username, con);
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		return ab;
	}

	public MSBTEBean editMsbte(String msbte_id) 
	{
       MSBTEBean msb=new MSBTEBean(); 
	   try (Connection con=ManageConnection.getConnection())
	   {
	    MSBTEDao msbte=new MSBTEDao();
	    msb=msbte.editMsbte(msbte_id, con);
	   }
	   catch(Exception e)
	   {
	     e.printStackTrace();
	    }
		return msb ;
			
	}
	public MSBTEBean MSBTEProfile(int msbte_id) 
	{
       MSBTEBean msb=new MSBTEBean(); 
	   try (Connection con=ManageConnection.getConnection())
	   {
	    MSBTEDao msbte=new MSBTEDao();
	    msb=msbte.MSBTEProfile(msbte_id, con);
	   }
	   catch(Exception e)
	   {
	     e.printStackTrace();
	    }
		return msb ;
			
	}

	public MSBTEBean Msbtedetail() {
		// TODO Auto-generated method stub
		MSBTEBean msb= new MSBTEBean();
		try (Connection con=ManageConnection.getConnection())
		{
		MSBTEDao msbte=new MSBTEDao();
		msb=msbte.Msbtedetail(con);
		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return msb;
	}

	public void updateMsbte(MSBTEBean msb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection())
		{
		MSBTEDao msbte=new MSBTEDao();
		msbte.updateMsbte(msb,con);
		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void savestud(StudentBean sb) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			StudentDao sd = new StudentDao();
			sd.savestud(sb, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}

	}
	public List<MSBTEBean> msbList() {
		ArrayList <MSBTEBean> msbList = new ArrayList();
		try (Connection con=ManageConnection.getConnection())
		{
		 MSBTEDao  it= new MSBTEDao();
		 msbList =  it.msbList(con);
		}catch (Exception e) {
		// TODO: handle exception
	     e.printStackTrace();
		}
		return msbList;
	}
	
	public void resetPassword(StudentBean sb) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			StudentDao sd = new StudentDao();
			sd.resetPassword(sb, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	public StudentBean getStudentByLoginDetails(String username, String password) 
	{ 
	    StudentBean sb=new StudentBean(); 
	    try (Connection con=ManageConnection.getConnection())
	    { 
	    	sb=new LoginDao().getStudentByLoginDetails(username,password,con);
	    } 
	    catch (Exception e) 
	    {
	        e.printStackTrace(); 
	     }
	    return sb; 
	  }
	
	public StudentBean getStudentByUsernameDetails(String username) {
		StudentBean sb = null;
		try (Connection con = ManageConnection.getConnection()) 
		{
			sb = new LoginDao().getStudentByUsernameDetails(username, con);
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		return sb;
	}

	public List<StudentBean> studList()
	{
		// TODO Auto-generated method stub
		ArrayList <StudentBean> studList = new ArrayList();
			try (Connection con=ManageConnection.getConnection())
			{
			 StudentDao cs= new StudentDao();
			 studList =  cs.studList(con);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return studList;
		}
	
	public List<StudentBean> selectStudentList(String stud_status) {
		List<StudentBean> studList=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
			studList =new StudentDao().selectStudentList(stud_status,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return studList;
	}

	public StudentBean editStudent(String sid) 
	{
         StudentBean sb=new StudentBean(); 
         try (Connection con=ManageConnection.getConnection())
         {  
        	 StudentDao sd=new StudentDao(); 
		     sb=sd.editStudent(sid, con); 
		  }
         catch(Exception e)
         { 
        	 e.printStackTrace();
         }
		  return sb ; 
	}


	public StudentBean StudentProfile(int sid) 
	{
         StudentBean sb=new StudentBean(); 
         try (Connection con=ManageConnection.getConnection())
         {  
        	 StudentDao sd=new StudentDao(); 
		     sb=sd.StudentProfile(sid, con); 
		  }
         catch(Exception e)
         { 
        	 e.printStackTrace();
         }
		  return sb ; 
	}
	
	
	
	public void updateStudent(StudentBean sb) 
	{		
	   try (Connection con=ManageConnection.getConnection())
	   { 
		   StudentDao sd=new StudentDao(); 
	       sd.updateStudent(sb, con); 
	   } 
	   catch(Exception e)
	   { 
		  e.printStackTrace(); 
	    }
	}

	public void deleteStudent(String sid, String stud_status) {
		// TODO Auto-generated method stub
				try (Connection con= ManageConnection.getConnection()){
					new StudentDao().deleteStudent(sid,stud_status,con);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
	}

	public JSONObject getStudentByName(String fullname) {
		JSONObject j=new JSONObject();
		try (Connection con=ManageConnection.getConnection()){
			j=new StudentDao().getStudentByName(fullname,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return j;
	}
	
	public InstituteBean getInstituteByLoginDetails(String username, String password) 
	{ 
		InstituteBean ib=new InstituteBean(); 
	    try (Connection con=ManageConnection.getConnection())
	    { 
	    	ib=new LoginDao().getInstituteByLoginDetails(username,password,con);
	    } 
	    catch (Exception e) 
	    {
	        e.printStackTrace(); 
	    }
	    return ib; 
	}

	
	public void saveInstitute(InstituteBean ib) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			InstituteDao id = new InstituteDao();
			id.saveInstitute(ib, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}	
	
	public void resetPassword(InstituteBean ib) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			InstituteDao ad = new InstituteDao();
			ad.resetPassword(ib, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	public InstituteBean editInstitute(String institute_id) 
	{
		 InstituteBean ib=new InstituteBean(); 
         try (Connection con=ManageConnection.getConnection())
         {  
        	 InstituteDao id=new InstituteDao(); 
		     ib=id.editInstitute(institute_id, con); 
		 }
         catch(Exception e)
         { 
        	 e.printStackTrace();
         }
		 return ib ; 
	}
	

	public void updateInstitute(InstituteBean ib) 
	{		
	   try (Connection con=ManageConnection.getConnection())
	   { 
		   InstituteDao id=new InstituteDao(); 
	       id.updateInstitute(ib, con); 
	   } 
	   catch(Exception e)
	   { 
		  e.printStackTrace(); 
	   }
	}
	public void deleteInstitute(String institute_id, String institute_status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new InstituteDao().deleteInstitute(institute_id,institute_status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
	public InstituteBean instituteProfile(int institute_id) 
	{
		 InstituteBean ib=new InstituteBean(); 
         try (Connection con=ManageConnection.getConnection())
         {  
        	 InstituteDao id=new InstituteDao(); 
		     ib=id.instituteProfile(institute_id, con); 
		 }
         catch(Exception e)
         { 
        	 e.printStackTrace();
         }
		 return ib ; 
	}
	

	public JSONObject getInstituteByName(String institute_name) {
		JSONObject j=new JSONObject();
		try (Connection con=ManageConnection.getConnection()){
			j=new InstituteDao().getInstituteByName(institute_name,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return j;
	}


	public InstituteBean getInstituteByUsernameDetails(String username) {
		InstituteBean ib = null;
		try (Connection con = ManageConnection.getConnection()) 
		{
			ib = new LoginDao().getInstituteByUsernameDetails(username, con);
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		return ib;
	}

	
	public List<InstituteBean> selectInstituteList(String institute_status) {
		List<InstituteBean> itList=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
			itList =new InstituteDao().selectInstituteList(institute_status,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return itList;
	}

	
	public List<InstituteBean> itList()
	{
		// TODO Auto-generated method stub
	    ArrayList <InstituteBean> itlist = new ArrayList();
		try (Connection con=ManageConnection.getConnection())
		{
		 InstituteDao  it= new InstituteDao();
		 itlist =  it.itList(con);
		}catch (Exception e) {
		// TODO: handle exception
	     e.printStackTrace();
		}
		return itlist;
    }

	
	public void saveSubject(SubjectBean subB) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			SubjectDao sd = new SubjectDao();
			sd.saveSubject(subB, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	public void updateSubject(SubjectBean subB) {
		// TODO Auto-generated method stub
		
		try (Connection con=ManageConnection.getConnection())
		{
		SubjectDao sd=new SubjectDao();
		sd.updateSubject(subB,con);
		}
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	public SubjectBean editSubject(String sub_id) {
		SubjectBean subB=new SubjectBean(); 
		   try (Connection con=ManageConnection.getConnection())
		   {
		    SubjectDao sd=new SubjectDao();
		    subB=sd.editSubject(sub_id, con);
		   }
		   catch(Exception e)
		   {
		     e.printStackTrace();
		    }
			return subB ;
				
			
	}

	public List<SubjectBean> selectSubjectList(String sub_status) {
		List<SubjectBean> subList=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
			subList =new SubjectDao().selectSubjectList(sub_status,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return subList;
	}

	public List<SubjectBean> subList() {
		ArrayList <SubjectBean> subList = new ArrayList();
		try (Connection con=ManageConnection.getConnection())
		{
		 SubjectDao sd= new SubjectDao();
		 subList =  sd.subList(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return subList;
	
	}

	public void deleteSubject(String sub_id, String sub_status) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection()){
			new SubjectDao().deleteSubject(sub_id,sub_status,con);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public List<SubjectBean> getAjaxSubjectDetails(String course_name,String semester) {
		List<SubjectBean> subList=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
			subList =new SubjectDao().getAjaxSubjectDetails(course_name,semester,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return subList;
	}

	public void saveExamform(ExamFormBean eb) {
		try (Connection con = ManageConnection.getConnection()) 
		{
			ExamDao ad = new ExamDao();
			ad.saveExamform(eb, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}
	
	public void updateExamForm(ExamFormBean eb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection())
		   { 
			ExamDao ad = new ExamDao();
			ad.updateExamForm(eb, con);
		   } 
		   catch(Exception e)
		   { 
			  e.printStackTrace(); 
		    }
	}

	public void savenotice(NoticeDocBean nb) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			NoticeDocDao nd = new NoticeDocDao();
			nd.savenotice(nb, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

	public void updatenotice(NoticeDocBean nb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection())
		   { 
			   NoticeDocDao nd=new NoticeDocDao(); 
		       nd.updatenotice(nb, con); 
		   } 
		   catch(Exception e)
		   { 
			  e.printStackTrace(); 
		    }
	}

	
	public List<ExamFormBean> selectExamList(String institute_name) {
		List<ExamFormBean> examList=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
			examList =new ExamDao().selectExamList(institute_name,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return examList;
	}

	public List<ExamFormBean> examList() {
		 ArrayList <ExamFormBean> examList = new ArrayList();
			try (Connection con=ManageConnection.getConnection())
			{
			 ExamDao  ed= new ExamDao();
			 examList =  ed.examList(con);
			}catch (Exception e) {
			// TODO: handle exception
		     e.printStackTrace();
			}
			return examList;
	}

	public ExamFormBean editExamForm(String exam_id) {
		ExamFormBean eb=new ExamFormBean(); 
        try (Connection con=ManageConnection.getConnection())
        {  
        	ExamDao ed=new ExamDao(); 
		     eb=ed.editExamForm(exam_id, con); 
		 }
        catch(Exception e)
        { 
       	 e.printStackTrace();
        }
		 return eb ; 
	}
	
	public List<NoticeDocBean> selectNoticeList(String 	noticedoc_status) {
		List<NoticeDocBean> ndList=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
			ndList =new NoticeDocDao().selectNoticeList(noticedoc_status,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ndList;
	}

	public NoticeDocBean editNotice(String noticedoc_id) 
	{
		 NoticeDocBean nb=new NoticeDocBean(); 
         try (Connection con=ManageConnection.getConnection())
         {  
        	 NoticeDocDao ndd=new NoticeDocDao(); 
		     nb=ndd.editNotice(noticedoc_id, con); 
		  }
         catch(Exception e)
         { 
        	 e.printStackTrace();
         }
		  return nb ; 
	}

	public ExamFormBean examFormStatus(int sid) {
		// TODO Auto-generated method stub
		ExamFormBean eb=new ExamFormBean(); 
        try (Connection con=ManageConnection.getConnection())
        {  
       	  ExamDao ed=new ExamDao(); 
		  eb=ed.examFormStatus(sid, con); 
		 }
        catch(Exception e)
        { 
       	 e.printStackTrace();
        }
		  return eb ;	
		  }

	public void statusChange(String exam_id, ExamFormBean eb) {
		// TODO Auto-generated method stub
		try (Connection con=ManageConnection.getConnection())
		{
		   ExamDao ed= new ExamDao();
	       ed.statusChange(con, eb);
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public List<ExamFormBean> examFormApprove(String  status) {
		// TODO Auto-generated method stub
		List<ExamFormBean> examlist=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
			examlist =new ExamDao().examFormApprove(status ,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return examlist;
	}

	public ExamFormBean generateSeat(String exam_id) {
		// TODO Auto-generated method stub
		 ExamFormBean eb=new ExamFormBean(); 
		   try (Connection con=ManageConnection.getConnection())
		   {
		     ExamDao ed=new  ExamDao();
		     eb=ed.generateSeat(exam_id, con);
		   }
		   catch(Exception e)
		   {
		     e.printStackTrace();
		   }
		   return eb;	
	}

	public void saveseat(ExamFormBean eb) {
		// TODO Auto-generated method stub
		try (Connection con = ManageConnection.getConnection()) 
		{
			ExamDao ed = new ExamDao();
			ed.saveseat(eb, con);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	public List<ExamFormBean> seatList() {
		// TODO Auto-generated method stub
		List<ExamFormBean> seatlist=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
		    seatlist =new ExamDao().seatList(con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return seatlist;
	}

	public List<ExamFormBean> seatListIn(String institute_name) {
		// TODO Auto-generated method stub
		List<ExamFormBean> seatlist1=new ArrayList<>();
		try (Connection con = ManageConnection.getConnection()){
		    seatlist1 =new ExamDao().seatListIn(institute_name,con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return seatlist1;
	}

	public ExamFormBean getExamFormDetails(int sid) {
		// TODO Auto-generated method stub
		ExamFormBean eb = new ExamFormBean();
		try (Connection con = ManageConnection.getConnection()) 
		{
			eb = new ExamDao().getExamFormDetails(sid, con);
		} 
		catch (Exception e) 
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		return eb;
	}

	
	public ExamFormBean printHallTicket(int sid) 
	{ 
		ExamFormBean eb=new ExamFormBean();
		try (Connection con=ManageConnection.getConnection())
		{ 
			ExamDao ed=new ExamDao(); 
			eb=ed.printHallTicket(sid,con); 
		} 
		catch(Exception e)
		{ 
			e.printStackTrace();
	  } 
		return eb ; 
	}
	
}
	


