<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib uri="/struts-tags" prefix="s" %>

<html lang="en">
<head>
	<title>Iscrizioni</title>
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/logo.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
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
			background: transparent;
			overflow: hidden;
			display: -webkit-box;
			display: -webkit-flex;
			display: -moz-box;
			display: -ms-flexbox;
			display: flex;
			flex-wrap: wrap;
			width: 100%; 
			justify-content: space-between;
		}
		
		body{
			height: auto;
			background-color: #e1e5e6;
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
		
		.vl {
			margin-top: 2px;
			margin-bottom: 2px;
	  		border-left: 2px solid grey;
	  		border-radius: 10px;
		}
		
		.item-menu {
			text-align: center;
		}
		
		.menu-action {
			border: 1px solid;
			width: 100%;
			margin-left: 5%;
			margin-right: 5%;
			padding: 33px 20px 33px 20px;
		}
		
		.input100 {
			height: 30px;
			padding: 0 30px 0 30px;
			border: 1px solid;
			background: #ffffff;
		}
		
		.tab {
			background-color: #2c3e50;
			border-radius: 10px;
			color: white;
		}
		
		/* Change background color of buttons on hover */
		.tab:hover {
		  background-color: #ddd;
		}
		
		/* Create an active/current tablink class */
		.tab.active {
		  background-color: #ccc;
		}
		
		/* Style the tab content */
		.tabcontent {
		  display: none;
		  padding: 6px 12px;
		  border: 1px solid #ccc;
		  margin-top: 1%;
		  border-radius: 20px;
		}
		
		@media (max-width: 992px) {
			.item-menu {
				text-align: center;
				width: 22%;
			}
			
			.menu-action {
				width: 960px;
				margin-left: 0;
				margin-right: 0;
				padding: 33px 20px 33px 20px;
			}
		}
		
		@media (max-width: 992px) {
			.item-menu {
				text-align: center;
				width: 22%;
			}
			
			.menu-action {
				width: 960px;
				margin-left: 0;
				margin-right: 0;
				padding: 33px 20px 33px 20px;
			}
		}
		
		@media (max-width: 768px) {
			.item-menu {
				text-align: center;
				width: 40%;
			}
			
			#separator-2 {
				display: none;
			}
			
			.menu-action {
				width: 960px;
				margin-left: 0;
				margin-right: 0;
				padding: 33px 80px 33px 80px;
			}
		}
		
		@media (max-width: 576px) {
			.item-menu {
				width: 100%;
			}
			
			.menu-action {
				width: 960px;
				margin-left: 0;
				margin-right: 0;
				padding: 33px 80px 33px 80px;
			}
			
			.vl {
				display: none;
			}
			
			.tableContiner {
				overflow: scroll;
			}
		}
	
	</style>
	
<!--===============================================================================================-->	
	<script src="<%=request.getContextPath()%>/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/popper.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/tilt/tilt.jquery.min.js"></script>
<!--===============================================================================================-->
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
<!--===============================================================================================-->
	
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
		$(document).ready( function () {
		});
	</script>

</head>
<body>

	<header>
		<jsp:include page="/pages/nav_page.jsp"></jsp:include>
	</header>
	
	<div style="margin-top: 8%; height: 92%; min-height: 92%">
		
		<c:if test="${empty sessionScope.login}">
			<script type="text/javascript">
				window.top.location.href="sessionexpired.jsp"
			</script>
		</c:if>
		
		<div class="limiter" >
	
			<div class="container-login100" style="margin-top: 8%; height: 92%; min-height: 82vh; background: transparent;">
				
				<div class="wrap-login100" style="border: 1px solid;">
					<div class="container-fluid login100-form-title fs-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
						class="bi bi-wallet-fill fs-2" viewBox="0 0 16 16">
						  <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v2h6a.5.5 0 0 1 .5.5c0 .253.08.644.306.958.207.288.557.542 1.194.542.637 0 .987-.254 1.194-.542.226-.314.306-.705.306-.958a.5.5 0 0 1 .5-.5h6v-2A1.5 1.5 0 0 0 14.5 2h-13z"/>
						  <path d="M16 6.5h-5.551a2.678 2.678 0 0 1-.443 1.042C9.613 8.088 8.963 8.5 8 8.5c-.963 0-1.613-.412-2.006-.958A2.679 2.679 0 0 1 5.551 6.5H0v6A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-6z"/>
						</svg>
						<span class="">
							Pagina Resoconto Incassi di Oggi
						</span>
					</div>
					<c:forEach var="res" items="${result[0]}">
				
						<div class="wrap-login100" style="border: 1px solid;">
							
							<div class="container-fluid login100-form-title fs-4">
								<!-- <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
								class="bi bi-person-vcard-fill fs-3" viewBox="0 0 18 18">
					 				<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
								</svg> -->
								<span class="">
									Segreteria Oratorio ${res.location}
								</span>
							</div>
							<div class="table-responsive" style="width:100%">
								<table id="myTable" class="table" style="width:100%">
								    <thead>
								        <tr>
								            <th>Incassi per Oratorio</th>
								            <th>Euro Incassati</th>
								        </tr>
								    </thead>
								    <tbody>
								    	<c:forEach var="res1" items="${result[0]}">
								    		<tr>
								    			<td>${res1.location}</td>
								    			<td>
								    				${result[2][res1.id-1]} &euro;
								    			</td>
								    		</tr>
										</c:forEach>
								    </tbody>
								</table>
							</div>
						</div>
					
					</c:forEach>
					
				</div>
				
				
				
				
			</div>
					
		</div>
		
	</div>
	
<!-- Added Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<form id="myForm" action="">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
					class="bi bi-person-vcard-fill fs-2" viewBox="0 0 18 18">
			 			<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
					</svg>
					<span class="">Nuova Scheda Anagrafica Iscritto</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="background-color: #ecf0f1">
				
				<jsp:include page="/modals/insertNewSub.jsp"></jsp:include>
							
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<span id="alert">0</span>
	      		<div class="alert alert-danger" role="alert" style="display: none;">
	      			Error
	      		</div>
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
				<button type="submit" class="btn btn-success">Salva</button>
	        </div>
	        </form>
   		</div>
	</div>
</div>

<!-- Modify Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<form id="myForm" action="">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
					class="bi bi-person-vcard-fill fs-2" viewBox="0 0 18 18">
			 			<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
					</svg>
					<span class="">Nuova Scheda Anagrafica Iscritto</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="background-color: #ecf0f1">
				
				<jsp:include page="/modals/modifyPersonSub.jsp"></jsp:include>
							
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<span id="alert">0</span>
	      		<div class="alert alert-danger" role="alert" style="display: none;">
	      			Error
	      		</div>
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
				<button type="submit" class="btn btn-success">Salva</button>
	        </div>
	        </form>
   		</div>
	</div>
</div>


<script type="text/javascript">
	$('#myForm').on('submit', function( event ) {
		debugger;
		
	});
</script>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>