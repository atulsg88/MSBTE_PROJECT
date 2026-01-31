<!DOCTYPE html>
<%@page import="com.epayment.Bean.StudentBean"%>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>
<title>Student</title>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
<%
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<%-- <% StudentBean  sb =(StudentBean)  request.getAttribute("sb"); %> --%>
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
						<a href="studentOption.jsp" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-home"></i></span>
		                	<span class="ttr-label">Dashboard</span>
		                </a>
		            </li>
					<li>
						<a href="Student?action=StudentProfile&sid=<%=session.getAttribute("sid")!=null?session.getAttribute("sid"):""%>" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-book"></i></span>
		                	<span class="ttr-label">Student Profile</span>
		                </a>
		            </li>
		            <li>
						<a href="ExamForm?action=examform" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">Exam Form</span>
		                </a>
		            </li>
		           
		            <li>
						<a href="ExamForm?action=hallTicket" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">Hall Ticket</span>
		                </a>
		            </li>
		            <li>
						<a href="login?action=studLogout" class="ttr-material-button">
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
		  <p style="color: red;text-align: center;"><%=request.getAttribute("message")!=null?request.getAttribute("message"):""%></p>
				
			</div>
		</div>	
	</main>
	<div class="ttr-overlay"></div>
		

<%@include file="alljs.jsp" %>
</body>
</html>