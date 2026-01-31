<!DOCTYPE html>
<%@page import="com.epayment.Bean.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.InstituteBean"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<%
StudentBean editStudent =(StudentBean)request.getAttribute("sb");
%>
<%List<InstituteBean>itList=(ArrayList)request.getAttribute("itlist"); %>
<%@ include file="allcss.jsp" %>
<title>Student Profile</title> 
<style type="text/css">
.field-icon {
  float: right;
  margin-left: -11px;
  margin-top: -30px;
  position: relative;
  z-index: 2;
}

.container{
  padding-top:50px;
  margin: auto;
}
</style>

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
				<h4 class="breadcrumb-title">Student Profile</h4>
				<ul class="db-breadcrumb-list">
					<li>Student Profile</li>
				</ul>
			</div>	
			<div class="row">
				<!-- Your Profile Views Chart -->
				<div class="col-lg-12 m-b30">
					<div class="widget-box">
						<div class="wc-title">
							<h4>Student Profile</h4>
						</div>
						<div class="widget-inner">
							<form class="edit-profile m-b30"  method="post" >
							<fieldset disabled="disabled">
							<input id="institute_id" name="institute_id" type="hidden"  class="form-control">
								<div class="">
									<div class="form-group row">
										<div class="col-sm-10  ml-auto">
											<h3>Student Details</h3>
										</div>
									</div>
									<div class="form-group row">
									<input type="hidden" name="sid" value="<%=(editStudent!=null)?editStudent.getSid():""%>"/><br/>
										
										<label class="col-sm-2 col-form-label">Full Name:</label>
										<div class="col-sm-7">
											<input id="fullname" name="fullname" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getFullname():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Mobile No:</label>
										<div class="col-sm-7">
											<input id="mobile" name="mobile" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getMobile():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Email:</label>
										<div class="col-sm-7">
											<input id="email" name="email" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getEmail():""%>">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Address:</label>
										<div class="col-sm-7">
											<input id="address" name="address" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getAddress():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Date Of Birth:</label>
										<div class="col-sm-7">
											<input id="dob" name="dob" class="form-control" type="date" value="<%=(editStudent!=null)?editStudent.getDob():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Course name</label>
										<div class="col-sm-7" >
					
											<select id="course_name" name="course_name" class="form-control" disabled="disabled" >
      			 							<option value="">-- Select Course --</option>
      			 							<option value="Computer" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Computer")?"selected":""%>>CO-Computer Engineering </option>
       			 							<option value="Mechanical" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Mechanical")?"selected":""%>>Mechanical Engineering</option>
       										 <option value="E&TC" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("E&TC")?"selected":""%>>Electronic & Tele.</option>
       										 <option value="IT" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("IT")?"selected":""%>>IT Engineering</option>
       										 <option value="Civil" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Civil")?"selected":""%>>Civil Engineering</option>
       										 <option value="Automobile" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Automobile")?"selected":""%>>Automobile Engineering</option>
    										</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institude Name:</label>
										<div class="col-sm-7">
											<input id="institute_name" list="itlist" name="institute_name" class="form-control" type="text" onchange="getInstituteDetails()" value="<%=(editStudent!=null)?editStudent.getInstitute_name():""%>">
											<datalist id="itlist">
				 							<%for(InstituteBean ib:itList){%>
				 							<option value="<%=ib.getInstitute_name()%>"><%=ib.getInstitute_name()%></option>
				 							<%} %>
				 							</datalist> 
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institute Code:</label>
										<div class="col-sm-7">
											<input  name="institute_code" id="institute_code" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getInstitute_code():""%>">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Username</label>
										<div class="col-sm-7">
											<input id="username" name="username" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getUsername():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Password</label>
										<div class="col-sm-7">
											  <input id="password-field" type="password" class="form-control" name="password" value="<%=(editStudent!=null)?editStudent.getPassword():""%>">
              						          <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
										</div>
									</div>
		
								</div>
								</fieldset>	
							</form>
						</div>
					</div>
				</div>
				<!-- Your Profile Views Chart END-->
			</div>
		</div>
	</main>
	<div class="ttr-overlay"></div>
		
<%@include file="alljs.jsp" %>

<script type="text/javascript">
$(".toggle-password").click(function() {

	  $(this).toggleClass("fa-eye fa-eye-slash");
	  var input = $($(this).attr("toggle"));
	  if (input.attr("type") == "password") {
	    input.attr("type", "text");
	  } else {
	    input.attr("type", "password");
	  }
	});
</script>


</body>
</html>