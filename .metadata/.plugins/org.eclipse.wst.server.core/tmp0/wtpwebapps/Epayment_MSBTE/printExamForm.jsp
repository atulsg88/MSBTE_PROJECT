<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.epayment.Bean.ExamFormBean"%>
<%@page import="com.epayment.Bean.InstituteBean"%>
<%@page import="com.epayment.Bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.SubjectBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%JSONObject jobj=(JSONObject)request.getAttribute("jobj");%> 
<%@ include file="allcss.jsp" %>
 <title>Exam Form </title>

<style type="text/css">
@media print {
    #printButtonContainer {
        display: none;
    }
}</style>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
    <!-- header start -->
    <%@ include file="header.jsp" %>
    <!-- header end -->
   <!--Main container start -->
	
		<div class="col-lg-12 m-b30">
			<div class="widget-box">
			
			<div class="widget-inner">			     
				<table class="table table-bordered" style="color: black">
                
                <tr>
                <td>
                    <h4 style="text-align: center;">Maharashtra State Board of Technical Education, Mumbai.</h4>
                    <br>
                    <h4 style="text-align: center;">Exam Form</h4>
                 </td>
                 </table>
                 <table class="table table-bordered" style="color: black">
                   <hr style="border: 0.9px solid grey;">
                <tr>
						<td>
							<h5>ENROLLMENT NUMBER :<%=(jobj!=null)?jobj.get("enrollment_no"):""%></h5>
						</td>
						<td>
							<h5>INSTITUTE CODE :<%=(jobj!=null)?jobj.get("institute_code"):""%></h5>
						</td>
			         </tr>
			         <tr>
						<td>
							<h5>CANDIDATE NAME :<%=(jobj!=null)?jobj.get("fullname"):""%></h5>
						</td>
						<td>
							<h5>Date of Bith:<%=(jobj!=null)?jobj.get("dob"):""%></h5>
						</td>
                     </tr>
			         <tr>
						<td>
							<h5>Institute CODE & NAME :<%=(jobj!=null)?jobj.get("institute_code"):""%> & <%=(jobj!=null)?jobj.get("institute_name"):""%></h5>
						</td>
						
						
			        </tr>
                    <tr>
						<td>
							<h5>PROGRAM/COURSE NAME :<%=(jobj!=null)?jobj.get("course_name"):""%></h5>
						</td>
			        </tr>
                    <tr>
						<td>
							<h5>COURSE/YEAR-SCHEME :<%=(jobj!=null)?jobj.get("semester"):""%></h5>
						</td>
			        </tr>
			        <tr>
					   <td>
						<h5>PAYMENT MODE :<%=(jobj!=null)?jobj.get("payment"):""%></h5>
					   </td>
					   <td><img alt="" src="fetchimage?type=UserPhoto&image=<%=(jobj.get("stud_photo")!=null)?jobj.get("stud_photo"):""%>"> </td>
			        </tr>
			   
			        <tr>
					<td>
					<h5>SUBJECT APPEARING FOR :
					<%
					if(jobj!=null)
					{int i=0;
					JSONArray jarray=new JSONArray(jobj.getString("details"));
					for(i=0;i<jarray.length();i++)
					{
						JSONObject job=jarray.getJSONObject(i);	
					%>
					<%=(job!=null)?job.get("subject"):""%> <br>
					<%}}%>
					</h5>
					</td>
			   </tr>
              
			   </table>
			   
			     <table class="table table-bordered" style="color: black">
               <tr>
						<td>
							<h5 style="text-align: left;">Attested By<br><br>Principal/HOD:-<br><br>Sign and stamp
							</h5>
						</td>	
			   </tr>
			   <tr>
			    
						<td>
							<h5>Date: <span id="currentDate"></span></h5>
						</td>
			   </table>
			   <div id="printButtonContainer">
                  <button type="button" class="btn btn-primary" id="print" onclick="window.print();">Print</button>
	          </div>
			 </div>
		   </div>
		</div>
	</main>
<%@include file="alljs.jsp" %>
</body>
<script>
        // Get current date
        var currentDate = new Date();

        // Format date as YYYY-MM-DD
        var formattedDate = currentDate.getDate() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getFullYear();

        // Display formatted date
        document.getElementById('currentDate').innerHTML = formattedDate;
    </script>
<script type="text/javascript">
     function getSubjectDetails() {	
     var course_name=document.getElementById("course_name").value;
     var semester=document.getElementById("semester").value;
     $("#subject tr").remove();
     if(course_name!=='' && semester!==''){
	       $.ajax({
	          url:"ExamForm?action=getFormDetails&course_name="+course_name+"&semester="+semester,
	       	   success:function(result){
	       		$.each(result, function(i, subject) {
	       		 var sub_choice= result[i].checkbox;
       			 $('<tr>').html("<td style=font-size:15px;>" + result[i].subject + "</td> <td><input type='checkbox' value='TH'></td> <td><input type='checkbox' value='TW'></td> <td><input type='checkbox' value='PR'></td> <td><input type='checkbox' value='OR'></td> <td><input type='checkbox' value='SW'></td> <td><input type='checkbox' value='TM'></td> <td><input type='checkbox' value='PM'></td>").appendTo('#subject');
	       		});
	       	   } 
	          });
           }
           
	   } 
 </script> 
</html>