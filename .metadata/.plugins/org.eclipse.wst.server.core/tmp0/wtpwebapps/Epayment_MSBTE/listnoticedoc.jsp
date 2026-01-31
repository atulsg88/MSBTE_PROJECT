<%@page import="com.epayment.Bean.NoticeDocBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.MSBTEBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="allcss.jsp" %>
<title>Notice List</title>
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
					<li>Notice List</li>
				</ul>
			</div>
		</div>	
	
	
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="col-md-12">			
							<div class="col-md-2">			
								<small>
								<a href="NoticeDoc?action=addnotice"><button class="btn btn-info" type="submit" style="float: right;">Add New Notice</button></a> 
								</small>
						    </div>
						    <div class=" text-right">
								<a class="btn btn-info" onclick="printData()">Print</a> 								
								</div>
								<div class="col-lg-6">
								<input id="search" type="text" placeholder="Search.." class="form-control">
								</div>								<br>
							<div class="col-md-12 table-responsive">					
								<table class="table table-bordered table-striped mb-0" id="datatable-editable">
									<thead>
										<tr>
											<th style="width:10%">Sr.No</th>
											<th style="width:60%">Name</th>
											<th style="width:20%">Status</th>
											<th style="width:10%">Action</th>
											
										</tr>
									</thead>
									<tbody id="myTable">
							        <%ArrayList<NoticeDocBean> activelist = (ArrayList<NoticeDocBean>)request.getAttribute("ndList"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<NoticeDocBean>();
			                         }
				                    %>
									<% 
			                          int i=1;
			                          for(NoticeDocBean bn :activelist){ 
			                          if(bn.getNoticedoc_status().equalsIgnoreCase("1")) 
				                      {%>				                        	     
										<tr data-item-id="1">
											    <td><%=i++ %></td>
                                                <td><%=bn.getNoticedoc_name()%></td>											                                              
                                                <td><%=(bn.getNoticedoc_status().equals("1"))?"Active":"Deactive"%></td>  
											    <td class="actions">
												<a href="NoticeDoc?action=editnotice&noticedoc_id=<%=bn.getNoticedoc_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Syllabus"></i></a>		
											</td>
										</tr>
										<%}}%>		
							     </tbody>
									 <tr><td colspan="10"><hr style="border: 0.9px solid grey;"></td></tr>
						            <tbody>
						            <%ArrayList<NoticeDocBean> deactivelist = (ArrayList<NoticeDocBean>)request.getAttribute("ndList"); 
                         
				                         if(deactivelist==null)
				                         {
				                        	 deactivelist=new ArrayList<NoticeDocBean>();
				                         }
				                         %>
				    				
				                          <% 
				                          for(NoticeDocBean bn :deactivelist){
				                        	  if(bn.getNoticedoc_status().equalsIgnoreCase("0")) 
					                        	 {%>	                    
										<tr data-item-id="1">
											    <td><%=i++ %></td>
                                                <td><%= bn.getNoticedoc_name()%></td>											                                             
                                                <td><%=(bn.getNoticedoc_status().equals("0"))?"Active":"Deactive"%></td> 
											    <td class="actions">
												<a href="NoticeDoc?action=editnotice&noticedoc_id=<%=bn.getNoticedoc_id()%>" class="on-default edit-row"><i class="fa fa-pencil" title="Edit Notice Document"></i></a>
								                <%-- <a href="NoticeDoc?action=deleteNoticeDoc&noticedoc_id=<%=bn.getNoticedoc_id()%>&noticedoc_status=<%=bn.getNoticedoc_status()%>" class="on-default remove-row"><i class="fa fa-trash-o" title="Deactivate Notice Document" onclick="return confirm('Are you sure you want to Deactivate this Notice Document?')"></i></a> --%>
											</td>
										</tr>
										 <%}}%>	
						            
						            </tbody>
								</table>
							</div>	
						</div>	
					</div>
					</div>
				</div>
			</div>
	</main>
	





<%@include file="alljs.jsp" %>
</body>
<script>
$(document).ready(function(){
  $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script type="text/javascript">
function printData()
{
   var divToPrint=document.getElementById("datatable-editable");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML); 
   newWin.print();
   newWin.close();
}
</script>
</html>