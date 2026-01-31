package com.epayment.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.epayment.Bean.MSBTEBean;
import com.epayment.Bean.StudentBean;

public class MSBTEDao {

	

	public void saveMsbte(MSBTEBean msb, Connection con) {
		// TODO Auto-generated method stub
		   try (PreparedStatement pst=con.prepareStatement("INSERT INTO `msbte_master`( `msbte_id`, `name`, `email`,`username`, `password`) VALUES (?,?,?,?,?)")){
		    	pst.setInt(1,0);
		 		pst.setString(2,msb.getName());
		 		pst.setString(3,msb.getEmail());
		 		pst.setString(4,msb.getUsername());
		 	    pst.setString(5,msb.getPassword());
		 		pst.executeUpdate();
		 		pst.close();
		 		con.close();
		 	} catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
		
	}
	

	public MSBTEBean editMsbte(String msbte_id, Connection con) {
		// TODO Auto-generated method stub
		MSBTEBean msb=new MSBTEBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `msbte_master` Where msbte_id=?"))
		 {
			pst.setString(1,msbte_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	       	msb.setMsbte_id(rs.getInt("msbte_id"));
	       	msb.setName(rs.getString("name"));
	       	msb.setEmail(rs.getString("email"));
	       	msb.setUsername(rs.getString("username"));
	       	msb.setPassword(rs.getString("password"));
		 	}
	       } 
		   catch (Exception e) 
		   {
		 	 e.printStackTrace();
		   }
		return msb;
	}

	public MSBTEBean MSBTEProfile(int msbte_id, Connection con) {
		// TODO Auto-generated method stub
		MSBTEBean msb=new MSBTEBean();	
		 try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `msbte_master` Where msbte_id=?"))
		 {
			pst.setInt(1,msbte_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	       	msb.setMsbte_id(rs.getInt("msbte_id"));
	       	msb.setName(rs.getString("name"));
	       	msb.setEmail(rs.getString("email"));
	       	msb.setUsername(rs.getString("username"));
	       	msb.setPassword(rs.getString("password"));
		 	}
	       } 
		   catch (Exception e) 
		   {
		 	 e.printStackTrace();
		   }
		return msb;
	}

	public MSBTEBean Msbtedetail(Connection con) {
		// TODO Auto-generated method stub
		MSBTEBean msb=new MSBTEBean();
		try (PreparedStatement pst=con.prepareStatement("SELECT * FROM `msbte_master` "))
		{
			 
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	          msb.setMsbte_id(rs.getInt("msbte_id"));
	       	  msb.setName(rs.getString("name"));
	       	  msb.setEmail(rs.getString("email"));	
	       	  msb.setUsername(rs.getString("username"));	
	          	
		 	 }
	        } 
		catch (Exception e) 
		{
		 		// TODO: handle exception
		 	e.printStackTrace();
		 }
		return msb;
		
	}

	public void updateMsbte(MSBTEBean msb, Connection con)
	{
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `msbte_master` set `name`=?, `email`=?,`username`=?,`password`=? where msbte_id=? "))
		{	
	 		pst.setString(1,msb.getName());
	 		pst.setString(2,msb.getEmail());
	 		pst.setString(3,msb.getUsername());
	 		pst.setString(4,msb.getPassword());
	 		pst.setInt(5, msb.getMsbte_id());
	 		pst.executeUpdate();
		} 
		catch (Exception e)
		{
			// TODO: handle exception
			e.printStackTrace();
		}
	}


	public void resetPassword(MSBTEBean msb, Connection con) {
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `msbte_master` set `password`=? where msbte_id=? "))
		{
	 		pst.setString(1,msb.getPassword());
	 		pst.setInt(2, msb.getMsbte_id());
		 	pst.executeUpdate();
		 	pst.close();
		 	con.close();
		 	} catch (Exception e) {
		 		// TODO: handle exception
		 		e.printStackTrace();
		 	}
	}


	public ArrayList<MSBTEBean> msbList(Connection con) {
		ArrayList<MSBTEBean> msbList= new ArrayList();
		try (PreparedStatement pst = con.prepareStatement("SELECT * FROM `msbte_master`"))
		{
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				MSBTEBean ab = new MSBTEBean();
				ab.setMsbte_id(rs.getInt("msbte_id"));
				ab.setName (rs.getString("name"));
				ab.setEmail(rs.getString("email"));
				ab.setUsername(rs.getString("username"));
				ab.setPassword(rs.getString("password"));
				msbList.add(ab);
			}
		} 
		catch (Exception e) 
		{ // TODO: handle exception
			e.printStackTrace();
		}

		return msbList;
	}
}

 


