package com.epayment.Dao;

import java.sql.Connection;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.epayment.Bean.ExamFormBean;
import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.MSBTEBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Util.Util;

public class ExamDao {

	public void saveExamform(ExamFormBean eb, Connection con) {
		// TODO Auto-generated method stub
		 try (PreparedStatement pst=con.prepareStatement("INSERT INTO `exam_form`( `exam_id`,`sid`,`stud_photo`, `fullname`,`dob`,`enrollment_no`,`institute_name`,`institute_code`,`course_name`,`semester`,`subject`,`payment`,`status`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)")){
		    	pst.setInt(1,0);
		    	pst.setString(2,eb.getSid());
		 		pst.setString(3,eb.getStud_photo());
		 		pst.setString(4,eb.getFullname());
		 		pst.setString(5,eb.getDob());
		 	    pst.setString(6,eb.getEnrollment_no());
		 	    pst.setString(7,eb.getInstitute_name());
		 	    pst.setString(8,eb.getInstitute_code());
		 	    pst.setString(9,eb.getCourse_name());
		 	    pst.setString(10,eb.getSemester());
		 	    pst.setString(11,eb.getSubject());
		 	    pst.setString(12,eb.getPayment());
		 	    pst.setString(13,"1");
		 		pst.executeUpdate();
		 		pst.close();
		 		con.close();
		 	} catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
	}

	public void updateExamForm(ExamFormBean eb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `exam_form` set `fullname`=?,`dob`=?,`enrollment_no`=?,`institute_name`=?,`institute_code`=?,`course_name`=?,`semester`=? ,`subject`=? where exam_id=? "))
		{	
			pst.setString(1,eb.getStud_photo());
	 		pst.setString(2,eb.getFullname());
	 		pst.setString(3,eb.getDob());
	 	    pst.setString(4,eb.getEnrollment_no());
	 	    pst.setString(5,eb.getInstitute_name());
	 	    pst.setString(6,eb.getInstitute_code());
	 	    pst.setString(7,eb.getCourse_name());
	 	    pst.setString(8,eb.getSemester());
	 	    pst.setString(9,eb.getSubject());
	 	    pst.setInt(11, eb.getExam_id());
	 		pst.executeUpdate();
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public ExamFormBean Hallticket(int exam_id, Connection con) {
		ExamFormBean eb=new ExamFormBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `exam_form` WHERE exam_id=?"))
		 {
			pst.setInt(1,exam_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	        	eb.setExam_id(rs.getInt("exam_id"));
	        	eb.setStud_photo(rs.getString("stud_photo"));
	        	eb.setFullname(rs.getString("fullname"));
	        	eb.setDob(rs.getString("dob"));
	        	eb.setEnrollment_no(rs.getString("enrollment_no"));
	        	eb.setInstitute_name(rs.getString("institute_name"));
	        	eb.setInstitute_code(rs.getString("institute_code"));
	        	eb.setCourse_name(rs.getString("course_name"));
	        	eb.setSemester(rs.getString("semester"));
	        	eb.setSubject(rs.getString("subject"));
				eb.setStatus(rs.getString("status"));
		 	}
	       } 
		 catch (Exception e) 
		   {
		 		// TODO: handle exception
		 	e.printStackTrace();
		   }
		
	    return eb;
	}

	public List<ExamFormBean> selectExamList(String institute_name, Connection con) {
		List<ExamFormBean> examList = new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT  ef.*,im.* FROM exam_form ef ,institute_master im where ef.institute_name=im.institute_name AND ef.institute_name=?");
			pst.setString(1,institute_name);
			rs = pst.executeQuery();
			while (rs.next()) {
				ExamFormBean eb = new ExamFormBean();
				eb.setExam_id(rs.getInt("exam_id"));
	        	eb.setStud_photo(rs.getString("stud_photo"));
	        	eb.setFullname(rs.getString("fullname"));
	        	eb.setDob(rs.getString("dob"));
	        	eb.setEnrollment_no(rs.getString("enrollment_no"));
	        	eb.setInstitute_name(rs.getString("institute_name"));
	        	eb.setInstitute_code(rs.getString("institute_code"));
	        	eb.setCourse_name(rs.getString("course_name"));
	        	eb.setSemester(rs.getString("semester"));
	        	eb.setSubject(rs.getString("subject"));
				eb.setStatus(rs.getString("status"));
				examList.add(eb);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return examList;
	}

	public ArrayList<ExamFormBean> examList(Connection con) {
		ArrayList<ExamFormBean> examList= new ArrayList();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `exam_form` where exam_id=?"))
		{
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				ExamFormBean eb = new ExamFormBean();
				eb.setExam_id(rs.getInt("exam_id"));
	        	eb.setStud_photo(rs.getString("stud_photo"));
	        	eb.setFullname(rs.getString("fullname"));
	        	eb.setDob(rs.getString("dob"));
	        	eb.setEnrollment_no(rs.getString("enrollment_no"));
	        	eb.setInstitute_name(rs.getString("institute_name"));
	        	eb.setInstitute_code(rs.getString("institute_code"));
	        	eb.setCourse_name(rs.getString("course_name"));
	        	eb.setSemester(rs.getString("semester"));
	        	eb.setSubject(rs.getString("subject"));
				eb.setStatus(rs.getString("status"));
				examList.add(eb);
			}
		}
		catch (Exception e) 
		{ // TODO: handle exception
			e.printStackTrace();
		}

		return examList;
	
	}

	public ExamFormBean editExamForm(String exam_id, Connection con) {
		ExamFormBean eb=new ExamFormBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `exam_form` WHERE exam_id=?"))
		 {
			pst.setString(1,exam_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	        	eb.setExam_id(rs.getInt("exam_id"));
	        	eb.setStud_photo(rs.getString("stud_photo"));
	        	eb.setFullname(rs.getString("fullname"));
	        	eb.setDob(rs.getString("dob"));
	        	eb.setEnrollment_no(rs.getString("enrollment_no"));
	        	eb.setInstitute_name(rs.getString("institute_name"));
	        	eb.setInstitute_code(rs.getString("institute_code"));
	        	eb.setCourse_name(rs.getString("course_name"));
	        	eb.setSemester(rs.getString("semester"));
	        	eb.setSubject(rs.getString("subject"));
				eb.setStatus(rs.getString("status"));
		 	}
	       } 
		   catch (Exception e) 
		   {
		 	 e.printStackTrace();
		   }
		return eb;
	}

	public ExamFormBean examFormStatus(int sid, Connection con) {
		// TODO Auto-generated method stub
			ExamFormBean eb=new ExamFormBean();	
			 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `exam_form` WHERE sid=?"))
			 {
				pst.setInt(1,sid);
			    ResultSet rs = pst.executeQuery();
		        while(rs.next())
		        {
		        	eb.setSid(rs.getString("sid"));
		        	eb.setFullname(rs.getString("fullname"));
		        	eb.setDob(rs.getString("dob"));
		        	eb.setCourse_name(rs.getString("course_name"));
		        	eb.setEnrollment_no(rs.getString("enrollment_no"));
		        	eb.setInstitute_name(rs.getString("institute_name"));
		        	eb.setInstitute_code(rs.getString("institute_code"));
		        	eb.setSemester(rs.getString("semester"));
		        	eb.setStatus(rs.getString("status"));
			 	}
		       } 
			 catch (Exception e) 
			   {
			 		// TODO: handle exception
			 	e.printStackTrace();
			   }
			
		    return eb;
	}

	public void statusChange(Connection con, ExamFormBean eb) {
		// TODO Auto-generated method stub
			  if(eb.getStatus().equalsIgnoreCase("1")) 
			  { 
				  eb.setStatus("2");
			  } 
			  
			try (PreparedStatement pst = con.prepareStatement("update exam_form SET status=? where exam_id=?")) 
			{
				pst.setString(1, eb.getStatus());
				pst.setInt(2, eb.getExam_id());
				pst.executeUpdate();
					
			}
			
			catch (Exception e) 
			{ 
				// TODO: handle exception
				e.printStackTrace();
			}
	        
	        
	}

	public List<ExamFormBean> examFormApprove(String status, Connection con) {
		// TODO Auto-generated method stub
		List<ExamFormBean> examList = new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT * From `exam_form` Where status=? ");
			pst.setString(1,status);
			rs = pst.executeQuery();
			while (rs.next()) {
				ExamFormBean eb = new ExamFormBean();
				eb.setExam_id(rs.getInt("exam_id"));
	        	eb.setStud_photo(rs.getString("stud_photo"));
	        	eb.setFullname(rs.getString("fullname"));
	        	eb.setDob(rs.getString("dob"));
	        	eb.setEnrollment_no(rs.getString("enrollment_no"));
	        	eb.setInstitute_name(rs.getString("institute_name"));
	        	eb.setInstitute_code(rs.getString("institute_code"));
	        	eb.setCourse_name(rs.getString("course_name"));
	        	eb.setSemester(rs.getString("semester"));
	        	eb.setSubject(rs.getString("subject"));
				eb.setStatus(rs.getString("status"));
				examList.add(eb);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return examList;
	}

	public ExamFormBean generateSeat(String exam_id, Connection con) {
		// TODO Auto-generated method stub
		ExamFormBean eb=new ExamFormBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `exam_form` WHERE exam_id=?"))
		 {
			pst.setString(1,exam_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	       	eb.setExam_id(rs.getInt("exam_id"));
	       	eb.setFullname(rs.getString("fullname"));
	       	eb.setDob(rs.getString("dob"));
	       	eb.setEnrollment_no(rs.getString("enrollment_no"));
	       	eb.setInstitute_name(rs.getString("institute_name"));
	       	eb.setCourse_name(rs.getString("course_name"));
	       	eb.setSemester(rs.getString("semester"));
	       	eb.setStatus(rs.getString("status"));
		 	}
	       } 
		  catch (Exception e) 
		  {
		 	e.printStackTrace();
		  }		
		return eb;
	}

	public void saveseat(ExamFormBean eb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `generated_seatno`( `seat_id`,`sid`,`exam_id`,`enrollment_no`,`institute_name`,`course_name`,`semester`,`seat_no`,`seat_status`) VALUES (?,?,?,?,?,?,?,?,?)"))
		{
	    	pst.setInt(1,eb.getSeat_id());
	    	pst.setString(2,eb.getSid());
	 		pst.setInt(3,eb.getExam_id());
	 		pst.setString(4,eb.getEnrollment_no());
	 		pst.setString(5,eb.getInstitute_name());
	 	    pst.setString(6,eb.getCourse_name());
	 	    pst.setString(7,eb.getSemester());
	 	   pst.setString(8,eb.getSeatno());
	 	   pst.setString(9,eb.getSeat_status());
	 		pst.executeUpdate();
	 		try (PreparedStatement upst = con.prepareStatement("update exam_form SET status=? where exam_id=?")) 
			{
				upst.setString(1, "3");
				upst.setInt(2, eb.getExam_id());
				upst.executeUpdate();
					
			}
	 		
	 		pst.close();
	 		con.close();
	 	} catch (Exception e) {
	 		// TODO: handle exception
	 		e.printStackTrace();
	 	}
	 	}

	public List<ExamFormBean> seatList(Connection con) {
		// TODO Auto-generated method stub
		List<ExamFormBean> seatlist = new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT * From `generated_seatno`");
			rs = pst.executeQuery();
			while (rs.next()) {
				ExamFormBean eb = new ExamFormBean();
				eb.setExam_id(rs.getInt("exam_id"));
	        	eb.setEnrollment_no(rs.getString("enrollment_no"));
	        	eb.setInstitute_name(rs.getString("institute_name"));
	        	eb.setCourse_name(rs.getString("course_name"));
	        	eb.setSemester(rs.getString("semester"));
				eb.setSeatno(rs.getString("seat_no"));
				eb.setSeat_status(rs.getString("seat_status"));
				seatlist.add(eb);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return seatlist;
	}

	public List<ExamFormBean> seatListIn(String institute_name, Connection con) {
		// TODO Auto-generated method stub
		List<ExamFormBean> seatlist1 = new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT  gs.*,im.* FROM generated_seatno gs ,institute_master im where gs.institute_name=im.institute_name AND gs.institute_name=?");
			pst.setString(1, institute_name);
			rs = pst.executeQuery();
			while (rs.next()) {
				ExamFormBean eb = new ExamFormBean();
				eb.setExam_id(rs.getInt("exam_id"));
	        	eb.setEnrollment_no(rs.getString("enrollment_no"));
	        	eb.setInstitute_name(rs.getString("institute_name"));
	        	eb.setCourse_name(rs.getString("course_name"));
	        	eb.setSemester(rs.getString("semester"));
				eb.setSeatno(rs.getString("seat_no"));
				seatlist1.add(eb);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return seatlist1;
	}

	public ExamFormBean getExamFormDetails(int sid, Connection con) {
	    ExamFormBean eb = null;

	    try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `exam_form` WHERE `sid`=? ")) {
	        pst.setInt(1, sid);
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            eb = new ExamFormBean();
	            eb.setExam_id(rs.getInt("exam_id"));
	            eb.setEnrollment_no(rs.getString("enrollment_no"));
	            eb.setInstitute_name(rs.getString("institute_name"));
	            eb.setCourse_name(rs.getString("course_name"));
	            eb.setSemester(rs.getString("semester"));
	            eb.setStatus(rs.getString("status"));

	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return eb;
	}

	
	public ExamFormBean printHallTicket(int sid, Connection con) {
	    ExamFormBean eb = null; // Initialize ExamFormBean outside try block
	    try (PreparedStatement pst = con.prepareStatement("SELECT ef.*, gs.* FROM exam_form ef INNER JOIN generated_seatno gs ON ef.sid = gs.sid WHERE ef.sid = ?")) {
	        pst.setInt(1, sid);
	        try (ResultSet rs = pst.executeQuery()) {
	            if (rs.next()) {
	                eb = new ExamFormBean(); // Initialize ExamFormBean inside if statement
	                eb.setExam_id(rs.getInt("exam_id"));
	                eb.setFullname(rs.getString("fullname"));
	                eb.setEnrollment_no(rs.getString("enrollment_no"));
	                eb.setDob(rs.getString("dob"));
	                eb.setCourse_name(rs.getString("course_name"));
	                eb.setInstitute_code(rs.getString("institute_code"));
	                eb.setSeat_id(rs.getInt("seat_id"));
	                eb.setSeatno(rs.getString("seatno"));
	                eb.setSemester(rs.getString("semester"));
	                eb.setStud_photo(rs.getString("stud_photo"));
	                eb.setSubject(rs.getString("subject"));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Print SQL Exception
	    }
	    return eb;
	}
	}

