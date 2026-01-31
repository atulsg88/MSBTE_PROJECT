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
			<nav class="ttr-sidebar-navi">
				<ul>
					<li>
						<a href="msbteOption.jsp" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-home"></i></span>
		                	<span class="ttr-label">Dashboard</span>
		                </a>
		            </li>
					<li> 
						<a href="MSBTE?action=MSBTEProfile&msbte_id=<%=session.getAttribute("msbte_id")!=null?session.getAttribute("msbte_id"):""%>" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-layout-accordion-list"></i></span>
		                	<span class="ttr-label">MSBTE Profile</span>
		                </a>
		            </li>
		            <li>
						<a href="MSBTE?action=msbList" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">List MSBTE</span>
		                </a>
		            </li>
					<li>
						<a href="Institute?action=itList" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">Manage Institute</span>
		                </a>
		            </li>
					<li>
						<a href="Student?action=studList2" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-user"></i></span>
		                	<span class="ttr-label">Manage Student</span>
		                </a>
		            </li>
		            <li>
						<a href="SubjectServlet?action=subList" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-book"></i></span>
		                	<span class="ttr-label">Manage Subject</span>
		                </a>
		            </li>
		            <li>
						<a href="NoticeDoc?action=listnotice" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-book"></i></span>
		                	<span class="ttr-label">Manage Notice</span>
		                </a>
		            </li>
		            <li>
						<a href="ExamForm?action=examformapprove" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">Manage Exam Forms</span>
		                </a>
		            </li>
		            <li>
						<a href="login?action=msbteLogout" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-arrow-left"></i></span>
		                	<span class="ttr-label">Log Out</span>
		                </a>
		            </li>
		            <li class="ttr-seperate"></li>
				</ul>	
				<!-- sidebar menu end -->
			</nav>
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
										</tr>
									</thead>
						           <tbody id="myTable">
									
									<%ArrayList<ExamFormBean> examlist = (ArrayList<ExamFormBean>)request.getAttribute("examlist"); 
									 if (examlist == null) 
					                  {
					                   	examlist = new ArrayList<ExamFormBean>();
					                  }%>
									<%
										int i = 1;
										for (ExamFormBean bn : examlist) {
											if(bn.getStatus().equalsIgnoreCase("2"))
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
                                                 <td><%=(bn.getStatus().equals("2"))?"Approved":"Complete"%></td>
											 <td style="text-align: center;">
                                                 <button type="button" class="btn btn-success" style="padding: 6px;">
                                                          <a href="ExamForm?action=generateseatno&exam_id=<%=bn.getExam_id()%>">Approve</a>
                                                  </button>
                                             </td>
										</tr>
										 <%}} %>	
									</tbody>
									</table>
									 <tr>
									 <br>
									 <br>
									 <td colspan="12">
									 <hr style="border: 0.9px solid grey;"></td></tr>
						           <table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th style="width:5%">Sr.No</th>
											<th>Exam_Form_No</th>
											<th >Enrollment_No</th>
											<th >Institute_Name</th>
											<th>Course_Name</th>
											<th>Semester</th>
											<th>Seat_No</th>
										</tr>
									</thead>
						           <tbody id="myTable">

									<%ArrayList<ExamFormBean> seatlist = (ArrayList<ExamFormBean>)request.getAttribute("seatlist"); 
									 if (seatlist == null) 
					                  {
					                   	seatlist = new ArrayList<ExamFormBean>();
					                  }%>
									<%
										int j = 1;
										for (ExamFormBean bn : seatlist) {
											
									%>
									<tr >
											     <td><%=i++ %></td>
											 	 <td><%=bn.getExam_id() %></td>
                                                 <td><%=bn.getEnrollment_no() %></td>
                                                 <td><%=bn.getInstitute_name()%></td>
                                                 <td><%=bn.getCourse_name() %></td>
                                                 <td><%=bn.getSemester() %></td>
                                                 <td><%=bn.getSeatno()%></td>
											<%} %>
										</tr>
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