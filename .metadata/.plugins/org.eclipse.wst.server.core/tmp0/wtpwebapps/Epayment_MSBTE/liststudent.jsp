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
					<li>Student List</li>
				</ul>
			</div>
		</div>	
	
	
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-12">			
								<a href="Student?action=studentreg"><button class="btn btn-info" type="submit" style="float: left;">Add New Student</button></a> 
								<br><br><br>
								<div class=" text-right">								
								<button class="btn btn-info" onclick="printData()">Print</button>					
								</div>
								<div class="col-lg-6">
								<input id="search" type="text" placeholder="Search.." class="form-control">
								</div>								<br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" cellspacing="0" rules="all" border="1"  id="datatable-editable">
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
											<th>Enrollment</th>
											<th>Stud_Photo</th>
											<th>Status</th>
											<th >Action</th>
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
				                        	 
				                          if(Integer.parseInt(bn.getStud_status())!=0 && ib.getInstitute_name().equals(bn.getInstitute_name())){%>     
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
												<td><%=bn.getEnrollment() %></td>
                                                <td><%=bn.getStud_photo() %></td>
                                                 
                                                 <td><%=(bn.getStud_status().equals("1"))?"Active":"Deactive"%></td>
											<td class="actions">
												<a href="Student?action=editStudent&sid=<%=bn.getSid() %>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Institute"></i></a>
												<a href="Student?action=deleteStudent&sid=<%=bn.getSid() %> &stud_status=<%=bn.getStud_status() %>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Student" onclick="return confirm('Are you sure you want to Deactivate this Student?')"></i></a>
											</td>
										</tr>
									<%}}%>
									</tbody>
									 <tr><td colspan="15"><hr style="border: 0.9px solid grey;"></td></tr>
						            <tbody id="myTable">
								
			                            <%  for(StudentBean bn :studList){ 
				                          if(Integer.parseInt(bn.getStud_status())!=1 && ib.getInstitute_code()== bn.getInstitute_code()){%>     
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
												<a href="Student?action=editStudent&sid=<%=bn.getSid() %>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Student"></i></a>
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