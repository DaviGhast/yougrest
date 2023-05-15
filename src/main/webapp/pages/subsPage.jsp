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
		    $('#myTable').DataTable({
		    	language: {
		            url: 'https://cdn.datatables.net/plug-ins/a5734b29083/i18n/Italian.json',
		        },
		        ajax: {
		            url: 'PersonSubListByGrest.action',
		            method: "POST",
		            contentType: 'application/json'
		        },
		        columns: [
		            { data: 'id' },
		            { data: 'surname' },
		            { data: 'name' },
		            { data: 'school_class' },
		            { data: 'oratory_location' },
		            { data: 'person_id' },
		            
		        ],
		        columnDefs: [
		        	{
		        		targets: 6,
		        		orderable: false,
		            	data: null,
		            	defaultContent: '<!--<button type="button" '+
		            	'class="btn btn-info btn-sm dt-view" style="margin-right:16px;" '+
		            	'title="Apri Anagrafica" onclick="GetDetails(this)">'+
		            		'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" '+
		            		'fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">'+
		            			'<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 '+
		            			'8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 '+
		            			'3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 '+
		            			'8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 '+
		            			'11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 '+
		            			'13.134 0 0 1 1.172 8z"/>'+
								'<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 '+
								'3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>'+
							'</svg>'+
	            		'</button>-->'+
		            	'<button type="button" class="btn btn-success btn-sm dt-payment" '+
		            	'style="margin-right:16px;" title="Registra Pagamento" onclick="payment(this)">'+
			            	'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">'+
								'<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>'+
							'</svg>'+
		            	'</button>'+
		            	'<button type="button" id="edit" class="btn btn-primary btn-sm dt-edit" style="margin-right:16px;" title="Modifica" onclick="modifySub(this)">'+
			            	'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">'+
				  				'<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>'+
								'<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>'+
							'</svg>'+
		            	'</button>'+
		            	'<!--<button type="button" class="btn btn-danger btn-sm dt-delete" title="Modifica">'+
			            	'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">'+
				  				'<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>'+
								'<path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>'+
							'</svg>'+
	            		'</button>-->'
		            }
				]
		        /*dom: 'Bfrtip',
		        buttons: [
		            'colvis'
				]*/
		    });
		});
		function modifySub(ele) {
            var dataRow = $('#myTable').DataTable().row($(ele).closest('tr')).data();
            $('#modifyModal').modal('show');
            $('#idPerson').text(dataRow.person_id);
            $('#formIdPerson').val(dataRow.person_id);
            var url = 'GetPersonById.action?inParam1=';
            url = url.replace('inParam1=', 'inParam1='+dataRow.person_id);
            var indicatorsMenu = $.ajax({url: url, type: 'POST', cache: false});
    		indicatorsMenu.done( function (responseData) {
    			var json = JSON.parse(responseData);
    			debugger;
    			$('#surname').val(json.data[0].surname);
    			$('#name').val(json.data[0].name);
    			$('#sex').val(json.data[0].birth_sex);
    			$('#birth_date').val(json.data[0].birth_date);
    			$('#birth_city').val(json.data[0].birth_city);
    			$('#cf').val(json.data[0].cf);
    			$('#residence_address').val(json.data[0].residence_address);
    			$('#residence_city').val(json.data[0].residence_city);
    			$('#school_class').val(json.data[0].school_class);
    			$('#father').val(json.data[0].father);
    			$('#mother').val(json.data[0].mother);
    			var phone = json.data[0].phone.split(' - ');
    			$('#selectPhone').find('option').remove().end();
    			$('#inputPhoneList').val("");
    			for (var i = 0; i < phone.length; i++) {
    				$('#inputPhone').val(phone[i]);
    				addPhoneToList();
    		    }
    			var ice_number = json.data[0].ice_number.split(' - ');
    			$('#selectIce').find('option').remove().end();
    			$('#inputIceList').val("");
    			for (var i = 0; i < ice_number.length; i++) {
    				$('#inputIce').val(ice_number[i]);
    				addIceToList();
    		    }
    			var email = json.data[0].email.split(' - ');
    			$('#selectEmail').find('option').remove().end();
    			$('#inputEmailList').val("");
    			for (var i = 0; i < email.length; i++) {
    				$('#inputEmail').val(email[i]);
    				addEmailToList();
    		    }
    			if (json.data[0].auth_exit == '1'){
    				$('#exit').prop('checked', true);
    				$('#inputExit').val(json.data[0].auth_exit);
    			}
    			if (json.data[0].auth_photo == '1'){
    				$('#photo').prop('checked', true);
    				$('#inputPhoto').val(json.data[0].auth_photo);
    			}
    			if (json.data[0].auth_privacy == '1'){
    				$('#privacy').prop('checked', true);
    				$('#inputPrivacy').val(json.data[0].auth_privacy);
    			}
    			if (json.data[0].auth_rescue == '1'){
    				$('#rescue').prop('checked', true);
    				$('#inputRescue').val(json.data[0].auth_rescue);
    			}
    			$('#nationality').val(json.data[0].nationality);
    		});
    		$('#idSub').text(dataRow.id);
    		$('#formIdSub').val(dataRow.id);
            var url = 'GetSubById.action?inParam1=';
            url = url.replace('inParam1=', 'inParam1='+dataRow.id);
            var indicatorsMenu = $.ajax({url: url, type: 'POST', cache: false});
    		indicatorsMenu.done( function (responseData) {
    			var json = JSON.parse(responseData);
    			$('#squad').val(json.data[0].squad);
    			$('#tshirt').val(json.data[0].tshirt);
    			$('#note').val(json.data[0].note);
    			$('#subOratory').val(json.data[0].oratory_id);
    		});
            document.getElementById("defaultOpen").click();
        }
		function payment(ele) {
			debugger;
            var dataRow = $('#myTable').DataTable().row($(ele).closest('tr')).data();
            var url = 'SubPayments.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=';
            url = url.replace('inParam1=', 'inParam1='+dataRow.id);
            url = url.replace('inParam2=', 'inParam2='+dataRow.surname);
            url = url.replace('inParam3=', 'inParam3='+dataRow.name);
            url = url.replace('inParam4=', 'inParam4='+dataRow.school_class);
            url = url.replace('inParam5=', 'inParam5='+dataRow.oratory_location);
            url = url.replace('inParam6=', 'inParam6='+dataRow.person_id);
            window.top.location.href=url;
            
        }
		function openNewSub() {
			window.top.location.href="toNewSub.action?";
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
					<div class="container-fluid login100-form-title">
						<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
						class="bi bi-person-vcard-fill fs-2" viewBox="0 0 18 18">
			 				<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
						</svg>
						<span class="">
							Anagrafiche Persone Iscritte
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
						            <th>Oratorio</th>
						            <th>Person ID</th>
						            <th style="text-align:center;width:100px;">Nuova <button type="button" data-func="dt-add" class="btn btn-success btn-sm dt-add" onclick="openNewSub()">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
  <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
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
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
					class="bi bi-person-vcard-fill fs-2" viewBox="0 0 18 18">
			 			<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z"/>
					</svg>
					<span class="">Modifica Scheda Anagrafica Iscritto</span>
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
				<button type="submit" class="btn btn-success" onclick="save();">Salva</button>
	        </div>
   		</div>
	</div>
</div>


<script type="text/javascript">
	$('#myForm').on('submit', function( event ) {
		debugger;
		
	});
	function save() {
		var url = 'UpdatePersonAndSub.action?inParam1=';
        url = url.replace('inParam1=', 'inParam1='+$('#surname').val());
        url = url.replace('inParam2=', 'inParam2='+$('#name').val());
        url = url.replace('inParam1=', 'inParam1='+$('#sex').val());
        url = url.replace('inParam2=', 'inParam2='+$('#birth_date').val());
        url = url.replace('inParam1=', 'inParam1='+$('#surname').val());
        url = url.replace('inParam2=', 'inParam2='+$('#name').val());
        url = url.replace('inParam1=', 'inParam1='+$('#sex').val());
        url = url.replace('inParam2=', 'inParam2='+$('#birth_date').val());
        url = url.replace('inParam1=', 'inParam1='+$('#surname').val());
        url = url.replace('inParam2=', 'inParam2='+$('#name').val());
        url = url.replace('inParam1=', 'inParam1='+$('#sex').val());
        url = url.replace('inParam2=', 'inParam2='+$('#birth_date').val());
        url = url.replace('inParam1=', 'inParam1='+$('#surname').val());
        url = url.replace('inParam2=', 'inParam2='+$('#name').val());
        url = url.replace('inParam1=', 'inParam1='+$('#sex').val());
        url = url.replace('inParam2=', 'inParam2='+$('#birth_date').val());
        url = url.replace('inParam1=', 'inParam1='+$('#surname').val());
        url = url.replace('inParam2=', 'inParam2='+$('#name').val());
        url = url.replace('inParam1=', 'inParam1='+$('#sex').val());
        url = url.replace('inParam2=', 'inParam2='+$('#birth_date').val());
        url = url.replace('inParam1=', 'inParam1='+$('#surname').val());
        url = url.replace('inParam2=', 'inParam2='+$('#name').val());
        url = url.replace('inParam1=', 'inParam1='+$('#sex').val());
        url = url.replace('inParam2=', 'inParam2='+$('#birth_date').val());
        url = url.replace('inParam1=', 'inParam1='+$('#sex').val());
        url = url.replace('inParam2=', 'inParam2='+$('#birth_date').val());
        var indicatorsMenu = $.ajax({url: url, type: 'POST', cache: false});
		indicatorsMenu.done( function (responseData) {
			var json = JSON.parse(responseData);
			
		});
	}
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