<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.SubjectBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject List</title>
<%@ include file="allcss.jsp" %>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">

<%SubjectBean subB = new SubjectBean();%>
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
					<a href="Home?action=Dashboards" class="ttr-logo">
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
					<li>List Subject</li>
				</ul>
			</div>
		</div>	
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					
					<div class="panel-body">
						<div class="col-md-12">	
						<a href="SubjectServlet?action=addsubject"><button class="btn btn-info" type="submit" style="float: left;">Add New Subject</button></a> 
								<br>
								<div class="col-lg-6">
								<input id="search" type="text" placeholder="Search.." class="form-control">
								</div>
								<br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
										
											<th style="width:5%">Sr.No</th>
											<th >Course_Name</th>
											<th>Semester</th>
											<th>subject</th>
											<th>checkbox</th>
											<th>Status</th>
											<th>Action</th>
												
										</tr>
									</thead> 
									<tbody id="myTable">
									
									<%ArrayList<SubjectBean> subList = (ArrayList<SubjectBean>)request.getAttribute("subList"); 
			                         if(subList==null)
			                         {
			                        	 subList=new ArrayList<SubjectBean>();
			                         }
			                  
			                         /* DepartmentBean db;
			                         ClassBean cb; */
			                         %>
			                        
			                          <% 
				                          int i=1;
				                          for(SubjectBean bn :subList){ 
				                          if(Integer.parseInt(bn.getSub_status())!=0){%>     
										<tr data-item-id="1">
											 <td><%=i++ %></td>
                                                <td><%=bn.getCourse_name() %></td>
												<td><%=bn.getSemester() %></td>
												<td><%=bn.getSubject() %></td>
												<td><%=bn.getCheckbox() %></td>
                                                <td><%=(bn.getSub_status().equals("1"))?"Active":"Deactive"%></td>
											<td class="actions">
												<a href="SubjectServlet?action=editSubject&sub_id=<%=bn.getSub_id() %>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Institute"></i></a>
												<a href="SubjectServlet?action=deleteSubject&sub_id=<%=bn.getSub_id() %> &sub_status=<%=bn.getSub_status() %>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Student" onclick="return confirm('Are you sure you want to Deactivate this Subject?')"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="7"><hr style="border: 0.9px solid grey;"></td></tr>
						            <tbody id="myTable">
								
			                            <%  for(SubjectBean bn :subList){ 
				                          if(Integer.parseInt(bn.getSub_status())!=1){%>     
										<tr data-item-id="1">
											<td><%=i++ %></td>
											<td><%=i++ %></td>
                                            <td><%=bn.getCourse_name() %></td>
											<td><%=bn.getSemester() %></td>
											<td><%=bn.getSubject() %></td>
											<td><%=bn.getCheckbox()%></td>
                                            <td><%=(bn.getSub_status().equals("0"))?"Deactive":"Active"%></td>							
											<td class="actions">
												<a href="SubjectServlet?action=editSubject&sub_id=<%=bn.getSub_id() %>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Subject"></i></a>
												<a href="SubjectServlet?action=deleteSubject&sub_id=<%=bn.getSub_id() %> &sub_status=<%=bn.getSub_status() %>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Institute" onclick="return confirm('Are you sure you want to Activate this Subject?')"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>

								</table></div>	
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