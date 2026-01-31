<!DOCTYPE html>
<%@page import="com.epayment.Bean.InstituteBean"%>
<html lang="en">


<head>
<%@ include file="allcss.jsp" %>
<title>Institute Login</title>
</head>
<body id="bg">
<% InstituteBean  ib =(InstituteBean)  request.getAttribute("ib"); %>
<div class="page-wraper">
	 <!-- Header Top ==== -->
    <%@ include file="header.jsp" %> 
    <!-- Header Top END ==== -->
	<div class="account-form">
		<div class="account-head";>
			<a href="Home?action=Dashboard"><img src="assets/images/msbte logo.png" alt="logo"></a>
		</div>
		<div class="account-form-inner">
			<div class="account-container">
				<div class="heading-bx left">
					<h2 class="title-head">Institute<span>Login</span></h2>
					<p>Don't have an account? <a href="institute_register.jsp">Create one here</a></p> 
				</div>	
				<form class="contact-bx" action=login?action=itLogin method="post">
				  <p style="color: red;text-align: center;"><%=request.getAttribute("alert")!=null?request.getAttribute("alert"):""%></p>
	
					<div class="row placeani">
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group">
									<label>Your Name</label>
									<input id="username" name="username" type="text" required="" autocomplete="off" class="form-control">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group"> 
									<label>Your Password</label>
									<input id="password" name="password" type="password" class="form-control" required="">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group form-forget">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" onchange="passwordFunction()" id="customControlAutosizing">
									<label class="custom-control-label" for="customControlAutosizing" >Show Password</label>
								</div>
								<a href="login?action=instituteforgotpassword" class="ml-auto">Forgot Password</a>
							</div>
						</div>
						</div>
						<div class="col-lg-12 m-b30">
							<button name="submit" type="submit" value="Submit" class="btn button-md">Login</button>
							<button type="button" onclick="document.location='index.jsp'" class="btn button-md">Back</button>
						</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="alljs.jsp" %>
</body>
<script type="text/javascript">
function passwordFunction() {
	  var x = document.getElementById("password");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script> 
</html>
