<!DOCTYPE html>
<%@page import="com.epayment.Bean.MSBTEBean"%>
<html lang="en">

<head>
<%@ include file="allcss.jsp" %>
<title>MSBTE Registration</title>
</head>
<body id="bg">
<%
MSBTEBean editMsbte=(MSBTEBean)request.getAttribute("ab");
%>
<div class="page-wraper">
	<!-- Header Top ==== -->
    <%@ include file="header.jsp" %> 
    <!-- Header Top END ==== -->
	<div class="account-form">
		<div class="account-head" style="background-image:url(assets/images/background/bg2.jpg);">
			<a href="Home?action=Dashboard"><img src="assets/images/msbte logo.png" alt="logo"></a>
		</div>
		<div class="account-form-inner">
			<div class="account-container">
				<div class="heading-bx left">
					<h2 class="title-head">Sign Up <span>Now</span></h2>
					<p>Login Your Account <a href="msbte_login.jsp">Click here</a></p>
				</div>	
				<form class="contact-bx" action="MSBTE?action=savemsbte" method="post">
				        <input id="msbte_id" name="msbte_id" type="hidden"  class="form-control">
						<div class="row placeani">
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group">
									<label>Your Name </label>
									<input id="name" name="name" type="text" required="" class="form-control" value="<%=(editMsbte!=null)?editMsbte.getName():""%>">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group">
									<label>Your Email Address</label>
									<input id="email" name="email" type="email" required="" class="form-control" value="<%=(editMsbte!=null)?editMsbte.getEmail():""%>">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group"> 
									<label>Your Username</label>
									<input id="username" name="username" type="text" class="form-control" required="" value="<%=(editMsbte!=null)?editMsbte.getUsername():""%>">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group"> 
									<label>Your Password</label>
									<input id="password" name="password" type="password" class="form-control" required="" value="<%=(editMsbte!=null)?editMsbte.getPassword():""%>">
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 m-b30">
							<button type="submit" class="btn">Save</button>
				            <button type="button" onclick="document.location='msbte_login.jsp'" class="btn">Back</button>
							<button type="reset" class="btn my-bg-color text-white ">Reset</button>
		
						</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- Scripts Start-->
	<%@ include file="alljs.jsp"%>
  <!-- Scripts End-->
</body>

</html>
