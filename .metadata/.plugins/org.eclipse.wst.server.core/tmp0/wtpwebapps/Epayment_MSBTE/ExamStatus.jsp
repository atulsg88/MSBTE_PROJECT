<%@page import="com.epayment.Bean.ExamFormBean"%>
<%@page import="com.epayment.Bean.InstituteBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="allcss.jsp" %>
<title>Student List</title>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">

<%StudentBean sb= new StudentBean();%>
<%InstituteBean ib=(InstituteBean)request.getAttribute("ib");%>
<%ExamFormBean eb=(ExamFormBean)request.getAttribute("ebs");%>

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
					<a href="index.jsp" class="ttr-logo">
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
				<a href="Home?action=Dashboard"><img alt="" src="assets/images/msbte logo.png" width="122" height="27"></a>
			</div>
			<!-- side menu logo end -->
			<!-- sidebar menu start -->
		 <%@ include file="studentOption.jsp" %>
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
					<li>Exam Form Status</li>
				</ul>
			</div>
		</div>	
	
	
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-12">			
								<br><br><br>
			                     <br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" cellspacing="0" rules="all" border="1"  id="datatable-editable">
									<thead>
										<tr>
											<th >Full Name</th>
											<th >Dob</th>
											<th>Course_Name</th>
											<th>Semester</th>
											<th>Payment</th>
											<th>Enrollment</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									<%
                                       if (eb != null) { // Check if eb is not null
                                   %>
									<tr>
											 	<td><%=eb.getFullname()%></td>
                                                <td><%=eb.getDob()%></td>
												<td><%=eb.getCourse_name()%></td>
												<td><%=eb.getSemester()%></td>
												<td><%=eb.getPayment() %></td>
												<td><%=eb.getEnrollment_no()%></td>                                                 
                                                 <td><%=(eb.getStatus().equals("1"))?"Completed":"Approved"%></td>
                                                 <td><button class="btn btn-info"><a href="ExamForm?action=printexamform&exam_id=<%=eb.getExam_id()%>">Print</a></button></td>	
											
										</tr>
										 <%
                                            } else {
                                         %>
									<tr>
										<td colspan="6">Exam form details not found</td>
									</tr>
									<%
										}
									%>
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
<!-- onclick="printData()" -->