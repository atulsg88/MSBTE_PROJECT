<%@page import="com.epayment.Bean.ExamFormBean"%>
<%@page import="com.epayment.Bean.InstituteBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>
<title>Institute Registration</title>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
	
	
<%
ExamFormBean ebg =(ExamFormBean)request.getAttribute("ebgsn");
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
							<h4>Generate Seat No</h4>
						</div>
						<div class="widget-inner">
							<form class="edit-profile m-b30" action="ExamForm?action=saveSeat" method="post">
								<div class="">
									<div class="form-group row">
									
								<input type="hidden" name="sid" id="sid"  value="<%=(ebg!=null)?ebg.getSid():""%>" /><br/>
									
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Exam_Form_No</label>
										<div class="col-sm-7">
											<input id="exam_id" name="exam_id" class="form-control" type="text" value="<%=(ebg!=null)?ebg.getExam_id():""%>" required="">
										</div>
									</div>
										<div class="form-group row">
										   <label class="col-sm-2 col-form-label">FullName</label>
										    <div class="col-sm-7">
											<input id="fullname" name="fullname" class="form-control" type="text" value="<%=(ebg!=null)?ebg.getFullname():""%>" required="">
										    </div>
										   </div>
										<div class="form-group row">
										  <label class="col-sm-2 col-form-label">Date Of Birth</label>
										    <div class="col-sm-7">
											<input id="dob" name="dob" class="form-control" type="text" value="<%=(ebg!=null)?ebg.getDob():""%>" required="">
										  </div>
										  </div>
										<div class="form-group row">
										      <label class="col-sm-2 col-form-label">Enrollment_No</label>
										         <div class="col-sm-7">
										     	<input id="enrollment_no" name="enrollment_no" class="form-control" type="text" value="<%=(ebg!=null)?ebg.getEnrollment_no():""%>" required="">
										        </div>
										</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institute Name</label>
										<div class="col-sm-7">
											<input id="institute_name" name="institute_name" class="form-control" type="text" value="<%=(ebg!=null)?ebg.getInstitute_name():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Course Name</label>
										<div class="col-sm-7">
											<input id="course_name" name="course_name" class="form-control" type="text" value="<%=(ebg!=null)?ebg.getCourse_name():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Semester</label>
										<div class="col-sm-7">
											<input id="semester" name="semester" class="form-control" type="text" value="<%=(ebg!=null)?ebg.getSemester():""%>" required="">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Seat No</label>
										<div class="col-sm-7">
											<input id="seat_no" name="seat_no" class="form-control" type="text" readonly="readonly">
										</div>
									</div>
								<div class="row">
									<div class="col-sm-7">
									<button type="button" onclick="generateSeatNumber()" class="btn" style="margin-left: 190px;">Generate Seat Number</button>
									</div>
									<br>
									<br>
									<div class="col-sm-7">
										<button name="submit" type="submit" class="btn">Save</button>
										<button type="reset" class="btn my-bg-color text-white ">Reset</button>
									</div>
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
<script>
function generateSeatNumber() {
    // Get the current year
    var currentYear = new Date().getFullYear();
    var lastTwoDigitsOfYear = currentYear.toString().slice(-2);
    // Generate a random 3-digit number
    var randomNumber = Math.floor(Math.random() * 1000);    
    // Ensure the random number is 3 digits long
    var paddedRandomNumber = randomNumber.toString().padStart(3, '0'); 
    // Concatenate the last two digits of the year with the padded random number
    var seatNumber = lastTwoDigitsOfYear + paddedRandomNumber; 
    // Ensure seat number is exactly 5 digits long
    seatNumber = seatNumber.padEnd(5, '0'); 
    // Display the generated seat number
    document.getElementById("seat_no").value = seatNumber;
}
</script>
  
</html>