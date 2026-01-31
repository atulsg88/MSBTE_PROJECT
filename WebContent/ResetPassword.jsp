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
					<h2 class="title-head">Reset<span>Password</span></h2>
				</div>	
				<form action="MSBTE?action=resetPassword" method="post">
						    <p style="color: red;text-align: center;"><%=request.getAttribute("alert")!=null?request.getAttribute("alert"):""%></p>
							<input type="hidden" name="msbte_id" id="msbte_id" value="<%= ab!=null?ab.getMsbte_id():"" %>">
						<div class="mb-3">
							<div class="mb-3">
								<label class="form-label">New Password</label>
								<input type="password" name="new_password" id="new_password" class="form-control"  title="Please enter your new password." placeholder="Please enter your new password." required/>
							</div>
							<div class="mb-3">
								<label class="form-label">Confirm New Password</label>
								<input type="password" name="confirm new password" id="confirm new password" class="form-control" title="Please confirm new password." placeholder="Please confirm new password." required/>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group form-forget">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" onchange="passwordFunction()" id="customControlAutosizing">
									<label class="custom-control-label" for="customControlAutosizing" >Show Password</label>
								</div>
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
<script type="text/javascript">
function passwordFunction() {
	  var x = document.getElementById("new_password");
	  var y = document.getElementById("confirm new password");
	  if (x.type === "password" || y.type === "password") {
	    x.type = "text";
	    y.type = "text";
	  } else {
	    x.type = "password";
	    y.type = "password";
	  }
	}
</script>
</html>
