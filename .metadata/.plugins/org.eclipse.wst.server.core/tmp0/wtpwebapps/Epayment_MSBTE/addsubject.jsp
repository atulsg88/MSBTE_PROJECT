<!DOCTYPE html>
<%@page import="com.epayment.Bean.SubjectBean"%>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>

<%
SubjectBean editSubject =(SubjectBean)request.getAttribute("subB");
%>

 <title>Add Subject </title>

</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
	
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
				<%@ include file="msbteOption.jsp" %>
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
					<li>Add Subject</li>
				</ul>
			</div>
		</div>	
	
	<div class="ttr-overlay"></div>
	
	<div class="col-md-12">	
	<label>Add Subject</label>
			
			<br>
			<form action="SubjectServlet?action=addsubject" method="post">
			<input id="sub_id" name="sub_id" type="hidden" value="<%=(editSubject!=null)?editSubject.getSub_id():""%>">
			<label for="course_name">Select Course Name:</label>
    			<select id="course_name" name="course_name" class="form-control">
       			 <option value="">-- Select Course --</option>
       			 <option value="Computer" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Computer")?"selected":""%>>CO-Computer Engineering </option>
       			 <option value="Mechanical" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Mechanical")?"selected":""%>>Mechanical Engineering</option>
       			 <option value="E&TC" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("E&TC")?"selected":""%>>Electronic & Tele.</option>
       			 <option value="IT" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("IT")?"selected":""%>>IT Engineering</option>
       			 <option value="Civil" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Civil")?"selected":""%>>Civil Engineering</option>
       			 <option value="Automobile" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Automobile")?"selected":""%>>Automobile Engineering</option>
    			</select>
			<br>
			<br>
   			 <label for="semester">Select Semester:</label>
    			<select id="semester" name="semester" class="form-control">
       			 <option value="">-- Select Semester --</option>
       			 <option value="sem1" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem1")?"selected":""%>>Semester 1</option>
       			 <option value="sem2" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem2")?"selected":""%>>Semester 2</option>
       			 <option value="sem3" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem3")?"selected":""%>>Semester 3</option>
       			 <option value="sem4" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem4")?"selected":""%>>Semester 4</option>
       			 <option value="sem5" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem5")?"selected":""%>>Semester 5</option>
       			 <option value="sem6" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem6")?"selected":""%>>Semester 6</option>
    			</select>
    			<br><br>
    			
    			<% 
    			  String value="";
    			  if(editSubject!=null){
    			  String pb[]=editSubject.getCheckbox().split(",");
   				  for(int i=0;i<pb.length;i++)
 				  {
 	                	value+=pb[i];
 	              }}%>
    			<div>
				<label><input type="checkbox" value="TH" name="checkbox" <%=value.contains("TH")?"checked='checked'": ""%>> TH</label><br>
				<label><input type="checkbox" value="TW" name="checkbox" <%=value.contains("TW")?"checked='checked'": ""%>> TW</label><br>
				<label><input type="checkbox" value="PR" name="checkbox" <%=value.contains("PR")?"checked='checked'": ""%>> PR</label><br>
				<label><input type="checkbox" value="OR" name="checkbox" <%=value.contains("OR")?"checked='checked'": ""%>> OR</label><br>
				<label><input type="checkbox" value="SW" name="checkbox" <%=value.contains("SW")?"checked='checked'": ""%>> SW</label><br>
				<label><input type="checkbox" value="TM" name="checkbox" <%=value.contains("TM")?"checked='checked'": ""%>> TM</label><br>
				<label><input type="checkbox" value="PM" name="checkbox" <%=value.contains("PM")?"checked='checked'": ""%>> PM</label><br>
			</div>
				
				<div>
				<input id="subject" name="subject" type="text" placeholder="Enter Subjects" value="<%=(editSubject!=null)?editSubject.getSubject():""%>" class="form-control" required="">
				</div>	
				<br>
			    <input type="hidden" id="exam_mode" name="exam_mode"  value="<%=(editSubject!=null)?editSubject.getCheckbox():""%>" class="form-control" required="">
						
				<div>
    			<input type="submit" class="btn btn-info">
    			</div>
			</form>
			
		</div>
		
</main>
<%@include file="alljs.jsp" %>
<script type="text/javascript">
	 function roleValidate()
	   {  
		var exam_mode= document.getElementById("exam_mode").value;    
		if(exam_mode==null || exam_mode=="")
		{
			alert("Please select atleast one Exam Mode.")
			return false;
			
		}
	  } 
	   $('input[type="checkbox"]').change(function(){
       var checkedValue = $('input:checkbox:checked').map(function(){
       return this.value;
       }).get();         
       document.getElementById("exam_mode").value=checkedValue;
      })
     </script>
</body>
</html>