package com.epayment.Util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.codec.binary.Base64;

public class Util {

	SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat dfdb = new SimpleDateFormat("dd-MM-yyyy");
	SimpleDateFormat dpars = new SimpleDateFormat("yyyy-MM-dd");

	public String convertUserDate(String dt) {
		String cdate = null;
		try {
			cdate = df.format(dpars.parse(dt));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cdate;
	}

	public String convertDatabaseDate(String dt) {
		String cdate = null;
		try 
		{
			cdate = dpars.format(df.parse(dt));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cdate;
	}

	public String todayDate() {
		Date dates = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		return sdf.format(dates);
	}

	public String currentTime() {
		Date date = new Date();
		DateFormat timeformat = new SimpleDateFormat("hh:mm aa");
		String time = timeformat.format(date);
		return time;
	}
	//Image Generation and Image Store
			public String ImageGeneration(String imgsrc)throws IOException
			{
		       String fileType = null;
		       String fileTypeandURL = null;
		       String extension = null;
		       String datetime = null;
		       String image = null; 
		       String image_in_file;
		       String imgnm;
		       
		       image_in_file = imgsrc;
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
			   if (fileType.equalsIgnoreCase("application/pdf")) {
			       extension = "pdf";
			   }
			   if (fileType.equalsIgnoreCase("application/doc")) {
			       extension = "doc";
			   }
			   if (fileType.equalsIgnoreCase("image/ ")) {
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
			  /* String str = reponsePath.substring(0, reponsePath.length() -9);*/ //local
			   String str = reponsePath.substring(0, reponsePath.length() -14);  //server
		       reponsePath = String.valueOf(str) + "epayment_images/";
			   File outDir = new File(reponsePath);
			   outDir.mkdirs();
			   FileOutputStream imageOutFile = new FileOutputStream(reponsePath + imgnm+ "." + extension);
			   imageOutFile.write(imageByteArray);
			   imageOutFile.close();
			   return image=imgnm+"."+extension;	
			}
			
			//delete the image from image folder
			public String ImageDelete(String image)throws IOException
			{
			 String path = this.getClass().getClassLoader().getResource("").getPath();
	         String fullPath = URLDecoder.decode(path, "UTF-8");
	         String[] pathArr = fullPath.split("/WEB-INF/classes/");
	         fullPath = pathArr[0];
	         String reponsePath = "";
	         reponsePath = new File(fullPath).getPath();
	        /* String str = reponsePath.substring(0, reponsePath.length() -9); *///local
	         String str = reponsePath.substring(0, reponsePath.length() -14);
	         reponsePath = String.valueOf(str) + "epayment_images/";
	 		 return reponsePath=reponsePath+image;
			}
			
			public static byte[] decodeImage(String imageDataString) 
		    {
		        return Base64.decodeBase64(imageDataString);
		    }
}
