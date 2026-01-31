<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.epayment.Bean.NoticeDocBean"%>
<%@page import="com.epayment.Util.Util"%>
<%@page import="com.epayment.Bean.MSBTEBean"%>
<html lang="en">
<head>
<%@ include file="allcss.jsp" %>
<title>MSBTE</title>
</head>
<body class="ttr-opened-sidebar ttr-pinned-sidebar">

<%
  NoticeDocBean editNotice =(NoticeDocBean)request.getAttribute("nb");
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
						<a href="#" class="ttr-material-button">
							<span class="ttr-icon"><i class="ti-book"></i></span>
		                	<span class="ttr-label">Circular</span>
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

	<!--Main container start -->
	<main class="ttr-wrapper">
		<div class="container-fluid">
			<div class="db-breadcrumb">
				<h4 class="breadcrumb-title">Dashboard</h4>
				<ul class="db-breadcrumb-list">
					<!-- <li><a href="#"><i class="fa fa-home"></i>Home</a></li> -->
					<li>Circular</li>
				</ul>
			</div>
		</div>	
	
	<div class="ttr-overlay"></div>

		<div class="col-lg-12 m-b30">
		<div class="widget-box">
		<div class="wc-title">
			<h4>Notice</h4>
		</div>
		<div class="widget-inner">
		<section class="card">
					<header class="card-header">
						<h4 class="card-title">Upload Student Notice Documents </h4>
					</header>
					<div class="card-body">
						<div class="row">
						    <div class="col-lg-12">
								<form id="form" action="NoticeDoc" onsubmit="return docsValidate();" method="post">
									<section class="card">
										<div class="card-body">
										    <input type="hidden" class="form-control" id="noticedoc_id" name="noticedoc_id" value="<%=(editNotice!=null)?editNotice.getNoticedoc_id():""%>">
											<div class="form-group row">										
												<div class="col-sm-4">
												<label class="control-label text-sm-right pt-2">Name<span class="required">*</span></label>
													 <input type="text" class="form-control" id="noticedoc_name" name="noticedoc_name"  value="<%=(editNotice!=null)?editNotice.getNoticedoc_name():""%>">
												</div>
												<div class="col-sm">
												    <label class="control-label text-sm-right pt-2"> Select Notice Documents <span class="required">*</span></label>
													<input type="file" accept=".jpeg,.png,.pdf,.doc" name="file" id="file" onchange="readURL(this);" required="required"><br>
	                                                <input type="hidden" name="noticedoc_img" id="noticedoc_img" value="">
												    <input type="hidden" name="edit_noticedoc_img" id="edit_noticedoc_img" value="<%=(editNotice!=null)?editNotice.getNoticedoc_img():""%>">
												</div>							
												<div class="col-sm-4">
													<button type="submit" class="btn btn-primary">Upload</button>
												</div>								  
											</div>
											<div class="form-group row">										
												<div class="col-sm-12">
												<span style="color: red;">(Supported Document Format : *.jpeg,*.png,*.pdf, *.doc) (Max. Document Size: 2 mb)</span><br>
												<span>For compress document follow given link- <a href="https://tinypng.com" style="color: blue;" target="_blank">https://tinypng.com</a></span>
												</div>
											</div>
										</div>
									</section>
								</form>
						</div>
					</div>
				</div>					
				</section>
				
				<section class="card">
							<header class="card-header">
								<h4 class="card-title">Uploaded Document List</h4>
							</header>
							<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
									<table class="table table-bordered">
									<thead style="color: white;">
										<tr>
											<th colspan="8">Notice Document Name</th>
											<th colspan="4" >Download Notice Document</th>
										</tr>
									</thead>
									<tbody>
									    <%ArrayList<NoticeDocBean> noticedoclist = (ArrayList<NoticeDocBean>)request.getAttribute("ndList"); 
				                         if(noticedoclist==null)
				                         {noticedoclist=new ArrayList<NoticeDocBean>(); }
				                         %>
				                         <%int i=1;
				                         for(NoticeDocBean bn :noticedoclist)
				                        	 if(bn.getNoticedoc_status().equalsIgnoreCase("1")) 
						                      {{ 
				                         %>      
										<tr>
                                          <td colspan="6" style="font-size: 15px;"><b><%=bn.getNoticedoc_name()%></b></td>
                                          <td colspan="6"><a href="NoticeDoc?action=download&download_img=<%=bn.getNoticedoc_img()%>"><i class="fa fa-download" aria-hidden="true"></i></td>
										</tr>
										 <%}}%>										
									</tbody>
							</table>
						</div>
					</div>
					
					<div class="row justify-content-end">
						<div class="col-sm-11" align="center">
					     <a href="#" class="btn btn-primary" >Submit</a>
						</div>
					</div>	
				</div>				
				
				</section>
			</div>
		  </div>
		</div>
	</main>
		
<%@include file="alljs.jsp" %>
<script type="text/javascript">
	function docsValidate()
	 {  
	  var ispdf = function(name)
	  {return name.match(/pdf$/i)};
	  var isdoc = function(name)
	  {return name.match(/doc$/i)};
	  
	 
	  var file = $('[name="file"]');
	  var filename = $.trim(file.val());
      if (!(ispdf(filename) || isdoc(filename))) 
      {
      alert('Please browse a pdf/doc file to upload.');
      return false;
      }
	}
	</script>
	<script type="text/javascript">
	 function readURL(input) {
	 if(input.files[0].size > 524288)
	 {
       alert("Document size too big! compress image less than 2 MB.");
       $('#file').val("");
	 }
	 else if (input.files && input.files[0]) 
	 {
       var reader = new FileReader();
       reader.onload = function (e) {
       $('#noticedoc_img').val(e.target.result); 
       };
       reader.readAsDataURL(input.files[0]);    
      }
    }
	</script>
</body>
</html>