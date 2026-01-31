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
					<li>Student List</li>
				</ul>
			</div>
		</div>	
	
	
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-12">	
								<br>		
								<div class="col-lg-6">
								<input id="search" type="text" placeholder="Search.." class="form-control">
								</div><br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th style="width:5%">Sr.No</th>
											<th >Full Name</th>
											<th >Mobile</th>
											<th >Email</th>
											<th >Address</th>
											<th >Date_Of_Birth</th>
											<th>course_name</th>
											<th>Institute_Name</th>
											<th>Institute_Code</th>
											<th>Username</th>
											<th>Stud_Photo</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody id="myTable">
									
									<%ArrayList<StudentBean> studList = (ArrayList<StudentBean>)request.getAttribute("studList"); 
			                         if(studList==null)
			                         {
			                        	 studList=new ArrayList<StudentBean>();
			                         }
			                         
			                         /* DepartmentBean db;
			                         ClassBean cb; */
			                         %>
			                        
			                          <% 
				                          int i=1;
				                          for(StudentBean bn :studList){ 
				                          if(Integer.parseInt(bn.getStud_status())!=0){%>     
										<tr data-item-id="1">
											 <td><%=i++ %></td>
											 	<td><%=bn.getFullname() %></td>
                                                <td><%=bn.getMobile() %></td>
                                                <td><%=bn.getEmail() %></td>
												<td><%=bn.getAddress() %></td>
												<td><%=bn.getDob() %></td>
												<td><%=bn.getCourse_name() %></td>
												<td><%=bn.getInstitute_name() %></td>
												<td><%=bn.getInstitute_code() %></td>
												<td><%=bn.getUsername() %></td>
                                                <td><%=bn.getStud_photo() %></td>
                                                 
                                                 <td><%=(bn.getStud_status().equals("1"))?"Active":"Deactive"%></td>
											<td class="actions">
												<a href="Student?action=deleteStudent&sid=<%=bn.getSid() %> &stud_status=<%=bn.getStud_status() %>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Student" onclick="return confirm('Are you sure you want to Deactivate this Institute?')"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="15"><hr style="border: 0.9px solid grey;"></td></tr>
						            <tbody id="myTable">
								
			                            <%  for(StudentBean bn :studList){ 
				                          if(Integer.parseInt(bn.getStud_status())!=1){%>     
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=i++ %></td>
                                            <td><%=bn.getFullname() %></td>
                                                <td><%=bn.getMobile() %></td>
                                                <td><%=bn.getEmail() %></td>
												<td><%=bn.getAddress() %></td>
												<td><%=bn.getDob() %></td>
												<td><%=bn.getCourse_name() %></td>
												<td><%=bn.getInstitute_name() %></td>
												<td><%=bn.getInstitute_code() %></td>
												<td><%=bn.getUsername() %></td>
												<td><%=bn.getStud_photo() %></td>
												
                                            <td><%=(bn.getStud_status().equals("0"))?"Deactive":"Active"%></td>							
											<td class="actions">
												<a href="Student?action=deleteStudent&sid=<%=bn.getSid() %> &stud_status=<%=bn.getStud_status() %>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Student" onclick="return confirm('Are you sure you want to Activate this Student?')"></i></a>
											</td>
										</tr>
									<%}}%>
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
</html>