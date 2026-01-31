<%@page import="com.epayment.Bean.InstituteBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>
<title>Institute Registration</title>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
	
	
<%
InstituteBean editInstitute =(InstituteBean)request.getAttribute("ib");
%>
	
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
	
	
		<div class="ttr-sidebar-wrapper content-scroll"></div>
	
	<!--Main container start -->
	<main class="ttr-wrapper">
		<div class="container-fluid">
			<div class="db-breadcrumb">
				<h4 class="breadcrumb-title">User Profile</h4>
				<ul class="db-breadcrumb-list">
					<li>Institute Registration</li>
				</ul>
			</div>	
			<div class="row">
				<!-- Your Profile Views Chart -->
				<div class="col-lg-12 m-b30">
					<div class="widget-box">
						<div class="wc-title">
							<h4>Institute Registration</h4>
						</div>
						<div class="widget-inner">
							<form class="edit-profile m-b30" action="Institute?action=saveInstitute" method="post">
							<input id="institute_id" name="institute_id" type="hidden"  class="form-control" value="<%=(editInstitute!=null)?editInstitute.getInstitute_id():""%>">
								<div class="">
									<div class="form-group row">
										<div class="col-sm-10  ml-auto">
											<h3>Institute Details</h3>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institute Name</label>
										<div class="col-sm-7">
											<input id="institute_name" name="institute_name" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getInstitute_name():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institute Code</label>
										<div class="col-sm-7">
											<input id="institute_code" name="institute_code" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getInstitute_code():""%>" required="">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Email</label>
										<div class="col-sm-7">
											<input id="email" name="email" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getEmail():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Mobile No.</label>
										<div class="col-sm-7">
											<input id="mobile" name="mobile" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getMobile():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Address</label>
										<div class="col-sm-7">
											<input id="address" name="address" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getAddress():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Registerd Date:</label>
										<div class="col-sm-7">
											<input id="registerd_date" name="registerd_date" class="form-control" type="date" value="<%=(editInstitute!=null)?editInstitute.getRegisterd_date():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Username</label>
										<div class="col-sm-7">
											<input id="username" name="username" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getUsername():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Password</label>
										<div class="col-sm-7">
											<input id="password" name="password" class="form-control" type="password" value="<%=(editInstitute!=null)?editInstitute.getPassword():""%>" required="">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-2">
									</div>
									<div class="col-sm-7">
										<button name="submit" type="submit" class="btn">Save</button>
							            <button type="button" onclick="document.location='institute_login.jsp'" class="btn">Back</button>
										<button type="reset" class="btn my-bg-color text-white ">Reset</button>
									</div>
								</div>	
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
</body>
<script type="text/javascript">
	 $("#registerd_date").change(function()
		{
	      var name=document.getElementById("institute_name").value;
	      var arr1 = name.split(' ');
	      var name = arr1[0];
	      var rno= Math.floor(Math.random()*(999-100+1)+100);
	      var pass=name+"@"+rno;
	      alert("Registering Account Password is:"+ pass)
		  document.getElementById("password").value=pass;
        });
	
</script>   
</html>