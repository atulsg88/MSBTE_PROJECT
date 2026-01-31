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
import com.epayment.Bean.SubjectBean;
import com.epayment.Util.Util;

public class InstituteDao {

	public void saveInstitute(InstituteBean ib, Connection con) {
		// TODO Auto-generated method stub
		   try (PreparedStatement pst=con.prepareStatement("INSERT INTO `institute_master`(`institute_id`, `institute_name`, `institute_code`, `email`, `mobile`, `username`, `password`, `address`, `registerd_date`, `institute_status`) VALUES (?,?,?,?,?,?,?,?,?,?)")){
		    	pst.setInt(1,0);
		 		pst.setString(2,ib.getInstitute_name());
		 		pst.setString(3,ib.getInstitute_code());
		 		pst.setString(4,ib.getEmail());
		 		pst.setString(5,ib.getMobile());
		 		pst.setString(6,ib.getUsername());
		 	    pst.setString(7,ib.getPassword());
		 	    pst.setString(8,ib.getAddress());
		 	    pst.setString(9,new Util().convertDatabaseDate(new Util().todayDate()));
		 	    pst.setString(10,"1");
		 	    pst.executeUpdate();
		 		pst.close();
		 		con.close();
		 	} catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
	}
	public InstituteBean editInstitute(String institute_id, Connection con) {
		// TODO Auto-generated method stub
		 InstituteBean ib=new InstituteBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `institute_master` WHERE institute_id=?"))
		 {
			pst.setString(1,institute_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	       	ib.setInstitute_id(rs.getInt("institute_id"));
	       	ib.setInstitute_name(rs.getString("institute_name"));
	       	ib.setInstitute_code(rs.getString("institute_code"));
	    	ib.setEmail(rs.getString("email"));
	     	ib.setMobile(rs.getString("mobile"));
	     	ib.setUsername(rs.getString("username"));
	       	ib.setPassword(rs.getString("password"));
	       	ib.setAddress(rs.getString("address"));
	       	ib.setRegisterd_date(rs.getString("registerd_date"));
	    	ib.setInstitute_status(rs.getString("institute_status"));
		 	}
	       } 
		   catch (Exception e) 
		   {
		 	 e.printStackTrace();
		   }
		return ib;
	}
	
	public void updateInstitute(InstituteBean ib, Connection con)
	{
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `institute_master` set `institute_name`=?, `institute_code`=?, `email`=?, `mobile`=?, `username`=?,`password`=?, `address`=?, `registerd_date`=? where institute_id=?"))
		{	
	 		pst.setString(1,ib.getInstitute_name());
	 		pst.setString(2,ib.getInstitute_code());
	 		pst.setString(3,ib.getEmail());
	 		pst.setString(4,ib.getMobile() );
	 		pst.setString(5,ib.getUsername());
	 		pst.setString(6,ib.getPassword());
	 		pst.setString(7,ib.getAddress());
	 		pst.setString(8,ib.getRegisterd_date());
	 		pst.setInt(9, ib.getInstitute_id());
	 		pst.executeUpdate();
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public InstituteBean instituteProfile(int institute_id, Connection con) {
		// TODO Auto-generated method stub
		 InstituteBean ib=new InstituteBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `institute_master` WHERE institute_id=?"))
		 {
			pst.setInt(1,institute_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	       	ib.setInstitute_id(rs.getInt("institute_id"));
	       	ib.setInstitute_name(rs.getString("institute_name"));
	       	ib.setInstitute_code(rs.getString("institute_code"));
	    	ib.setEmail(rs.getString("email"));
	     	ib.setMobile(rs.getString("mobile"));
	     	ib.setUsername(rs.getString("username"));
	       	ib.setPassword(rs.getString("password"));
	       	ib.setAddress(rs.getString("address"));
	       	ib.setRegisterd_date(rs.getString("registerd_date"));
	    	ib.setInstitute_status(rs.getString("institute_status"));
		 	}
	       } 
		   catch (Exception e) 
		   {
		 	 e.printStackTrace();
		   }
		return ib;
	}
	

	public JSONObject getInstituteByName(String institute_name, Connection con) {
		JSONObject j=new JSONObject();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `institute_master` where institute_name=?")){
			pst.setString(1,institute_name);
			
			try(ResultSet rs=pst.executeQuery())
			{
				while (rs.next()) {
					j.put("Institute_id",rs.getInt("institute_id"));
					j.put("institute_name",rs.getString("institute_name"));
					j.put("institute_code",rs.getString("institute_code"));
					j.put("email",rs.getString("email"));	
			       	j.put("mobile",rs.getString("mobile"));
			       	j.put("username",rs.getString("username"));	
			       	j.put("password",rs.getString("password"));
			       	j.put("address",rs.getString("address"));
			       	j.put("registerd_date",rs.getString("registerd_date"));
			       	j.put("institute_status",(rs.getString("institute_status")!=null)?rs.getString("institute_status"):"");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return j;
	}
	public void deleteInstitute(String institute_id,String institute_status, Connection con) {
		int sta=0;
		if (institute_status.equalsIgnoreCase("0")) {
			sta=1;
		}
		
		try (PreparedStatement pst=con.prepareStatement("UPDATE `institute_master` SET `institute_status`=? WHERE `institute_id`=?")){
			pst.setInt(1,sta);
			pst.setString(2,institute_id);
			pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public List<InstituteBean> selectInstituteList(String institute_status, Connection con) {
		List<InstituteBean> itList = new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT * FROM institute_master  WHERE institute_status=? ");
			pst.setString(1, institute_status);
			rs = pst.executeQuery();
			while (rs.next()) {
				InstituteBean ib = new InstituteBean();
				ib.setInstitute_id(rs.getInt("institute_id"));
				ib.setInstitute_name(rs.getString("institute_name"));
				ib.setInstitute_code(rs.getString("institute_code"));
				ib.setEmail(rs.getString("email"));
				ib.setMobile(rs.getString("mobile"));
				ib.setAddress(rs.getString("address"));	
				ib.setUsername(rs.getString("username"));	
				ib.setPassword(rs.getString("password"));
				ib.setAddress(rs.getString("address"));	
				ib.setRegisterd_date(new Util().convertUserDate((rs.getString("registerd_date")))) ;
				ib.setInstitute_status(rs.getString("institute_status"));
				itList.add(ib);
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
		return itList;
	}
	public ArrayList<InstituteBean> itList(Connection con) {
		ArrayList<InstituteBean> itList= new ArrayList();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `institute_master`"))
		{
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				InstituteBean ib = new InstituteBean();
				ib.setInstitute_id(rs.getInt("institute_id"));
		       	ib.setInstitute_name(rs.getString("institute_name"));
		       	ib.setInstitute_code(rs.getString("institute_code"));
		    	ib.setEmail(rs.getString("email"));
		     	ib.setMobile(rs.getString("mobile"));
		     	ib.setUsername(rs.getString("username"));
		       	ib.setPassword(rs.getString("password"));
		       	ib.setAddress(rs.getString("address"));
		       	ib.setRegisterd_date(rs.getString("registerd_date"));
		    	ib.setInstitute_status("institute_status");
				itList.add(ib);
			}
		} 
		catch (Exception e) 
		{ // TODO: handle exception
			e.printStackTrace();
		}

		return itList;
	}
	public void resetPassword(InstituteBean ib, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `institute_master` set `password`=? where institute_id=? "))
		{
	 		pst.setString(1,ib.getPassword());
	 		pst.setInt(2, ib.getInstitute_id());
		 	pst.executeUpdate();
		 	pst.close();
		 	con.close();
		 	} catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
	}
}

 


