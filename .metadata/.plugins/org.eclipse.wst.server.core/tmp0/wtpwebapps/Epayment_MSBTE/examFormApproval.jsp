<%@page import="com.epayment.Bean.ExamFormBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.InstituteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="allcss.jsp" %>
<title>Institute List</title>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">

<!-- header start -->
	<header class="ttr-header">
		<div class="ttr-header-wrapper">
			<!--sidebar menu toggler start -->
			<div class="ttr-toggle-sidebar ttr-material-button">
				<i class="ti-close ttr-open-icon"></i>
				<i class="ti-menu ttr-close-icon"></i>
			</div>
			<!--sidebar menu toggler end -->
			<!--logo start -->
			<div class="ttr-logo-box">
				<div>
					<a href="Home?action=Dashboard" class="ttr-logo">
						<img class="ttr-logo-desktop" alt="" src="assets/images/msbte logo.png" width="160" height="27">
					</a>
				</div>
			</div>
		</div>
	</header>
	<!-- header end -->
		<!-- Left sidebar menu start -->
	<div class="ttr-sidebar">
		<div class="ttr-sidebar-wrapper content-scroll">
			<!-- side menu logo start -->
			<div class="ttr-sidebar-logo">
				<a href="#"><img alt="" src="assets/images/msbte logo.png" width="122" height="27"></a>
			</div>
			<!-- side menu logo end -->
			<!-- sidebar menu start -->
		<%@ include file="instituteOption.jsp" %>
			<!-- sidebar menu end -->
		</div>
	</div>
	<!-- Left sidebar menu end -->
	<!--Main container start -->
	<main class="ttr-wrapper">
		<div class="container-fluid">
			<div class="db-breadcrumb">
				<h4 class="breadcrumb-title">Dashboard</h4>
				<ul class="db-breadcrumb-list">
					<li>Institute List</li>
				</ul>
			</div>
		</div>	
	

		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					
					<div class="panel-body">
						<div class="col-md-12">	
								<div class=" text-right">
								<a class="btn btn-info" onclick="printData()">Print</a> 								
								</div><br>
								<div class="col-lg-6">
								<input id="search" type="text" placeholder="Search.." class="form-control">
								</div>
								<br>
								
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th style="width:5%">Sr.No</th>
											<th>Exam_Form_No</th>
											<th >Full Name</th>
											<th >Date_Of_Birth</th>
											<th>Enrollment_No</th>
											<th>Institute_Name</th>
											<th>course_name</th>
											<th>semester</th>
											<th>Status</th>
											<th >Action</th>
										    <th >Status Change</th>
										</tr>
									</thead>
						           <tbody id="myTable">
									
									<%ArrayList<ExamFormBean> examList = (ArrayList<ExamFormBean>)request.getAttribute("examList"); 
									 if (examList == null) 
					                  {
					                   	examList = new ArrayList<ExamFormBean>();
					                  }%>
									<%
										int i = 1;
										for (ExamFormBean bn : examList) {
											if(bn.getStatus().equalsIgnoreCase("1"))
											{  				 
									%>     
										<tr >
											 	 <td><%=i++ %></td>
											 	 <td><%=bn.getExam_id() %>
                                                 <td><%=bn.getFullname() %></td>
                                                 <td><%=bn.getDob() %></td>  
                                                 <td><%=bn.getEnrollment_no() %></td>
                                                 <td><%=bn.getInstitute_name()%></td>
                                                 <td><%=bn.getCourse_name() %></td>
                                                 <td><%=bn.getSemester() %></td>
                                                 <td><%=(bn.getStatus().equals("1"))?"Complete":"Approved"%></td>
											<td class="actions">
												<a href="ExamForm?action=editExamForm&exam_id=<%=bn.getExam_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Exam"></i></a>
												<%-- <a href="StudentLeaveAppServlet?action=deletestudentleave&sidl=<%=bn.getSidl() %> &status=<%=bn.getStatus() %>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Exam" onclick="return confirm('Are you sure you want to Deactivate this Student Exam Form?')"></i></a> --%>
											</td>
											 <td style="text-align: center;">
                                                 <button type="button" class="btn btn-success" style="padding: 6px;">
                                                          <a href="ExamForm?action=statusChange&exam_id=<%=bn.getExam_id()%>&status=<%=bn.getStatus()%>">Approve</a>
                                                  </button>
                                             </td>
										</tr>
										 <%}} %>	
									</tbody>
									</table>
									 <tr><td colspan="12"><hr style="border: 0.9px solid grey;"></td></tr>
						           <table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th style="width:5%">Sr.No</th>
											<th>Exam_Form_No</th>
											<th >Full Name</th>
											<th >Date_Of_Birth</th>
											<th>Enrollment_No</th>
											<th>Institute_Name</th>
											<th>course_name</th>
											<th>semester</th>
											<th>Status</th>
											<th >Action</th>
										    <th >Status Change</th>
										</tr>
									</thead>
						           <tbody id="myTable">
			                        
			                        <%
										int j = 1;
										for (ExamFormBean bn : examList) {
											if(bn.getStatus().equalsIgnoreCase("2"))
											{  				 
									%> 
										<tr >
											     <td><%=i++ %></td>
											 	 <td><%=bn.getExam_id() %></td>
                                                 <td><%=bn.getFullname() %></td>
                                                 <td><%=bn.getDob() %></td>  
                                                 <td><%=bn.getEnrollment_no() %></td>
                                                 <td><%=bn.getInstitute_name()%></td>
                                                 <td><%=bn.getCourse_name() %></td>
                                                 <td><%=bn.getSemester() %></td>
                                                 <td><%=(bn.getStatus().equals("2"))?"Approved":"Generated"%></td>
											<td class="actions">
												<a href="" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Exam"></i></a>
												<%-- <a href="StudentLeaveAppServlet?action=deletestudentleave&sidl=<%=bn.getSidl() %> &status=<%=bn.getStatus() %>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Exam" onclick="return confirm('Are you sure you want to Deactivate this Student Exam Form?')"></i></a> --%>
											</td>
											 <td style="text-align: center;">
                                                 <button type="button" class="btn btn-success" style="padding: 6px;" disabled="disabled">
                                                          <a href="ExamForm?action=statusChange&exam_id=<%=bn.getExam_id()%>&status=<%=bn.getStatus()%>">Approve</a>
                                                  </button>
										</tr>
										 <%}} %>	
									</tbody>
									</table>
							</div>	
						</div>	
					</div>
					</div>
				</div>
			</div>
	</main>
	

<%@include file="alljs.jsp" %>
</body>
<script>
$(document).ready(function(){
  $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script type="text/javascript">
function printData()
{
   var divToPrint=document.getElementById("datatable-editable");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML); 
   newWin.print();
   newWin.close();
}
</script>
</html>