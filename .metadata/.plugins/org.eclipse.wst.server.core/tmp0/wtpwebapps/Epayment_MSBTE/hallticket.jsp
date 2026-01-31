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

<%
ExamFormBean print =(ExamFormBean)request.getAttribute("print");
if (print != null) {
%> 
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
                    <h4 style="text-align: center;">Hall Ticket For - SUMMER 2024 Exam</h4>
                 </td>
                 </table>
                 <table class="table table-bordered" style="color: black">
                </tr>
                   <hr style="border: 0.9px solid grey;">
                <tr>
						<td>
							<h5>ENROLLMENT NUMBER :<%=print.getEnrollment_no() %></h5>
						</td>
						<td>
							<h5>INSTITUTE CODE :<%=print.getInstitute_code() %></h5>
						</td>
						<td>
							<h5>SEAT NO.:<%=print.getSeatno()%></h5>
						</td>
			   </tr>
			   <tr>
						<td>
							<h5>CANDIDATE NAME</h5>
						</td>
						<td>
							<h5><%=print.getFullname()%></h5>
						</td>
						 <td rowspan="3">
  
                            <img src="path_to_your_image.jpg" alt="Image description">
                            </td>

			    <tr>
						<td>
							<h5>EXAM CENTER CODE & NAME</h5>
						</td>
						<td>
							<h5><%=print.getInstitute_code() + " " + print.getInstitute_name() %></h5>
						</td>
						
			   </tr>
               <tr>
						<td>
							<h5>PROGRAM/COURSE NAME</h5>
						</td>
						<td>
							<h5><%=print.getCourse_name()%></h5>
						</td>
					
			   </tr>
               <tr>
						<td>
							<h5>COURSE/YEAR-SCHEME</h5>
						</td>
						<td colspan="2">
							<h5><%=print.getSemester() %></h5>
						</td>
						
			   </tr>
               <tr>
						<td>
							<h5>SUBJECT APPEARING FOR</h5>
						</td>
						<td colspan="2">
							<h5></h5>
						</td>
						
			   </tr>
			   </table>
			   <table class="table table-bordered" style="color: black">
			     <td>
                    <h4 style="text-align: center;">Instructions</h4>
			     </td>
			     </table>
			     
			     <table class="table table-bordered" style="color: black">
                  <tr>
                  <td>
                   <h5>1. This Hall Ticket is not the blanket permission to appear for the Examination. It shall not hold valid if you do not fulfil any condition in any clause under RG6. Despite if you appear for Examination, your performance shall be cancelled at any stage, later.<br>
2. You must be present at the Center 10 minutes before the commencement of the Examination.<br>
3. You will not be admitted to Examination hall after 30 minutes from the commencement of the Examination.<br>
4. Examinees are not permitted to leave examination hall in the initial 30 minutes and last 10 minutes of the paper duration. If examinee leaving theexamination Hall before the end of examination examinee shall submit the question paper along with the answer book.<br>
5. If you fail to produce this Hall Ticket, you will not be allowed to appear for Examination.<br>
6. You should carry valid identity card issued by institute at the time of Examination.<br>
7. You should verify your details on Hall Ticket. Any discrepancy, if found, should be informed to the Institute, immediately.<br>
8. The examinee is prohibited from keeping in his possession in the examination hall any blank paper, notes, scribbles, chits, book/s, mobile phone,programmable calculator, electronic communication devices etc. The violation of this instruction shall attract suitable punitive action as per RG-12. ReferExamination regulation RG-12 (Annexure-I&II)<br>
9. The photograph of the Candidate is printed. If it is pasted externally, it must be attested by Institute with seal and signature of Principal.<br>
10. If the photograph of the Candidate does not bear his/her signature , he/she(the Candidate) should sign infront of the Principal.<br>
                   </h5> 
                   </td>
                   </tr>
			 </table>
			 <br>
			 <br>
			 
			   <table class="table table-bordered" style="color: black">
			     <td>
                    <h4 style="text-align: center;">Instructions For Examination Centres</h4>
			     </td>
			     </table>
			     
			      <table class="table table-bordered" style="color: black">
			     <td>
                   <h5> 1. The Examination center should necessarily obtain and refer the list of disallowed Candidates of the Institute before allowing the Candidates to appear for
Examination. "No report (even NIL) is received from Institute" shall not be the reason to neglect the Instruction.<br>
2. If the subject for which the Candidate is required to appear is missing on Hall Ticket, the Candidate should be allowed on receiving his/her application.
			     </h5>
			     </td>
			     </table>
			     <table class="table table-bordered" style="color: black">
			      <tr>
						
						<td rowspan="2">
							<h5>Seal of institute</h5>
						</td>
						<td>
							<h5 style="text-align: center;">Dr. Mahendra R. Chitlange<br>Secretary<br>M.S.Board of Technical Education</h5>
						</td>
						
			   </tr>
               <tr>
						<td>
							<h5 style="text-align: left;">Attested By<br><br>Principal/HOD:-<br><br>Sign and stamp
							</h5>
						</td>	
			   </tr>
			   <tr>
			    
						<td>
							<h5>Date: <span id="currentDate"></h5>
						</td>
						<td>
							<h5>Url:-https://online.msbte.co.in: 443</h5>
						</td>
			   </table>
			   <div id="printButtonContainer ">
                  <button type="button" class="btn btn-primary" id="print" onclick="window.print();">Print</button>
	          </div>
			 </div>
		   </div>
		</div>
	</main>
<%@include file="alljs.jsp" %>
</body>
<%
}
%>

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
 <script>
        // Get current date
        var currentDate = new Date();

        // Format date as YYYY-MM-DD
        var formattedDate = currentDate.getDate() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getFullYear();

        // Display formatted date
        document.getElementById('currentDate').innerHTML = formattedDate;
    </script> 
</html>