<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib uri="/struts-tags" prefix="s" %>

<%@	page import="java.util.ArrayList" %>
<%@	page import="java.util.HashMap" %>
<html lang="en">
<head>
	<title>YouGrest</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/icons/logo.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
<!--===============================================================================================-->
	
	<style type="text/css">
		#logo {
			margin-left: -5%;
		}
		
		.wrap-login100 {
		  width: 960px;
		  background: #fff;
		  border-radius: 10px;
		  overflow: hidden;
		
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -moz-box;
		  display: -ms-flexbox;
		  display: flex;
		  flex-wrap: wrap;
		  justify-content: space-between;
		  padding: 95px 130px 95px 95px;
		}
		
		copyright {
			clear: both;
			text-align: center;
			padding-top: 54px;
			padding-bottom: 0px;
		}
		
		@media (max-width: 992px) {
		  .wrap-login100 {
		    padding: 85px 90px 85px 85px;
		  }
		}
		
		@media (max-width: 768px) {
		  .wrap-login100 {
		    padding: 80px 80px 80px 80px;
		  }
		 }
		 
		 @media (max-width: 576px) {
		  .wrap-login100 {
		    padding: 15px 15px 15px 15px;
		  }
		}
		
	</style>

</head>
<body>
	
	<div class="limiter">
	
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-02.png" alt="IMG">
				</div>

				<form action="login.action" class="login100-form validate-form">
					<div class="login100-brand" data-tilt style="margin-bottom: -5%;">
						<div class="login100-form-title" style="text-align: center;">
							<img id="logo" alt="" src="<%=request.getContextPath()%>/images/logo.png" 
								height="62px" />
							<span style="color: #d8a451; width: auto; margin-right: -3px;">
								You
							</span>
							<span style="color: #cd903f; width: auto;">
								Gre
							</span>
							<span style="color: #c86b32; width: auto; margin-left: -3px;">
								st
							</span>
						</div>
					</div>
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "User is required">
						<input class="input100" type="text" id="user" name="inParam1" placeholder="User">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="inParam2" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<input type="hidden" name="inParam3" value="<%=java.net.InetAddress.getLocalHost().getHostName() %>">
					<input type="hidden" name="inParam4" value="<%=java.net.InetAddress.getLocalHost().getHostName() %>">
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>
					
					<!-- <div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div> -->
				</form>
				
				<div class="login100-form-title copyright">
					<p>Negozio On-line<sup>&copy;</sup></p>
				</div>
				
			</div>
		</div>
	</div>

	
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
		$(document).ready(function() {
			session.invalidate();
			var res = ${result[0].user_exists}
			if (res !== null){
				alert("Login Fallito - Ritenta un'altra volta!!!");
			}
		});
	</script>
<!--===============================================================================================-->
	<script src="js/login.js"></script>

</body>
</html>