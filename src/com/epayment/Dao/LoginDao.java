package com.epayment.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.epayment.Bean.InstituteBean;
import com.epayment.Bean.MSBTEBean;
import com.epayment.Bean.StudentBean;

public class LoginDao {


	public MSBTEBean getMsbteByLoginDetails(String username, String password, Connection con) {
		// TODO Auto-generated method stub
		 MSBTEBean ab=null;
			
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `msbte_master` WHERE `username`=? and `password`=?")){
			 pst.setString(1,username);
			 pst.setString(2,password);
		     ResultSet rs = pst.executeQuery();
	        while(rs.next()){
	       	ab=new MSBTEBean();
	       	ab.setUsername(rs.getString("username"));
	       	ab.setPassword(rs.getString("password"));
	       	ab.setMsbte_id(rs.getInt("msbte_id"));
		 	}
	        } catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
		return ab;
		
	}
	
	public MSBTEBean getMSBTEByUsernameDetails(String username, Connection con) {
		MSBTEBean ab=null;
			try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `msbte_master` WHERE `username`=? "))
			{
				 pst.setString(1,username);
			     ResultSet rs = pst.executeQuery();
		         while(rs.next())
		         {
		         ab=new MSBTEBean();
		       	 ab.setUsername(rs.getString("username"));
		       	 ab.setMsbte_id(rs.getInt("msbte_id"));
			     }
		     } 
			catch (Exception e) 
			{
			   e.printStackTrace();
			}
			return ab;
	}
	

	public InstituteBean getInstituteByLoginDetails(String username, String password, Connection con) 
	{
		// TODO Auto-generated method stub
		InstituteBean ib=null;
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `institute_master` WHERE `username`=? and `password`=?"))
		{
			pst.setString(1,username);
			pst.setString(2,password);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next()){
	       	ib=new InstituteBean();
	        
	       	ib.setUsername(rs.getString("username"));
	       	ib.setPassword(rs.getString("password"));
	       	ib.setInstitute_id(rs.getInt("institute_id"));
	       	ib.setInstitute_name(rs.getString("institute_name"));
		 	}
	        } catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
		return ib;
	}
	public InstituteBean getInstituteByUsernameDetails(String username,
			Connection con) {
		InstituteBean ib=null;
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `institute_master` WHERE `username`=? "))
		{
			 pst.setString(1,username);
		     ResultSet rs = pst.executeQuery();
	         while(rs.next())
	         {
	        	 ib=new InstituteBean();
	        	 ib.setUsername(rs.getString("username"));
	        	 ib.setInstitute_id(rs.getInt("institute_id"));
		     }
	     } 
		catch (Exception e) 
		{
		   e.printStackTrace();
		}
		return ib;
	}

	
	public StudentBean getStudentByLoginDetails(String username, String password, Connection con) 
	{
		// TODO Auto-generated method stub
		StudentBean sb=null;
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `student_master` WHERE `username`=? and `password`=?"))
		{
			pst.setString(1,username);
			pst.setString(2,password);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next()){
	       	sb=new StudentBean();
	        
	       	sb.setUsername(rs.getString("username"));
	       	sb.setPassword(rs.getString("password"));
	       	sb.setSid(rs.getInt("sid"));
		 	}
	        } catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
		return sb;
	}

	public StudentBean getStudentByUsernameDetails(String username,
			Connection con) {
		StudentBean sb=null;
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `student_master` WHERE `username`=? "))
		{
			 pst.setString(1,username);
		     ResultSet rs = pst.executeQuery();
	         while(rs.next())
	         {
	        	 sb=new StudentBean();
	        	 sb.setUsername(rs.getString("username"));
	        	 sb.setSid(rs.getInt("sid"));
		     }
	     } 
		catch (Exception e) 
		{
		   e.printStackTrace();
		}
		return sb;
	}
		
}
