package com.epayment.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import com.epayment.Bean.StudentBean;
import com.epayment.Bean.SubjectBean;

public class SubjectDao {

	public void saveSubject(SubjectBean subB, Connection con) {
		// TODO Auto-generated method stub
		
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `subject_master`( `sub_id`,`course_name`,`semester`,`subject`,`checkbox`,`sub_status` ) VALUES (?,?,?,?,?,?)")){
	    	pst.setInt(1,0);
	 		pst.setString(2,subB.getCourse_name());
	 		pst.setString(3,subB.getSemester());
	 		pst.setString(4,subB.getSubject());
	 		pst.setString(5,subB.getCheckbox());
	 		pst.setString(6,"1");
	 		pst.executeUpdate();
	 		pst.close();
	 		con.close();
	 	} catch (Exception e) {
	 		// TODO: handle exception
	 		e.printStackTrace();
	 	}
		
	}

	public SubjectBean editSubject(String sub_id, Connection con) {
		SubjectBean subB=new SubjectBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `subject_master` WHERE sub_id=?"))
		 {
			pst.setString(1,sub_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	        	subB.setSub_id(rs.getInt("sub_id"));
	        	subB.setCourse_name(rs.getString("course_name"));
	        	subB.setSemester(rs.getString("semester"));
	        	subB.setSubject(rs.getString("subject"));
	        	subB.setCheckbox(rs.getString("checkbox"));
	        	subB.setSub_status(rs.getString("sub_status"));
	       
		 	}
	       } 
		   catch (Exception e) 
		   {
		 	 e.printStackTrace();
		   }
		return subB;
	}

	public void updateSubject(SubjectBean subB, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `subject_master` set `course_name`=?,`semester`=?,`subject`=? ,`checkbox`=? where sub_id=? "))
		{	
	 		pst.setString(1,subB.getCourse_name());
	 		pst.setString(2,subB.getSemester());
	 		pst.setString(3,subB.getSubject());
	 		pst.setString(4,subB.getCheckbox());
	 		pst.setInt(5, subB.getSub_id());
	 		pst.executeUpdate();
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	public void deleteSubject(String sub_id, String sub_status, Connection con) {
		int sta=0;
		if (sub_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		
		try (PreparedStatement pst=con.prepareStatement("UPDATE `subject_master` SET `sub_status`=? WHERE `sub_id`=?")){
			pst.setInt(1,sta);
			pst.setString(2,sub_id);
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public List<SubjectBean> selectSubjectList(String sub_status, Connection con) {
		List<SubjectBean> subList= new ArrayList();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT * FROM subject_master  WHERE sub_status=? ");
			pst.setString(1, sub_status);
			rs = pst.executeQuery();
			while (rs.next()) {
				SubjectBean subB = new SubjectBean();
				subB.setSub_id(rs.getInt("sub_id"));
				subB.setCourse_name(rs.getString("course_name"));
				subB.setSemester(rs.getString("semester"));
				subB.setSubject(rs.getString("subject"));
				subB.setCheckbox(rs.getString("checkbox"));
				subB.setSub_status(rs.getString("sub_status"));
				subList.add(subB);
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
		return subList;
	}

	public ArrayList<SubjectBean> subList(Connection con) {
		ArrayList<SubjectBean> subList= new ArrayList();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `subject_master`"))
		{
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				SubjectBean subB = new SubjectBean();
				subB.setSub_id(rs.getInt("sub_id"));
				subB.setCourse_name(rs.getString("course_name"));
				subB.setSemester(rs.getString("semester"));
				subB.setSubject(rs.getString("subject"));
				subB.setCheckbox(rs.getString("checkbox"));
				subB.setSub_status("sub_status");
				subList.add(subB);
			}
		} 
		catch (Exception e) 
		{ // TODO: handle exception
			e.printStackTrace();
		}

		return subList;
	}

	public List<SubjectBean> getAjaxSubjectDetails(String course_name, String semester, Connection con) {
		List<SubjectBean> jslist=new ArrayList<SubjectBean>();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `subject_master` where course_name=? and semester=?")){
			pst.setString(1,course_name);
			pst.setString(2,semester);
			/*pst.setString(2, semester);*/
			try(ResultSet rs=pst.executeQuery())
			{
				while (rs.next()) {
					SubjectBean sb=new SubjectBean();
					sb.setSub_id(rs.getInt("sub_id"));
					sb.setCourse_name(rs.getString("course_name"));
					sb.setSemester(rs.getString("semester"));
					sb.setSubject(rs.getString("subject"));	
					sb.setCheckbox(rs.getString("checkbox"));
			       	jslist.add(sb);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return jslist;
	}

}
