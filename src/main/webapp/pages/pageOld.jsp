<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib uri="/struts-tags" prefix="s" %>

<%@	page import="java.util.ArrayList" %>
<%@	page import="java.util.HashMap" %>
<html lang="en">
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/onepcssgrid.css">
<!--===============================================================================================-->
	
	<style type="text/css">
		
		.myrow {
			height: 90.8%;
			padding: 0;
		}
		
		.mygrid {
			height: 100.5% !important;
		}
		
		.mycol {
			min-height: 98.7%;
			height: 96%;
			margin: 0px 2% 0px 0px;
		}
		
		.col1 {
			width: 5.5%;
			float: left;
		}
		
		.col11 {
			width: 90.5%;
			float: left;
		}
		
		.row1 {
			height: 5%;
			width: 100%;
			float: left;
		}
		
		.onerow {
			clear: both;
		}
		
		.myPage {
			padding: 0;
		}
		
		.wrap-div {
		  background: #afb2b3;
		  overflow: hidden;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -moz-box;
		  display: -ms-flexbox;
		  display: flex;
		  flex-wrap: wrap;
		  justify-content: space-between;
		}
		
		body {
			background: #9053c7;
		  background: -webkit-linear-gradient(-135deg, #c850c0, #4158d0);
		  background: -o-linear-gradient(-135deg, #c850c0, #4158d0);
		  background: -moz-linear-gradient(-135deg, #c850c0, #4158d0);
		  background: linear-gradient(-135deg, #c850c0, #4158d0);
		}
		
		#header {
			border: 0;
			z-index: 1;
			float: left;
			width: 100%;
			height: 50px;
		}
		
		#menu {
			border: 0;
			z-index: 1;
			float: left;
			width: 5.5%;
			min-height: 95% !important;
			height: 95% !important;
		}
		
		#page {
			border: 0;
			z-index: 1;
			float: left;
			width: 94.5%;
			margin-left: 5.5%;
			min-height: 95% !important;
			height: 95% !important;
		}
	
	</style>
	
	<!--===============================================================================================-->	
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
		$(document).ready(function() {
			
		});
	</script>

</head>
<body>
	<header>
		<iframe id="header" class="row1" src="<%=request.getContextPath()%>/pages/header.jsp"
				style="position: relative; border: none" > </iframe>
	</header>
	
	<div>
		
		<c:if test="${empty sessionScope.login}">
			<script type="text/javascript">
				window.top.location.href="sessionexpired.jsp"
			</script>
		</c:if>
		
		<div class="myPage mygrid">
			
			
			<div class="onerow myrow">
				<div class="col1 mycol" id="colMenu">
					<iframe id="menu" src="<%=request.getContextPath()%>/pages/menu.jsp" 
					style="position: absolute; border: none" > </iframe>
					
				</div>
				<div class="col11 mycol" id="colPage">
				
					<iframe id="page" src="<%=request.getContextPath()%>/pages/home.jsp" 
					style="position: absolute; border: none" > </iframe>
					
					
				</div>
			</div>
		</div>
		
		
		
		
	</div>

	

<!--===============================================================================================-->
	

</body>
</html>