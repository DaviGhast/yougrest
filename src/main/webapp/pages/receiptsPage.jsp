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
	<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.4.1/css/responsive.dataTables.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/util.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/onepcssgrid.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="https://printjs-4de6.kxcdn.com/print.min.css">
	
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
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/bootstrap/js/popper.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<%=request.getContextPath()%>/vendor/tilt/tilt.jquery.min.js"></script>
<!--===============================================================================================-->
	<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
	<script src="https://cdn.datatables.net/responsive/2.4.1/js/dataTables.responsive.min.js"></script>
<!--===============================================================================================-->
	<script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
	
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
		            url: 'ReceiptListByGrest.action',
		            method: "POST",
		            contentType: 'application/json'
		        },
		        columns: [
		        	{ data: 'id' },
		            { data: 'amount' },
		            { data: 'type' },
		            { data: 'total' },
		            { data: 'rest' },
		            { data: 'date' },
		            { data: 'time' },
		            { data: 'payments' },
		            { data: 'sub_oratory_location' },
		            { data: 'payment_oratory_location' },
		            { data: 'sub_payment_id' },
		            { data: 'surname' },
		            { data: 'name' },
		            { data: 'exoneration' }
		        ],
		        columnDefs: [
		        	{
		        		targets: 7,
		        		visible: false
		        	},
		        	{
		        		targets: 8,
		        		visible: false
		        	},
		        	{
		        		targets: 10,
		        		visible: false
		        	},
		        	{
		        		targets: 12,
		        		visible: false
		        	},
		        	{
		        		targets: 13,
		        		visible: false
		        	},
		        	{
		        		targets: 14,
		        		orderable: false,
		            	data: null,
		            	defaultContent: '<button type="button" '+
		            	'class="btn btn-info btn-sm dt-view" style="margin-right:16px;" '+
		            	'title="Apri Anagrafica" onclick="getDetails(this)">'+
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
		function getDetails(ele) {
            var dataRow = $('#myTable').DataTable().row($(ele).closest('tr')).data();
            $('#receiptModal').modal('show');
            $('#receiptRaw').val(dataRow.payments);
            reloadReceipt(dataRow.surname, dataRow.name, dataRow.payment_oratory_location,  
            		dataRow.amount, dataRow.type, dataRow.rest, dataRow.exoneration);
        }
		function reloadReceipt(surname, name, location, amount, type, rest, exoneration) {
			debugger;
			var textReceipt = $('#receiptRaw').val();
						
			var url = 'CreateReceipt.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=&inParam7=';
			url = url.replace('inParam1=', 'inParam1='+surname+' '+name);
			url = url.replace('inParam2=', 'inParam2='+location);
			url = url.replace('inParam3=', 'inParam3='+textReceipt);
			url = url.replace('inParam4=', 'inParam4='+amount);
			url = url.replace('inParam5=', 'inParam5='+type);
			url = url.replace('inParam6=', 'inParam6='+rest);
			url = url.replace('inParam7=', 'inParam7='+exoneration);
			var createReceipt = $.ajax({url: url, type: 'POST', cache: false});
			createReceipt.done( function (responseData) {
				debugger;
				var json = JSON.parse(responseData);
				$('#receiptHeader').val(json.data.header);
				var header = $('#receiptHeader').val();
				
				$('#receiptBody').val(json.data.body);
				var body = $('#receiptBody').val();
				
				$('#receiptFooter').val(json.data.footer);
				var footer = $('#receiptFooter').val();
							
				$('#receipt').attr('rows',json.data.rows);
				$('#receipt').val(header+body+footer);
				
				$('#total').val(json.data.total);
				
			});
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
			
				<div class="wrap-login100" style="border: 1px solid; width: auto;">
					<div class="container-fluid login100-form-title">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
						class="bi bi-wallet-fill fs-2" viewBox="0 0 16 16">
						  <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v2h6a.5.5 0 0 1 .5.5c0 .253.08.644.306.958.207.288.557.542 1.194.542.637 0 .987-.254 1.194-.542.226-.314.306-.705.306-.958a.5.5 0 0 1 .5-.5h6v-2A1.5 1.5 0 0 0 14.5 2h-13z"/>
						  <path d="M16 6.5h-5.551a2.678 2.678 0 0 1-.443 1.042C9.613 8.088 8.963 8.5 8 8.5c-.963 0-1.613-.412-2.006-.958A2.679 2.679 0 0 1 5.551 6.5H0v6A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-6z"/>
						</svg>
						<span class="">
							Anagrafiche Persone Iscritte
						</span>
					</div>
					<div class="table-responsive" style="width:100%">
						<table id="myTable" class="display nowrap">
						    <thead>
						        <tr>
						            <th>ID</th>
						            <th>Importo</th>
						            <th>Tipo</th>
						            <th>Totale</th>
						            <th>Resto</th>
						            <th>Data</th>
						            <th>Ora</th>
						            <th>Pagamenti</th>
						            <th>Frequenta</th>
						            <th>Pagamento</th>
						            <th>ID Iscrizione Pagamento</th>
						            <th>Cognome</th>
						            <th>Nome</th>
						            <th>Esonerato</th>
						            <th style="text-align:center;width:100px;">Azioni</th>
						        </tr>
						    </thead>
						</table>
					</div>
				</div>
			</div>
					
		</div>
		
	</div>
	
<!-- Modify Modal -->
<div class="modal fade" id="receiptModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<div class="fs-4">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
					class="bi bi-wallet-fill fs-2" viewBox="0 0 16 16">
					  <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v2h6a.5.5 0 0 1 .5.5c0 .253.08.644.306.958.207.288.557.542 1.194.542.637 0 .987-.254 1.194-.542.226-.314.306-.705.306-.958a.5.5 0 0 1 .5-.5h6v-2A1.5 1.5 0 0 0 14.5 2h-13z"/>
					  <path d="M16 6.5h-5.551a2.678 2.678 0 0 1-.443 1.042C9.613 8.088 8.963 8.5 8 8.5c-.963 0-1.613-.412-2.006-.958A2.679 2.679 0 0 1 5.551 6.5H0v6A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-6z"/>
					</svg>
					<span class="">Anteprima Scontrino</span>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="background-color: #ecf0f1">
				
			<div class="wrap-div" style="width: 100%; min-height: 100%; height: 100%; justify-content: space-between;">
       
	       	<div class="item-menu"  style="width: 100%; height: 100%;">
	       		<div class="input100 overflow-auto" style="width: 100%; min-height: 90%; height: 100%;"
				data-mdb-perfect-scrollbar='true'>
					<div id="receiptFull" style="width: 100%; min-height: 90%;">
						<img src="images/logo-receipt.png" height="100" width="auto" alt="IMG">
						<textarea class="" id="receiptHeader"
							style="resize: none; width: 100%; text-align: center;  display: none;" readonly="readonly"></textarea>
						<textarea class="" id="receiptBody" placeholder="Elaborazione in corso ..." 
							style="resize: none; width: 100%; text-align: center; display: none;" readonly="readonly"></textarea>
						<textarea class="" id="receiptFooter" placeholder="Elaborazione in corso ..." 
							style="resize: none; width: 100%; text-align: center; display: none;" readonly="readonly"></textarea>
						<textarea class="" id="receiptRaw" placeholder="Elaborazione in corso ..." 
							style="resize: none; width: 100%; text-align: center; display: none;" readonly="readonly"></textarea>
						<textarea class="" id="receipt" placeholder="Elaborazione in corso ..."
							style="resize: none; width: 100%; text-align: center; overflow: hidden;" readonly="readonly"></textarea>
					</div>
				</div>
			</div>
								
		</div>
							
			</div>
	      	<div class="modal-footer" style="background-color: #ffffff">
	      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
	      		<button type="button" class="btn btn-primary" onclick="print()">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer-fill" viewBox="0 0 16 16">
					  <path d="M5 1a2 2 0 0 0-2 2v1h10V3a2 2 0 0 0-2-2H5zm6 8H5a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1z"/>
					  <path d="M0 7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-1v-2a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v2H2a2 2 0 0 1-2-2V7zm2.5 1a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z"/>
					</svg>
					Stampa Scontrino
				</button>
					
					<script type="text/javascript">
						function print() {
							if ($('#amount').val() != '') {
								if ($('#type').val() != '') {
									printJS({ printable: 'receiptFull', type: 'html', style: '@media print { @page { margin: 0; size: 4in 6in;} body { margin-left: 0cm;} }' });
								} else {
									alert("Inserire Tipologia del Pagamento prima di Stampare!")
								}
							} else {
								alert("Inserire Importo del Pagamento prima di Stampare!")
							}
						}
					</script>
	        </div>
   		</div>
	</div>
</div>


</body>
</html>