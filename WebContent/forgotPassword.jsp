<!DOCTYPE html>
<%@page import="com.epayment.Bean.MSBTEBean"%>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>
<title>MSBTE Forgot Password</title>	
</head>
<body id="bg">
<% MSBTEBean  ab =(MSBTEBean)  request.getAttribute("ab"); %>
<div class="page-wraper">
    <!-- Header Top ==== -->
    <%@ include file="header.jsp" %> 
    <!-- Header Top END ==== -->
	<div class="account-form">
		<div class="account-head";>
			<a href="Home?action=Dashboard"><img src="assets/images/msbte logo.png" alt=""></a>
		</div>
		<div class="account-form-inner">
			<div class="account-container">
				<div class="heading-bx left">
					<h2 class="title-head">Forgot<span>Password</span></h2>
				</div>	
				<form action="login?action=forgotpassword" method="post">
						    <p style="color: red;text-align: center;"><%=request.getAttribute("alert")!=null?request.getAttribute("alert"):""%></p>
				
							<div class="mb-3">
							<div class="mb-3">
								<label class="form-label">Enter Username</label> <input
									name="username" type="text" placeholder="Enter Username"
									class="form-control" required>
							</div>
							</div>
							<div>
							<button type="submit" class="btn my-bg-color text-white col-md-12">Submit</button>
							</div><br>
							<div>
							<button type="reset" class="btn my-bg-color text-white col-md-12">Reset</button>
							
							</div>
						</form>
				</div>
			</div>
		</div>
	</div>

<%@ include file="alljs.jsp" %>
</body>

</html>
