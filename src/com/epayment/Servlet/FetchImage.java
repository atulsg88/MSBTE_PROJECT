package com.epayment.Servlet;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epayment.Util.Constant;

@WebServlet("/fetchimage")
public class FetchImage extends HttpServlet
{
  private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = "addv";
		String image = "noimage.gif";

		if ((request.getParameter("type") != null) && (!request.getParameter("type").trim().equals(""))) {
			type = request.getParameter("type");
		}

		if ((request.getParameter("image") != null) && (!request.getParameter("image").trim().equals(""))) {
			image = request.getParameter("image");
		}
		
		if (type.equals("UserPhoto")) {
			String path = this.getClass().getClassLoader().getResource("").getPath();
			String fullPath = URLDecoder.decode(path, "UTF-8");
			String[] pathArr = fullPath.split("/WEB-INF/classes/");
			fullPath = pathArr[0];
			String reponsePath = "";
			reponsePath = new File(fullPath).getPath();
			String str = reponsePath.substring(0, reponsePath.length() - 14);
			reponsePath = String.valueOf(str) + "epayment_images/";
			File outDir = new File(reponsePath);
			outDir.mkdirs();
			String imagePath = String.valueOf(reponsePath) + image;

			OutputStream out = response.getOutputStream();
			File f = new File(imagePath);
			if (!f.exists()) {
				imagePath = Constant.BARCODE + "noimage.gif";
			}
			FileInputStream fin = null;
			BufferedInputStream fBuf = null;
			try {
				fin = new FileInputStream(imagePath);
				fBuf = new BufferedInputStream(fin);
				int BufferLen = 2048;
				byte[] buf = new byte[2048];
				int bytesRead;
				while (-1 != (bytesRead = fBuf.read(buf, 0, buf.length))) {

					out.write(buf, 0, bytesRead);
				}

				if (out != null) {
					out.flush();
					out.close();
				}
			} catch (FileNotFoundException fnfe) {
				fnfe.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (fBuf != null) {
					fBuf.close();
				}
				if (fin != null)
					fin.close();
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}