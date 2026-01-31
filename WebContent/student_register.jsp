
<!DOCTYPE html>
<%@page import="com.epayment.Bean.StudentBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.InstituteBean"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>

<%
StudentBean editStudent =(StudentBean)request.getAttribute("sb");
%>

 
<%@ include file="allcss.jsp" %>
 <title><%if(editStudent==null){%> Add Student<%}else{ %>Edit Student<%}%> </title>
 
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
	
<%List<InstituteBean> itList=(ArrayList)request.getAttribute("itlist"); %>
	
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
						<a href="Student?action=studList" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-user"></i></span>
		                	<span class="ttr-label">Manage Student</span>
		                </a>
		            </li>
		            <li>
						<a href="#" class="ttr-material-button">
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
					<li>Student Registration</li>
				</ul>
			</div>	
			<div class="row">
				<!-- Your Profile Views Chart -->
				<div class="col-lg-12 m-b30">
					<div class="widget-box">
						<div class="wc-title">
							<h4>Student Registration</h4>
						</div>
						<div class="widget-inner">
							<form class="edit-profile m-b30" action="Student?action=saveStudent" method="post">
							<input id="institute_id" name="institute_id" type="hidden"  class="form-control">
								<div class="">
									<div class="form-group row">
										<div class="col-sm-10  ml-auto">
											<h3>Student Details</h3>
										</div>
									</div>
									<div class="form-group row">
									<input type="hidden" name="sid" id="sid" value="<%=(editStudent!=null)?editStudent.getSid():""%>"/><br/>
										<label class="col-sm-2 col-form-label">Full Name:</label>
										<div class="col-sm-7">
											<input id="fullname" name="fullname" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getFullname():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Mobile No:</label>
										<div class="col-sm-7">
											<input id="mobile" name="mobile" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getMobile():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Email:</label>
										<div class="col-sm-7">
											<input id="email" name="email" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getEmail():""%>" required="">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Address:</label>
										<div class="col-sm-7">
											<input id="address" name="address" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getAddress():""%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Date Of Birth:</label>
										<div class="col-sm-7">
											<input id="dob" name="dob" class="form-control" type="date" value="<%=(editStudent!=null)?editStudent.getDob():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Course name</label>
										<div class="col-sm-7">
					
											<select id="course_name" name="course_name" class="form-control" required="">
      			 							<option value="">-- Select Course --</option>
      			 							<option value="Computer" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Computer")?"selected":""%>>CO-Computer Engineering </option>
       			 							<option value="Mechanical" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Mechanical")?"selected":""%>>Mechanical Engineering</option>
       										 <option value="E&TC" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("E&TC")?"selected":""%>>Electronic & Tele.</option>
       										 <option value="IT" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("IT")?"selected":""%>>IT Engineering</option>
       										 <option value="Civil" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Civil")?"selected":""%>>Civil Engineering</option>
       										 <option value="Automobile" <%=editStudent!=null && editStudent.getCourse_name().equalsIgnoreCase("Automobile")?"selected":""%>>Automobile Engineering</option>
    										</select>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institude Name:</label>
										<div class="col-sm-7">
											<input id="institute_name" list="itlist" name="institute_name" class="form-control" type="text" onchange="getInstituteDetails()" value="<%=(editStudent!=null)?editStudent.getInstitute_name():""%>" required="">
											<datalist id="itlist">
				 							<%for(InstituteBean ib:itList){%>
				 							<option value="<%=ib.getInstitute_name()%>"><%=ib.getInstitute_name()%></option>
				 							<%} %>
				 							</datalist> 
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Institute Code:</label>
										<div class="col-sm-7">
											<input  name="institute_code" id="institute_code" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getInstitute_code():""%>" required="">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Username</label>
										<div class="col-sm-7">
											<input id="username" name="username" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getUsername():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Password</label>
										<div class="col-sm-7">
											<input id="password" name="password" class="form-control" type="password" value="<%=(editStudent!=null)?editStudent.getPassword():""%>" required="">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Enrollment No.</label>
										<div class="col-sm-7">
											<input id="enrollment" name="enrollment" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getEnrollment():""%>" required="" readonly="readonly">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-sm-2 col-form-label">Student photo<i style="color: red;">(Width:800 X Height:809)</i></label>
										<div class="col-sm-7">
										<input id="imageFile" name="imageFile" type="file" class="imageFile" accept="image/*"/ > <br>
										<input type="button" value="Resize Image" id="form-submit" onclick="ResizeImage()"/> <br>
										<br/>
										<img src="" id="preview" style="display: none;" >
										<img src="" style="border: 1px solid #ccc;" name="url" id="output">
										<%if(editStudent!=null){ %>
										<img src="fetchimage?type=UserPhoto&image=<%=(editStudent.getStud_photo()!=null)?editStudent.getStud_photo():""%>"/>
										<input type="hidden" name="edit_img_url" value="<%=(editStudent!=null)?editStudent.getStud_photo():""%>">
										<%} %>
										<input type="hidden" name="url" id="value"></div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-7">
										<button type="submit" class="btn">Save</button>
							            <button type="button" onclick="document.location='student_login.jsp'" class="btn">Back</button>
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
	 $("#dob").change(function()
		{
	      var name=document.getElementById("fullname").value;
	      var arr1 = name.split(' ');
	      var name = arr1[0];
	      var rno= Math.floor(Math.random()*(999-100+1)+100);
	      var pass=name+"@"+rno;
	      alert("Registering Account Password is:"+ pass)
		  document.getElementById("password").value=pass;
        });
	
 </script>
  <script type="text/javascript">
function getInstituteDetails()
{
	var institute_name=document.getElementById("institute_name").value;
	/* alert("institute_name="+institute_name) */
	$.ajax({
		url:"Institute?action=getInstituteByName&institute_name="+institute_name,
				success:function(result){
					
				var ic=JSON.parse(result);
				if(ic===undefined || ic==="" ||  ic===null)
				{
				document.getElementById("institute_code").value="";  
				}
				else
				{				
				document.getElementById("institute_code").value=ic.institute_code;  
				}
			}
	})
}

</script>
<script type="text/javascript">
   $(document).ready(function() {

	    $('#imageFile').change(function(evt) {

	        var files = evt.target.files;
	        var file = files[0];

	        if (file) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                document.getElementById('preview').src = e.target.result;
	            };
	            reader.readAsDataURL(file);
	        }
	    });
	});

	function ResizeImage() {
	    if (window.File && window.FileReader && window.FileList && window.Blob) {
	        var filesToUploads = document.getElementById('imageFile').files;
	        var file = filesToUploads[0];
	        if (file) {
	            var reader = new FileReader();
	            // Set the image once loaded into file reader
	            reader.onload = function(e) {

	                var img = document.createElement("img");
	                img.src = e.target.result;

	                var canvas = document.createElement("canvas");
	                var ctx = canvas.getContext("2d");
	                ctx.drawImage(img, 0, 0);

	                var MAX_WIDTH = 800;
	                var MAX_HEIGHT =809;
	                var width = img.width;
	                var height = img.height;

	                if (width > height) {
	                    if (width > MAX_WIDTH) {
	                        height *= MAX_WIDTH / width;
	                        width = MAX_WIDTH;
	                    }
	                } else {
	                    if (height > MAX_HEIGHT) {
	                        width *= MAX_HEIGHT / height;
	                        height = MAX_HEIGHT;
	                    }
	                }
	                canvas.width = width;
	                canvas.height = height;
	                var ctx = canvas.getContext("2d");
	                ctx.drawImage(img, 0, 0, width, height);

	                dataurl = canvas.toDataURL(file.type);
	                document.getElementById('output').src = dataurl;
	                document.getElementById("value").value=dataurl;
	            }
	            reader.readAsDataURL(file);

	        }

	    } else {
	        alert('The File APIs are not fully supported in this browser.');
	    }
	}
   </script>
    <script type="text/javascript">
   function imageValidate()
   {   
	var imageFile= document.getElementById("imageFile").value;   
	var value= document.getElementById("value").value;
	if(imageFile===""||imageFile===null)
	{
	    var msg ='<%=request.getAttribute("editPass")%>';
	    if (msg == "null") 
	    {
		alert("Please Choose Image File..")
		document.getElementById('imageFile').focus();
		return false
	    }
	    else
	    {
	    	if(imageFile=="")
	    	{
	    		
	    	}
	    	else
	    	{
	    		alert("Please Resize Image..")
	    		document.getElementById('resizeimg').focus();
	    		return false
	        }
	    }
	}
	else if(value===""||value===null)
	{
		alert("Please Resize Image..")
		document.getElementById('resizeimg').focus();
		return false
	}  
	function restForm()
	{
		alert("Are you sure you want to Reset Form?")
		document.getElementById("contact").reset();
	}
	   
 } 
</script> 

<script type="text/javascript">
	 $("#institute_name").change(function()
		{
		 var currentYear = new Date().getFullYear().toString().substr(-2);
	      var name=document.getElementById("institute_code").value;
	      var rno= Math.floor(Math.random()*(999-100+1)+100);
	      var enroll=currentYear+name+rno;
	      alert("Enrollment Number is:"+ enroll)
		  document.getElementById("enrollment").value=enroll;
        });
	
   </script> 
</html>