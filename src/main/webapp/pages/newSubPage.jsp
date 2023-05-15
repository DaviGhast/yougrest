<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib uri="/struts-tags" prefix="s" %>

<html lang="en">
<head>
	<title>Nuove Iscrizioni</title>
	
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
		    $('#myTable').DataTable({
		    	language: {
		            url: 'https://cdn.datatables.net/plug-ins/a5734b29083/i18n/Italian.json',
		        },
		        ajax: {
		            url: 'PersonNotSubListByGrest.action',
		            method: "POST",
		            contentType: 'application/json'
		        },
		        columns: [
		            { data: 'id' },
		            { data: 'surname' },
		            { data: 'name' },
		            { data: 'school_class' }		            
		        ],
		        columnDefs: [
		        	{
		        		targets: 4,
		        		orderable: false,
		            	data: null,
		            	defaultContent: '<span style="margin-left:20px;">'+
		            	'<b>Effettuare Iscrizione</b></span><button type="button" '+
		            	'class="btn btn-success btn-sm dt-view" style="margin-left:5px;" '+
		            	'title="Apri Anagrafica" onclick="newSub(this)">'+
		            		'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" '+
		            		'fill="currentColor" class="bi bi-person-vcard-fill" '+
		            		'viewBox="0 0 16 16">'+
				 				'<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 '+
				 				'2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 '+
				 				'0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 '+
				 				'2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 '+
				 				'10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 '+
				 				'13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>'+
							'</svg>'+
		            	'</button>'
		            }
				]
		        /*dom: 'Bfrtip',
		        buttons: [
		            'colvis'
				]*/
		    });
		});
		function newPerson(ele) {
			debugger;
            var dataRow = $('#myTable').DataTable().row($(ele).closest('tr')).data();
            $('#insertNewPersonModal').modal('show');
        }
		function newSub(ele) {
			debugger;
            var dataRow = $('#myTable').DataTable().row($(ele).closest('tr')).data();
            $('#insertNewSubModal').modal('show');
            $('#subSurname').val(dataRow.surname);
            $('#subIdPerson').val(dataRow.id);
            $('#subName').val(dataRow.name);
            $('#subName').val(dataRow.name);
            $('#subClass').val(dataRow.school_class);
            //TODO: get grestOratory
            /*var defaultGrest = $.ajax({url: 'IndicatorsMenu.action', type: 'GET', cache: false});
    		defaultGrest.done( function (responseData) {
    			var json = JSON.parse(responseData);
    			alert(json.data[0].name);
    			
    		});*/
        }
		function GetDetails(ele) {
            var dataRow = $('#myTable').DataTable().row($(ele).closest('tr')).data();
            $('#myModal').modal('show');
            document.getElementById("defaultOpen").click();
        }
	</script>

</head>
<body>
	<header>
		<!-- <iframe id="header" class="row1" src="<%=request.getContextPath()%>/pages/header.jsp"
				style="position: relative; border: none" > </iframe> -->
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
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
						class="bi bi-person-vcard-fill fs-1" viewBox="0 0 18 18">
			 				<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
						</svg>
						<span class="">
							Pagina Nuova Iscrizione
						</span>
					</div>
					<div class="container-fluid login100-form-title fs-4">
						<!-- <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
						class="bi bi-person-vcard-fill fs-3" viewBox="0 0 18 18">
			 				<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
						</svg> -->
						<span class="">
							Anagrafiche Persone Non Iscritte
						</span>
					</div>
					<div class="tableContiner" style="width:100%">
						<table id="myTable" class="display nowrap">
						    <thead>
						        <tr>
						            <th>ID</th>
						            <th>Cognome</th>
						            <th>Nome</th>
						            <th>Classe</th>
						            <th style="text-align:center;width:100px;">Nuova Anagrafica 
						            	<button type="button" data-func="dt-add" 
						            	class="btn btn-success btn-sm dt-add" onclick="newPerson(this)">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" 
										height="16" fill="currentColor" class="bi bi-person-fill-add" 
										viewBox="0 0 16 16">
											<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0Zm-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
											<path d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
										</svg>
									</button></th>
						        </tr>
						    </thead>
						</table>
					</div>
				</div>
			</div>
					
		</div>
		
	</div>
	
<!-- Added Person Modal -->
<div class="modal fade" id="insertNewPersonModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<form id="insertNewPersonForm" action="InsertNewPerson.action">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
					class="bi bi-person-vcard-fill fs-2" viewBox="0 0 18 18">
			 			<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
					</svg>
					<span class="">Nuova Scheda Anagrafica Persona</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="background-color: #ecf0f1">
				
				<jsp:include page="/modals/insertNewPerson.jsp"></jsp:include>
							
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
				<button type="submit" class="btn btn-success">Salva</button>
	        </div>
	        </form>
   		</div>
	</div>
</div>

<!-- Added Sub Modal -->
<div class="modal fade" id="insertNewSubModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<form id="insertNewSubForm" action="InsertNewSub.action">
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
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
				<button type="submit" class="btn btn-success">Salva</button>
	        </div>
	        </form>
   		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready( function () {
		if (${result[0].action == "InsertNewPerson"}){
			$('#SuccessModal').modal('show');
		}
	});
	function success() {
		debugger;
		if (${result[0].action == "InsertNewPerson"}){
	        $('#insertNewSubModal').modal('show');
	        $('#subSurname').val(${result[0].surname});
	        $('#subIdPerson').val(${result[0].id});
	        $('#subName').val(${result[0].name});
	        $('#subClass').val(${result[0].school_class});
		} else {
			window.top.location.href="toSubsPage.action?";
		}
    }
</script>

<!-- Modal -->
<div class="modal fade" id="SuccessModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Operazione Effettuata Con Successo!!!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="success()">Save changes</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>