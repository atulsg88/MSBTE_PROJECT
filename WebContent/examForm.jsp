<%@page import="com.epayment.Bean.ExamFormBean"%>
<%@page import="com.epayment.Bean.InstituteBean"%>
<%@page import="com.epayment.Bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.SubjectBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
SubjectBean editSubject =(SubjectBean)request.getAttribute("subB");
%>	
<%
StudentBean editStudent =(StudentBean)request.getAttribute("sb");
%>
<%
ExamFormBean editExam =(ExamFormBean)request.getAttribute("eb");
%> 
<%@ include file="allcss.jsp" %>
 <title>Exam Form </title>


</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">
	
<%List<SubjectBean>subList=(ArrayList)request.getAttribute("sublist"); %>
<%List<StudentBean>studList=(ArrayList)request.getAttribute("studlist"); %>

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
						<a href="ExamForm?action=examform&sid=<%=session.getAttribute("sid")!=null?session.getAttribute("sid"):""%>" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-bookmark-alt"></i></span>
		                	<span class="ttr-label">Exam Form</span>
		                </a>
		            </li>
		            <li>
						<a href="#" class="ttr-material-button">
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
				<h4 class="breadcrumb-title">Dashboard</h4>
				<ul class="db-breadcrumb-list">
					<li>Exam Form</li>
				</ul>
			</div>
		</div>	
		
		<div class="col-lg-12 m-b30">
			<div class="widget-box">
			<div class="wc-title">
				<h4>Exam Form</h4>
			</div>
			<div class="widget-inner">
			<form class="edit-profile m-b30" action="ExamForm?action=saveExam" id="myForm" method="post">
			 				<input type="hidden" name="exam_id" id="exam_id"  /><br/>
			                
				<div class="">
				<div class="form-group row">
						<label class="col-sm-2 col-form-label">Student photo<i style="color: red;">(Width:800 X Height:809)</i></label>
						<div class="col-sm-7">
						<br/>
						<img src="" id="preview" style="display: none;" >
						<img src="" style="border: 1px solid #ccc;" name="url" id="output">
						<%if(editStudent!=null){ %>
						<img src="fetchimage?type=UserPhoto&image=<%=(editStudent.getStud_photo()!=null)?editStudent.getStud_photo():""%>"/>
						<input type="hidden" name="edit_img_url" value="<%=(editStudent!=null)?editStudent.getStud_photo():""%>">
						<%} %>
						<input type="hidden" name="url" id="value"></div>
					</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Full Name:</label>
						<div class="col-sm-7">
						<input id="fullname" name="fullname" readonly="readonly" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getFullname():""%>">
						</div>
				</div>
				<div class="form-group row">
				<label class="col-sm-2 col-form-label">Date Of Birth:</label>
					<div class="col-sm-7">
					<input id="dob" name="dob" class="form-control" type="date" readonly="readonly" value="<%=(editStudent!=null)?editStudent.getDob():""%>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Enrollment No:</label>
					<div class="col-sm-7">
						<input id="enrollment_no" name="enrollment_no" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getEnrollment():""%>" readonly="readonly">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Institude Name:</label>
					<div class="col-sm-7">
						<input id="institute_name" name="institute_name" readonly="readonly"class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getInstitute_name():""%>">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">Institute Code:</label>
					<div class="col-sm-7">
						<input  name="institute_code" id="institute_code" readonly="readonly" class="form-control" type="text" value="<%=(editStudent!=null)?editStudent.getInstitute_code():""%>">
					</div>
				</div>
				<div class="form-group row">
				<label class="col-sm-2 col-form-label">Select Course Name:</label>
				<div class="col-sm-7">
			     <select id="course_name" name="course_name" class="form-control"  onchange="getSubjectDetails();" required="">
       			 <option value="">-- Select Course --</option>
       			 <option value="Computer" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Computer")?"selected":""%>>CO-Computer Engineering </option>
       			 <option value="Mechanical" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Mechanical")?"selected":""%>>Mechanical Engineering</option>
       			 <option value="E&TC" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("E&TC")?"selected":""%>>Electronic & Tele.</option>
       			 <option value="IT" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("IT")?"selected":""%>>IT Engineering</option>
       			 <option value="Civil" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Civil")?"selected":""%>>Civil Engineering</option>
       			 <option value="Automobile" <%=editSubject!=null && editSubject.getCourse_name().equalsIgnoreCase("Automobile")?"selected":""%>>Automobile Engineering</option>
    			</select>
				</div>
			</div>
				
			<div class="form-group row">			
   			 <label class="col-sm-2 col-form-label">Select Semester:</label>
   			 <div class="col-sm-7">
				<select id="semester" name="semester" class="form-control" onchange="getSubjectDetails();" required="">
       			 <option value="">-- Select Semester --</option>
       			 <option value="sem1" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem1")?"selected":""%>>Semester 1</option>
       			 <option value="sem2" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem2")?"selected":""%>>Semester 2</option>
       			 <option value="sem3" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem3")?"selected":""%>>Semester 3</option>
       			 <option value="sem4" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem4")?"selected":""%>>Semester 4</option>
       			 <option value="sem5" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem5")?"selected":""%>>Semester 5</option>
       			 <option value="sem6" <%=editSubject!=null && editSubject.getSemester().equalsIgnoreCase("sem6")?"selected":""%>>Semester 6</option>
    			</select>
			</div> 
			</div>
			
			<table class="table table-bordered table-striped mb-0" id="datatable-editable">
				<thead>
					<tr>
					
						<!-- <th style="width:5%">Sr.No</th> -->
						<th >Subject Name</th>
						<th>TH</th>
						<th>TW</th>
						<th>PR</th>
						<th>OR</th>
						<th>SW</th>
						<th>TM</th>
						<th>PM</th>	
					</tr>
				</thead>
				 
				<tbody id="subject">
						
				</tbody>
				</table> <br>
        
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">Payment Mode :</label>
							<div class="col-sm-7">
								<input type="radio" id="online" name="payment" value="online" checked="checked"> <label for="online">Online</label>
								<img alt="QRcode" src="assets/images/QRScan.jpeg" width="160" height="200"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" id="offline" name="payment" value="offline"> <label for="offline">Offline</label><br>
							</div>
						</div>
						
                      <input type="hidden" name="status" id="status" value="">						
						<div class="col-sm-7">
				<input type="text" name="subject" id="jsonstring">
					<button name="button" type="submit" class="btn" id="Submit">Save</button>
				</div>
				</div>
			</form>
			 </div>
		   </div>
		</div>
	</main>
<%@include file="alljs.jsp" %>
</body>

<script type="text/javascript">
     function getSubjectDetails() {	
     var course_name=document.getElementById("course_name").value;
     var semester=document.getElementById("semester").value;
     $("#subject tr").remove();
     if(course_name!=='' && semester!==''){
	       $.ajax({
	          url:"ExamForm?action=getFormDetails&course_name="+course_name+"&semester="+semester,
	       	   success:function(result){
	       		$.each(result, function(i, subject) {
	       		 var sub_choice= result[i].checkbox;
       			 $('<tr>').html("<td style=font-size:15px;>" + result[i].subject + "</td> <td><input type='checkbox' value='TH'></td> <td><input type='checkbox' value='TW'></td> <td><input type='checkbox' value='PR'></td> <td><input type='checkbox' value='OR'></td> <td><input type='checkbox' value='SW'></td> <td><input type='checkbox' value='sub_id'></td> <td><input type='checkbox' value='PM'></td>").appendTo('#subject');
	       		});
	       	   } 
	          });
           }
           
	   } 
 </script>
   
<script type="text/javascript">
$("#Submit").click(function()
{
	document.getElementById("jsonstring").value="";
	var jobj=[];
     $("#subject").find('tr').each(function(i,el){
		var $tds=$(this).find('td'),
		srno=$tds.eq(0).text(); 
     });
		
   });
   
/* product=$tds.eq(2).text();
hsn=$tds.eq(3).text();
weight=$tds.eq(4).text();
unit=$tds.eq(5).text();
mrp=$(this).closest('tr').find("td:nth-child(7)").find("#mrp").val();
qty=$(this).closest('tr').find("td:nth-child(8)").find("#quat").val();
rate=$(this).closest('tr').find("td:nth-child(9)").find("#rt").val();
discountper=$(this).closest('tr').find("td:nth-child(10)").find("#disper").val();
discount=$(this).closest('tr').find("td:nth-child(11)").find("#dis").val();
taxable=$tds.eq(11).text();
cgstper=$tds.eq(12).text();
cgstrs=$tds.eq(13).text();
sgstper=$tds.eq(14).text();
sgstrs=$tds.eq(15).text();
igstper=$tds.eq(16).text();
igstrs=$tds.eq(17).text();
total=$tds.eq(18).text();
totpur=$(this).closest('tr').find("td:nth-child(20)").find("#totpur").val();
t_pur=$(this).closest('tr').find("td:nth-child(21)").find("#t_pur").val();
prod_id=$(this).closest('tr').find("td:nth-child(22)").find("#prod_id").val();
if(product===null || product===undefined || product==='')
{alert("Please add product details.");}
else
	{
	s={
		'product':product,
		'hsn':hsn,
		'weight':weight,
		'unit':unit,
		'mrp':mrp,
		'qty':qty,
		'rate':rate,
		'discountper':discountper,
		'discount':discount,
		'taxable':taxable,
		'cgst_per':cgstper,
		'cgst_rs':cgstrs,
		'sgst_per':sgstper,
		'sgst_rs':sgstrs,
		'igst_per':igstper,
		'igst_rs':igstrs,
		'total':total,
		't_pur':t_pur,
		'totpur':totpur,
		'totpur':totpur,
		'prod_id':prod_id,
	};
	jobj.push(s);
 } // closing of else
})// closing of function

var jstring=JSON.stringify(jobj);
var saleid=document.getElementById("sale_id").value;
var invoiceid=document.getElementById("invoiceid").value;

if(jstring==='[]'){
alert("Please add Store Product.");
}
else{

document.getElementById("jsonstring").value=jstring;
var customer_name=document.getElementById("customer_name").value;
var consignee_name=document.getElementById("consignee_name").value;


if(customer_name===''){
alert("Please Fill Customer Name");
document.getElementById("customer_name").focus();
}
/* else if(consignee_name===''){
alert("Please Fill Shipped Name");
document.getElementById("consignee_name").focus();
} */
/* else
{
document.getElementById("myForm").submit();
setTimeout(function()
{
	   window.location.reload(1);
}, 3000);
}  */
	
</script>
</html>