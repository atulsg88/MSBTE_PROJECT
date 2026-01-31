<%@page import="com.epayment.Bean.InstituteBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>
<title>Institute Profile</title>
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
						<a href="instituteOption.jsp" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-home"></i></span>
		                	<span class="ttr-label">Dashboard</span>
		                </a>
		            </li>
		            <li>
						<a href="Institute?action=InstituteProfile&institute_id=<%=session.getAttribute("institute_id")!=null?session.getAttribute("institute_id"):""%>" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-book"></i></span>
		                	<span class="ttr-label">Institute Profile</span>
		                </a>
		            </li>
					<li>
						<a href="Student?action=studList&institute_id=<%=session.getAttribute("institute_id")!=null?session.getAttribute("institute_id"):""%>" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-user"></i></span>
		                	<span class="ttr-label">Manage Student</span>
		                </a>
		            </li>
		            <li>
						<a href="ExamForm?action=examList" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">Exam Form Approval</span>
		                </a>
		            </li>
		            <li>
						<a href="#" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-layout-accordion-list"></i></span>
		                	<span class="ttr-label">Offline Payment List</span>
		                </a>
		            </li>
		            <li>
						<a href="ExamForm?action=seatNoListInstitute" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">SeatNo List</span>
		                </a>
		            </li>
		            <li>
						<a href="login?action=instituteLogout" class="ttr-material-button">
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
							<form class="edit-profile m-b30"  method="post">
							<fieldset disabled="disabled">
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
											<input id="institute_name" name="institute_name" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getInstitute_name():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institute Code</label>
										<div class="col-sm-7">
											<input id="institute_code" name="institute_code" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getInstitute_code():""%>">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Email</label>
										<div class="col-sm-7">
											<input id="email" name="email" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getEmail():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Mobile No.</label>
										<div class="col-sm-7">
											<input id="mobile" name="mobile" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getMobile():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Address</label>
										<div class="col-sm-7">
											<input id="address" name="address" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getAddress():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Registerd Date:</label>
										<div class="col-sm-7">
											<input id="registerd_date" name="registerd_date" class="form-control" type="date" value="<%=(editInstitute!=null)?editInstitute.getRegisterd_date():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Username</label>
										<div class="col-sm-7">
											<input id="username" name="username" class="form-control" type="text" value="<%=(editInstitute!=null)?editInstitute.getUsername():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Password</label>
										<div class="col-sm-7">
											<input id="password" name="password" class="form-control" type="password" value="<%=(editInstitute!=null)?editInstitute.getPassword():""%>">
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
</body>
</html>