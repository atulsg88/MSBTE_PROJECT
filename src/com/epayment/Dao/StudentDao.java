package com.epayment.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Util.Util;

public class StudentDao {

	public void savestud(StudentBean sb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `student_master`( `sid`, `fullname`, `mobile`, `email`,`address`,`dob`,`course_name`,`institute_name`,`institute_code`,`username`, `password`,`enrollment`,`stud_photo`,`stud_status`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)"))
		{
	    	pst.setInt(1,0);
	 		pst.setString(2,sb.getFullname());
	 		pst.setString(3,sb.getMobile());
	 		pst.setString(4,sb.getEmail());
	 		pst.setString(5,sb.getAddress());
	 		pst.setString(6,sb.getDob());
	 		pst.setString(7,sb.getCourse_name());
	 		pst.setString(8,sb.getInstitute_name());
	 		pst.setString(9,sb.getInstitute_code());
	 	    pst.setString(10,sb.getUsername());
	 	    pst.setString(11,sb.getPassword());
	 	    pst.setString(12,sb.getEnrollment());
	 	    pst.setString(13,sb.getStud_photo());
	 	    pst.setString(14,"1");
	 		pst.executeUpdate();
	 		pst.close();
	 		con.close();
	 	} catch (Exception e) {
	 		// TODO: handle exception
	 		e.printStackTrace();
	 	}
	}

	

	public StudentBean editStudent(String sid, Connection con) {
		// TODO Auto-generated method stub
		StudentBean sb=new StudentBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `student_master` WHERE sid=?"))
		 {
			pst.setString(1,sid);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	       	  sb.setSid(rs.getInt("sid"));
	       	  sb.setFullname(rs.getString("fullname"));
	     	  sb.setMobile(rs.getString("mobile"));
	          sb.setEmail(rs.getString("email"));
	          sb.setAddress(rs.getString("address"));
	          sb.setDob(rs.getString("dob"));
	          sb.setCourse_name(rs.getString("course_name"));
	          sb.setInstitute_name(rs.getString("institute_name"));
	          sb.setInstitute_code(rs.getString("institute_code"));
	       	  sb.setUsername(rs.getString("username"));
	       	  sb.setPassword(rs.getString("password"));
	       	  sb.setEnrollment(rs.getString("enrollment"));
	       	  sb.setStud_photo(rs.getString("stud_photo"));
	       	  sb.setStud_status(rs.getString("stud_status"));
		 	}
	       } 
		 catch (Exception e) 
		   {
		 		// TODO: handle exception
		 	e.printStackTrace();
		   }
		
	    return sb;
	 }
	
	public StudentBean StudentProfile(int sid, Connection con) {
		// TODO Auto-generated method stub
		StudentBean sb=new StudentBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `student_master` WHERE sid=?"))
		 {
			pst.setInt(1,sid);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	       	  sb.setSid(rs.getInt("sid"));
	       	  sb.setFullname(rs.getString("fullname"));
	     	  sb.setMobile(rs.getString("mobile"));
	          sb.setEmail(rs.getString("email"));
	          sb.setAddress(rs.getString("address"));
	          sb.setDob(rs.getString("dob"));
	          sb.setCourse_name(rs.getString("course_name"));
	          sb.setInstitute_name(rs.getString("institute_name"));
	          sb.setInstitute_code(rs.getString("institute_code"));
	       	  sb.setUsername(rs.getString("username"));
	       	  sb.setPassword(rs.getString("password"));
	          sb.setEnrollment(rs.getString("enrollment"));
	       	  sb.setStud_photo(rs.getString("stud_photo"));
	       	  sb.setStud_status(rs.getString("stud_status"));
		 	}
	       } 
		 catch (Exception e) 
		   {
		 		// TODO: handle exception
		 	e.printStackTrace();
		   }
		
	    return sb;
	 }

	public void updateStudent(StudentBean sb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `student_master` set `fullname`=?, `mobile`=?, `email`=?,`address`=?,`dob`=?,`course_name`=?,`institute_name`=?,`institute_code`=?,`username`=?,`password`=?,`stud_photo`=? ,`stud_status`=? where sid=? "))
		{	
	 		pst.setString(1,sb.getFullname());
	 		pst.setString(2,sb.getMobile());
	 		pst.setString(3,sb.getEmail());
	 		pst.setString(4,sb.getAddress());
	 		pst.setString(5,sb.getDob());
	 		pst.setString(6,sb.getCourse_name());
	 		pst.setString(7,sb.getInstitute_name());
	 		pst.setString(8,sb.getInstitute_code());
	 	    pst.setString(9,sb.getUsername());
	 	    pst.setString(10,sb.getPassword());
	 	    pst.setString(11, sb.getEnrollment());
	 	    pst.setString(12, sb.getStud_photo());
	 	    pst.setString(13,sb.getStud_status());
	 		pst.setInt(14,sb.getSid());
	 		pst.executeUpdate();
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void deleteStudent(String sid, String stud_status, Connection con) {
		int sta=0;
		if (stud_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		
		try (PreparedStatement pst=con.prepareStatement("UPDATE `student_master` SET `stud_status`=? WHERE `sid`=?")){
			pst.setInt(1,sta);
			pst.setString(2,sid);
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public List<StudentBean> selectStudentList(String stud_status, Connection con) {
		List<StudentBean> studList = new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT * FROM student_master  WHERE stud_status=? ");
			pst.setString(1, stud_status);
			rs = pst.executeQuery();
			while (rs.next()) {
				StudentBean sb = new StudentBean();
				sb.setSid(rs.getInt("sid"));
				sb.setFullname(rs.getString("fullname"));
				sb.setMobile(rs.getString("mobile"));
				sb.setEmail(rs.getString("email"));
				sb.setAddress(rs.getString("address"));
				sb.setDob(new Util().convertUserDate((rs.getString("dob"))));
				sb.setCourse_name(rs.getString("course_name"));
				sb.setInstitute_name(rs.getString("institute_name"));
				sb.setInstitute_code(rs.getString("institute_code"));
				sb.setUsername(rs.getString("username"));
				sb.setPassword(rs.getString("password"));
				sb.setEnrollment(rs.getString("enrollment"));
		       	sb.setStud_photo(rs.getString("stud_photo"));
				sb.setStud_status(rs.getString("stud_status"));
				studList.add(sb);
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
		return studList;
	}
	
	public ArrayList<StudentBean> studList(Connection con) {
		// TODO Auto-generated method stub
		ArrayList<StudentBean> studList= new ArrayList();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `student_master`"))
		{
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				StudentBean sb = new StudentBean();
				sb.setSid(rs.getInt("sid"));
				sb.setFullname(rs.getString("fullname"));
				sb.setMobile(rs.getString("mobile"));
				sb.setEmail(rs.getString("email"));
				sb.setAddress(rs.getString("address"));
				sb.setDob(rs.getString("dob"));
				sb.setCourse_name(rs.getString("course_name"));
				sb.setInstitute_name(rs.getString("institute_name"));
				sb.setInstitute_code(rs.getString("institute_code"));
				sb.setUsername(rs.getString("username"));
				sb.setPassword(rs.getString("password"));
		       	sb.setStud_photo(rs.getString("stud_photo"));
				sb.setStud_status("stud_status");
				studList.add(sb);
			}
		} 
		catch (Exception e) 
		{ // TODO: handle exception
			e.printStackTrace();
		}

		return studList;
	}



	public void resetPassword(StudentBean sb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `student_master` set `password`=? where sid=? "))
		{
	 		pst.setString(1,sb.getPassword());
	 		pst.setInt(2, sb.getSid());
		 	pst.executeUpdate();
		 	pst.close();
		 	con.close();
		 	} catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
	}



	public JSONObject getStudentByName(String fullname, Connection con) {
		JSONObject j=new JSONObject();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `student_master` where fullname=?")){
			pst.setString(1,fullname);
			
			try(ResultSet rs=pst.executeQuery())
			{
				while (rs.next()) {
					j.put("sid",rs.getInt("sid"));
					j.put("fullname",rs.getString("fullname"));
					j.put("mobile",rs.getString("mobile"));
					j.put("email",rs.getString("email"));	
			       	j.put("mobile",rs.getString("mobile"));
			       	j.put("address",rs.getString("address"));
					j.put("dob",rs.getString("dob"));
					j.put("course_name",rs.getString("course_name"));
					j.put("institute_name",rs.getString("institute_name"));
					j.put("institute_code",rs.getString("institute_code"));
			       	j.put("username",rs.getString("username"));	
			       	j.put("password",rs.getString("password"));
			       	j.put("stud_status",(rs.getString("stud_status")!=null)?rs.getString("stud_status"):"");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return j;
	}
}


