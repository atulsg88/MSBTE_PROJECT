<!DOCTYPE html>
<%@page import="com.epayment.Bean.MSBTEBean"%>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>
<title>MSBTE</title>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
<%
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
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
					<!-- <li><a href="#"><i class="fa fa-home"></i>Home</a></li> -->
					<li>Welcome</li>
				</ul>
			</div>
		</div>	
	</main>
	<div class="ttr-overlay"></div>
		

<%@include file="alljs.jsp" %>
</body>
</html>