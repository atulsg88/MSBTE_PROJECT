<!DOCTYPE html>
<%@page import="com.epayment.Bean.MSBTEBean"%>
<html lang="en">

<head>
<%@ include file="allcss.jsp" %>
<title>MSBTE Profile</title>
<style type="text/css">
.field-icon {
  float: right;
  margin-left: -25px;
  margin-top: 18px;
  position: relative;
  z-index: 2;
}

.container{
  padding-top:50px;
  margin: auto;
}
</style>

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
					<h2 class="title-head">MSBTE <span>Profile</span></h2>
				</div>	
				<form class="contact-bx" action="MSBTE?action=savemsbte" method="post">
				        <input id="msbte_id" name="msbte_id" type="hidden"  class="form-control">
						<div class="row placeani">
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group">
									<input id="name" name="name" type="text"  readonly="readonly" required="" class="form-control" value="<%=(editMsbte!=null)?editMsbte.getName():""%>">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group">
									<input id="email" name="email" type="email" readonly="readonly" required="" class="form-control" value="<%=(editMsbte!=null)?editMsbte.getEmail():""%>">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group"> 
									<input id="username" name="username" readonly="readonly" type="text" class="form-control" required="" value="<%=(editMsbte!=null)?editMsbte.getUsername():""%>">
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="form-group">
								<div class="input-group"> 
									<%-- <input id="password" name="password" type="password" class="form-control" required="" value="<%=(editMsbte!=null)?editMsbte.getPassword():""%>"> --%>
								     <input id="password-field" type="password" class="form-control" name="password" value="<%=(editMsbte!=null)?editMsbte.getPassword():""%>">
              						 <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
								</div>
								</div>
								<div class="col-lg-12 m-b30">
									<button type="button" onclick="document.location='msbteOption.jsp'" class="btn button-md">Back</button>
								</div>
							
						</div>
						</div>
					</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

<!-- Scripts Start-->
	<%@ include file="alljs.jsp"%>
  <!-- Scripts End-->
</body>

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

</html>
