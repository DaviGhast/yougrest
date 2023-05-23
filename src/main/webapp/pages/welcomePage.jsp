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
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
	<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/onepcssgrid.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://printjs-4de6.kxcdn.com/print.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css">
	
	<style type="text/css">
		
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
			/*border: 1px solid;*/
			width: 100%;
		}
		
		.input100 {
			height: 30px;
			padding: 0 30px 0 30px;
			border: 1px solid;
			background: #ffffff;
		}
		
		.tab {
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
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/popper.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/tilt/tilt.jquery.min.js"></script>
<!--===============================================================================================-->
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/responsive/2.4.1/js/dataTables.responsive.min.js"></script>
<!--===============================================================================================-->
	<script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
	
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		});
		$(document).ready( function () {
			debugger;
			var url = 'GetSubWeekList.action?inParam1=&inParam2=&inParam3=';
			url = url.replace('inParam1=', 'inParam1=${result[0]}');
			url = url.replace('inParam2=', 'inParam2=${sessionScope.login.selectedGrest.id}');
			url = url.replace('inParam3=', 'inParam3=${sessionScope.login.oratory.id}');
			if ( $.fn.dataTable.isDataTable( '#subWeek' ) ) {
			    table = $('#subWeek').DataTable();
			    table.destroy();
			}
			else {
			    table = $('#subWeek').DataTable({
			    	language: {
			            url: 'https://cdn.datatables.net/plug-ins/a5734b29083/i18n/Italian.json',
			        },
			        ajax: {
			            url: url,
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
			            	defaultContent: '<button type="button" '+
			            	'class="btn btn-success btn-sm dt-view" style="margin-left:5px; margin-right:16px;" '+
			            	'title="inserisci" onclick="addToRegister(this)">'+
			            		'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"'+
			            		'class="bi bi-file-earmark-plus fs-6" viewBox="0 0 16 16">'+
			            		'<path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0'+
			            		' 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>'+
								'</svg>'+
			            	'</button>'+
			            	'<button type="button" '+
				            	'class="btn btn-danger btn-sm dt-view" style="margin-left:5px; margin-right:16px;" '+
				            	'title="Rimuovi" onclick="removeToRegister(this)">'+
				            	'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"'+
				            	'class="bi bi-pencil-square" viewBox="0 0 16 16">'+
				            	'<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0'+
				            	' 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 '+
				            	'0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>'+
				            	'</svg>'+
				            '</button>'
			            }
					]
			    });
			}
		});
		var tempEle = null;
		function addToRegister(ele) {
			debugger;
			if ( $('#registerType').text().trim() == '') {
				alert("Seleziona prima un registro");
			} else {
				if ( $('#registerType').text().trim() == 'Piscina') {
					var dataRow = $('#subWeek').DataTable().row($(ele).closest('tr')).data();
					var url = 'CheckPool.action?inParam1=&inParam2=&inParam3=&inParam4=';
					url = url.replace('inParam1=', 'inParam1=${result[0]}');
					url = url.replace('inParam2=', 'inParam2='+dataRow.id);
					url = url.replace('inParam3=', 'inParam3=${sessionScope.login.selectedGrest.id}');
					url = url.replace('inParam4=', 'inParam4=${sessionScope.login.oratory.id}');
					var defaultGrest = $.ajax({url: url, type: 'POST', cache: false});
		    		defaultGrest.done( function (responseData) {
		    			debugger;
		    			var json = JSON.parse(responseData);
		    			if (json.data[0].success == '1') {
		    				insertRegister(ele);
		    			} else {
		    				tempEle = ele;
		    				$('#confPool').modal('show');
						}
		    		});
				} else if ($('#registerType').text().trim() == 'Pranzo') {
					var dataRow = $('#subWeek').DataTable().row($(ele).closest('tr')).data();
					var url = 'CheckLunch.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=';
					url = url.replace('inParam1=', 'inParam1=${result[0]}');
					url = url.replace('inParam2=', 'inParam2=${result[1]}');
					url = url.replace('inParam3=', 'inParam3='+dataRow.id);
					url = url.replace('inParam4=', 'inParam4=${sessionScope.login.selectedGrest.id}');
					url = url.replace('inParam5=', 'inParam5=${sessionScope.login.oratory.id}');
					var defaultGrest = $.ajax({url: url, type: 'POST', cache: false});
		    		defaultGrest.done( function (responseData) {
		    			debugger;
		    			var json = JSON.parse(responseData);
		    			if (json.data[0].success == '1') {
		    				insertRegister(ele);
		    			} else {
		    				tempEle = ele;
		    				$('#confLunch').modal('show');
						}
		    		});
				} else if ($('#registerType').text().trim() == 'Uscita_Mattino' || $('#registerType').text().trim() == 'Uscita_Pomeriggio') {
					var dataRow = $('#subWeek').DataTable().row($(ele).closest('tr')).data();
					var url = 'CheckAuthExit.action?inParam1=&inParam2=&inParam3=';
					url = url.replace('inParam1=', 'inParam1='+dataRow.id);
					url = url.replace('inParam2=', 'inParam2=${sessionScope.login.selectedGrest.id}');
					url = url.replace('inParam3=', 'inParam3=${sessionScope.login.oratory.id}');
					var defaultGrest = $.ajax({url: url, type: 'POST', cache: false});
		    		defaultGrest.done( function (responseData) {
		    			debugger;
		    			var json = JSON.parse(responseData);
		    			if (json.data[0].success == '1') {
		    				insertRegister(ele);
		    			} else {
		    				tempEle = ele;
		    				$('#confExit').modal('show');
						}
		    		});
				} else {
					insertRegister(ele);
				}
			}
            
        }
		function confInsPool() {
			insertRegister(tempEle);
		}
		function confInsLunch() {
			insertRegister(tempEle);
		}
		function confInsExit() {
			insertRegister(tempEle);
		}
		function insertRegister(ele) {
			var dataRow = $('#subWeek').DataTable().row($(ele).closest('tr')).data();
			var url = 'RegisterDuplicate.action?inParam1=&inParam2=&inParam3=&inParam4=';
			url = url.replace('inParam1=', 'inParam1='+$('#registerType').text().trim());
			url = url.replace('inParam2=', 'inParam2=${result[0]}');
			url = url.replace('inParam3=', 'inParam3=${result[1]}');
			url = url.replace('inParam4=', 'inParam4='+dataRow.id);
			var defaultGrest = $.ajax({url: url, type: 'POST', cache: false});
    		defaultGrest.done( function (responseData) {
    			debugger;
    			var json = JSON.parse(responseData);
    			$('#succesModal').modal('show');
    			if (json.data[0].success == '0') {
    				var url = 'InsertRegister.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=&inParam7=';
    				url = url.replace('inParam1=', 'inParam1='+$('#registerType').text().trim());
    				url = url.replace('inParam2=', 'inParam2=${result[0]}');
    				url = url.replace('inParam3=', 'inParam3=${result[1]}');
    				url = url.replace('inParam4=', 'inParam4='+dataRow.id);
    				var defaultGrest = $.ajax({url: url, type: 'POST', cache: false});
    	    		defaultGrest.done( function (responseData) {
    	    			debugger;
    	    			var json = JSON.parse(responseData);
    	    			$('#succesModal').modal('show');
    	    			if (json.data[0].success == '1') {
    	    				 $('#result').text("Inserimento Effettuato con Successo!!");
    	    			} else {
    	    				$('#result').text("Errore Inserimento Non Effettuato!!");
    					}
    	    			
    	    		});
				} 
    			else {
    				$('#result').text("Iscritto è già stato Segnato!!");
				}
    			
    		});
		}
		function removeToRegister(ele) {
			if ( $('#registerType').text().trim() == '') {
				alert("Seleziona prima un registro");
			} else {
				tempEle = ele;
				$('#confRemove').modal('show');
				var dataRow = $('#subWeek').DataTable().row($(ele).closest('tr')).data();
				$('#confSubText').text(dataRow.surname+' '+dataRow.name);
				$('#confRegisterText').text($('#registerType').text());
			}
		}
		function confRemove() {
			removeRegister(tempEle);
		}
		function removeRegister(ele) {
			var dataRow = $('#subWeek').DataTable().row($(ele).closest('tr')).data();
			var url = 'RemoveRegister.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=&inParam7=';
			url = url.replace('inParam1=', 'inParam1='+$('#registerType').text().trim());
			url = url.replace('inParam2=', 'inParam2=${result[0]}');
			url = url.replace('inParam3=', 'inParam3=${result[1]}');
			url = url.replace('inParam4=', 'inParam4='+dataRow.id);
			var defaultGrest = $.ajax({url: url, type: 'POST', cache: false});
    		defaultGrest.done( function (responseData) {
    			debugger;
    			var json = JSON.parse(responseData);
    			$('#confRemove').modal('hide');
    			$('#succesModal').modal('show');
    			if (json.data[0].success == '0') {
    				 $('#result').text("Rimosso con Successo!!");
    			} else {
    				$('#result').text("Errore Inserimento Non Effettuato!!");
				}
    			
    		});
				
		}
		function openCard(evt, type) {
			debugger;
			  var i, tablinks;
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
			  evt.currentTarget.className += " active";
			  $('#registerType').text(type);
		}
		
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
			
				<div class="wrap-login100" style="border: 1px solid; width: auto;">
					<div class="container-fluid login100-form-title">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
						class="bi bi-journal-text fs-2" viewBox="0 0 16 16">
						  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
						  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
						  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
						</svg>
						<span class="">
							Registri ed Elenchi Accoglienza
						</span>
					</div>
					
					<div class="wrap-login100" style="width: 100%; border: 1px solid;">
					
						<c:if test="${result[1] eq result[2].trip_day}">
							
							<div class="wrap-div" style="width: 100%;">
						
								<div class="item-menu">
							      	<button class="btn btn-success tab tablinks" 
							      	onclick="openCard(event, 'Ingresso_Mattino')" disabled="disabled">
										<span class="fs-6">
											<b>Gita</b>
										</span>
									</button>
								</div>
					            
							</div>
							
						</c:if>
			
						<c:if test="${result[1] ne result[2].trip_day}">
						
							<div class="wrap-div" style="width: 100%;">
						
								<div class="item-menu">
							      	<button class="btn btn-success tab tablinks" 
							      	onclick="openCard(event, 'Ingresso_Mattino')">
										<span class="fs-6">
											<b>Ingressi Mattino</b>
										</span>
									</button>
								</div>
								
								<div class="item-menu">
							      	<button class="btn btn-primary tab tablinks" 
							      	onclick="openCard(event, 'Pranzo')">
										<span class="fs-6">
											<b>Pranzo</b>
										</span>
									</button>
								</div>
								
								<c:if test="${result[1] eq result[2].pool_day}">
									<div class="item-menu">
								      	<button class="btn btn-primary tab tablinks" 
								      	onclick="openCard(event, 'Piscina')">
											<span class="fs-6">
												<b>Piscina</b>
											</span>
										</button>
									</div>
								</c:if>
								
								<div class="item-menu">
							      	<button class="btn btn-danger tab tablinks" 
							      	onclick="openCard(event, 'Uscita_Mattino')">
										<span class="fs-6">
											<b>Uscite Mattino</b>
										</span>
									</button>
								</div>
					            
							</div>
								
							<div class="wrap-div" style="width: 100%; padding: 10px;">
															
								<div class="item-menu">
							      	<button class="btn btn-success tab tablinks" 
							      	onclick="openCard(event, 'Ingresso_Pomeriggio')">
										<span class="fs-6">
											<b>Ingressi Pomeriggio</b>
										</span>
									</button>
								</div>
								
								<div class="item-menu">
							      	<button class="btn btn-warning tab tablinks" 
							      	onclick="openCard(event, 'Ingresso_Mattino')" disabled="disabled">
										<span class="fs-6">
											<b>Entrate Posticipate</b>
										</span>
									</button>
								</div>
								
								<div class="item-menu">
							      	<button class="btn btn-warning tab tablinks" 
							      	onclick="openCard(event, 'Ingresso_Mattino')" disabled="disabled">
										<span class="fs-6">
											<b>Uscite Anticipate</b>
										</span>
									</button>
								</div>
								
								<div class="item-menu">
							      	<button class="btn btn-danger tab tablinks" 
							      	onclick="openCard(event, 'Uscita_Pomeriggio')">
										<span class="fs-6">
											<b>Uscite Pomeriggio</b>
										</span>
									</button>
								</div>
					            
							</div>
						
						</c:if>
					
						
						
					</div>
					
					<div class="container-fluid login100-form-title"
					style="padding-bottom: 0px; padding-top: 20px;">
						<span class="">
							Hai Selezionato
						</span>
						<span id="registerType"></span>
					</div>
					
					<div class="wrap-div" style="width: 100%; margin-top: 1%;">
						<div class="" style="width:100%">
							<table id="subWeek" class="display nowrap">
							    <thead>
							        <tr>
							            <th>ID</th>
							           	<th>Cognome</th>
							            <th>Nome</th>
							            <th>Classe</th>
							            <th style="text-align:center;width:100px;">Azioni</th>
							        </tr>
							    </thead>
							</table>
						</div>
					</div>
				
				</div>
		</div>
					
	</div>
		
</div>

<!-- confPool Modal -->
<div class="modal fade" id="confPool" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
					class="bi bi-journal-text fs-2" viewBox="0 0 16 16">
					  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
					  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
					  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
					</svg>
					<span class="">Conferma</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body alert alert-danger">
				<span id="">Non sembra essere iscritto alla Piscina.</span>	
				<span id="">Vuoi lo Stesso continuare e quindi inserirlo?</span>	
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
	      		<button type="button" class="btn btn-primary" onclick="confInsPool()">Conferma</button>			
	        </div>
   		</div>
	</div>
</div>

<!-- confPool Modal -->
<div class="modal fade" id="confLunch" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
					class="bi bi-journal-text fs-2" viewBox="0 0 16 16">
					  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
					  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
					  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
					</svg>
					<span class="">Conferma</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body alert alert-danger">
				<span id="">Non sembra essere iscritto al Pranzo.</span>	
				<span id="">Vuoi lo Stesso continuare e quindi inserirlo?</span>	
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
	      		<button type="button" class="btn btn-primary" onclick="confInsLunch()">Conferma</button>			
	        </div>
   		</div>
	</div>
</div>

<!-- confPool Modal -->
<div class="modal fade" id="confExit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
					class="bi bi-journal-text fs-2" viewBox="0 0 16 16">
					  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
					  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
					  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
					</svg>
					<span class="">Conferma</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body alert alert-warning">
				<span id="">Non è autorizzato ad uscire da solo!!!</span>	
				<span id="">Mi raccomando conferma solo se ci sono i genitori!!</span>	
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
	      		<button type="button" class="btn btn-primary" onclick="confInsExit()">Conferma</button>			
	        </div>
   		</div>
	</div>
</div>

<!-- confPool Modal -->
<div class="modal fade" id="confRemove" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
					class="bi bi-journal-text fs-2" viewBox="0 0 16 16">
					  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
					  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
					  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
					</svg>
					<span class="">Conferma</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body alert alert-warning">
				<span id="">Sei davvero sicuro di voler Rimuovere </span><span id="confSubText"></span>
				<span id=""> dal registro </span><span id="confRegisterText"></span>
				<span id=""> ?</span>
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
	      		<button type="button" class="btn btn-primary" onclick="confRemove()">Conferma</button>			
	        </div>
   		</div>
	</div>
</div>

<!-- succesModal Modal -->
<div class="modal fade" id="succesModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
					class="bi bi-journal-text fs-2" viewBox="0 0 16 16">
					  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
					  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
					  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
					</svg>
					<span class="">Risultato</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="background-color: #ecf0f1">
				<span id="result"></span>	
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
	      						
	        </div>
   		</div>
	</div>
</div>

</body>
</html>