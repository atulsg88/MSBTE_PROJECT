package com.epayment.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.epayment.Bean.NoticeDocBean;
import com.epayment.Bean.StudentBean;
import com.epayment.Util.Util;

public class NoticeDocDao {

	public void savenotice(NoticeDocBean nb, Connection con)
	{
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("INSERT INTO `notice_doc`(`noticedoc_id`,`noticedoc_name`,`noticedoc_img`,`noticedoc_status`) VALUES (?,?,?,?)")){
    	pst.setInt(1,0);
 		pst.setString(2,nb.getNoticedoc_name());
		pst.setString(3,nb.getNoticedoc_img());
 		pst.setString(4,nb.getNoticedoc_status());
 		pst.executeUpdate();
 		pst.close();
 		con.close();
	 	}catch(Exception e) 
		{
 		e.printStackTrace();
	 	}
	}

	public void updatenotice(NoticeDocBean nb, Connection con) 
	{
		// TODO Auto-generated method stub
		try (PreparedStatement pst=con.prepareStatement("update `notice_doc` set `noticedoc_name`=?, `noticedoc_img`=?, `noticedoc_status`=? where noticedoc_id=? "))
		{	
		pst.setString(1,nb.getNoticedoc_name());
 		pst.setString(2,nb.getNoticedoc_img());
 		pst.setString(3,nb.getNoticedoc_status());
 		pst.setInt(4,nb.getNoticedoc_id());
 		pst.executeUpdate();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	public NoticeDocBean editNotice(String noticedoc_id, Connection con) 
	{
		// TODO Auto-generated method stub
		 NoticeDocBean nb=new NoticeDocBean();	
		 try(PreparedStatement pst=con.prepareStatement("SELECT * FROM `notice_doc` WHERE noticedoc_id=?"))
		 {
			pst.setString(1,noticedoc_id);
		    ResultSet rs = pst.executeQuery();
	        while(rs.next())
	        {
	    	nb.setNoticedoc_id(rs.getInt("noticedoc_id"));
	    	nb.setNoticedoc_name(rs.getString("noticedoc_name"));
	    	nb.setNoticedoc_img(rs.getString("noticedoc_img"));
	    	nb.setNoticedoc_status(rs.getString("noticedoc_status"));
		 	}
	      } 
		  catch (Exception e) 
		  {
		 	e.printStackTrace();
		  }
	      return nb;
	 }
	
	public List<NoticeDocBean> selectNoticeList(String noticedoc_status, Connection con) {
		List<NoticeDocBean> ndList = new ArrayList<>();
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			pst = con.prepareStatement("SELECT * FROM notice_doc WHERE noticedoc_status=? ");
			pst.setString(1, noticedoc_status);
			rs = pst.executeQuery();
			while (rs.next()) {
			NoticeDocBean nb = new NoticeDocBean();
			nb.setNoticedoc_id(rs.getInt("noticedoc_id"));
			nb.setNoticedoc_name(rs.getString("noticedoc_name"));
			nb.setNoticedoc_img(rs.getString("noticedoc_img"));
			nb.setNoticedoc_status(rs.getString("noticedoc_status"));
			ndList.add(nb);
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
		return ndList;
	}
}
