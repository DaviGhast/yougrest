<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib uri="/struts-tags" prefix="s" %>

<%@	page import="java.util.ArrayList" %>
<%@	page import="java.util.HashMap" %>
<html lang="en">
<head>
	<title>login Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/icons/logo.ico"/>
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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/preHome.css">
<!--===============================================================================================-->
	
	<style type="text/css">
	
	
	</style>

</head>
<body>
	
	<div class="limiter">
		
		<c:if test="${empty sessionScope.login}">
			<script type="text/javascript">
				window.top.location.href="sessionexpired.jsp"
			</script>
		</c:if>
		
		<div class="container-pre100">
			<div class="wrap-pre100">
				
				<span class="pre100-form-title">
					<c:if test="${not empty sessionScope.login}">
						Ciao ${sessionScope.login.username}
					</c:if>
				</span>
				
				<span class="pre100-form-title">
						Seleziona Oratorio
				</span>
				
				<c:forEach var="res" items="${result[0]}">
				
					<div class="pre100-pic" data-tilt onclick="openUrl('${res.id}', '${res.name}', '${res.location}');">
						<img src="images/img-01.png" alt="IMG">
						<br>
						<span class="pre100-form-title">
							${res.location}
						</span>
					</div>
					
				</c:forEach>
				
			</div>
		</div>
	</div>

	
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
		function openUrl(id, name, location) {
			debugger;
			var url = 'SelectOratory.action?inParam1=&inParam2=&inParam3=';
			url = url.replace("inParam1=","inParam1="+id);
			url = url.replace("inParam2=","inParam2="+name);
			url = url.replace("inParam3=","inParam3="+location);
			window.top.location.href=url;
		}
	</script>
<!--===============================================================================================-->
	

</body>
</html>