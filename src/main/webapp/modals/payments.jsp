<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	
	$(document).ready( function () {
		$("#sub").on('change', function() {
			debugger;
			if ($(this).is(':checked')) {
		    	$('#inputSub').val('1');
		  	} else {
		    	$('#inputSub').val('0');
		  	}
			var price = $('#subPrice').text();
			reloadReceipt('Iscrizione:'+price);
		});
		$("#exoneration").on('change', function() {
			debugger;
			if ($(this).is(':checked')) {
		    	$('#inputExoneration').val('1');
		  	} else {
		    	$('#inputExoneration').val('0');
		  	}
			$('#amount').val('0');
			$('#rest').val('0');
		});
		$("#discount").on('change', function() {
			debugger;
			if ($(this).is(':checked')) {
		    	$('#inputDiscount').val('1');
		    	var slotOfWeeks = Number(${sessionScope.login.selectedGrest.num_weeks})+1;
				for (i = 1; i < slotOfWeeks; i++) {
					var price = $('#weekPrice'+i+'').text();
					var price = Number(price) - 5;
					$('#weekPrice'+i+'').text(price);
				}
		  	} else {
		    	$('#inputDiscount').val('0');
		    	var slotOfWeeks = Number(${sessionScope.login.selectedGrest.num_weeks})+1;
				for (i = 1; i < slotOfWeeks; i++) {
					$('#weekPrice'+i+'').text(${sessionScope.login.selectedGrest.week_price});
				}
		  	}
			
		});
		if ($("#inputExoneration").val() == '1') {
			$('#amount').val('0');
		}
		$('#rest').val('0');
		document.getElementById("defaultOpen").click();
		reloadReceipt('');
	});
	function reloadReceipt(txt) {
		debugger;
		var textReceipt = $('#receiptRaw').val();
		if (txt.trim() != '') {
			if (textReceipt.includes(txt)) {
				textReceipt = textReceipt.replace(txt+';', '');
			} else {
				textReceipt += txt+';';
			}
			$('#receiptRaw').val(textReceipt);
		}
		var amount = 0.0;
		if ($('#amount').val() != ''){
			amount = $('#amount').val();
		}
		var rest = 0.0;
		if ($('#res').val() != ''){
			rest = $('#rest').val();
		}
		var url = 'CreateReceipt.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=&inParam7=';
		url = url.replace('inParam1=', 'inParam1=${result[0].surname} ${result[0].name}');
		url = url.replace('inParam2=', 'inParam2=${sessionScope.login.location}');
		url = url.replace('inParam3=', 'inParam3='+textReceipt);
		url = url.replace('inParam4=', 'inParam4='+amount);
		url = url.replace('inParam5=', 'inParam5='+$('#typePayment').val());
		url = url.replace('inParam6=', 'inParam6='+rest);
		url = url.replace('inParam7=', 'inParam7='+$('#inputExoneration').val());
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
	function openCard(evt, cardName) {
		debugger;
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
		  document.getElementById(cardName).style.display = "block";
		  evt.currentTarget.className += " active";
	}
	function save() {
		if ($('#amount').val() != '') {
			if ($('#type').val() != '') {
				
				$('#textModal').text("Salvataggio Avviato");
				$('#saveModal').modal('show');
				var url = 'UpdateSubPayment.action?inParam1=&inParam2=&inParam3=&inParam4=';
				url = url.replace('inParam1=', 'inParam1=${result[1].id}');
				url = url.replace('inParam2=', 'inParam2='+$('#inputSub').val());
				url = url.replace('inParam3=', 'inParam3='+$('#inputExoneration').val());
				url = url.replace('inParam4=', 'inParam4='+$('#inputDiscount').val());
				var updateSubPayment = $.ajax({url: url, type: 'POST', cache: false});
				updateSubPayment.done( function (responseData) {
					save1(responseData);	
				});
				
			} else {
				alert("Inserire Tipologia del Pagamento prima di Stampare!");
			}
		} else {
			alert("Inserire Importo del Pagamento prima di Stampare!");
		}
		
	}
	function save1(responseData) {
		debugger;
		var json = JSON.parse(responseData);
		if (json.data[0].success == '1') {
			var slots = Number(${sessionScope.login.selectedGrest.num_weeks})+1;
			$('#textModal').text("Salvataggio 1/"+slots+" fatto!!! Aggiornata scheda SubPayment");
			var txt = '${result[6]}';
			var subWeekIds = txt.split('-');
			var txt1 = '${result[7]}';
			var weekIds = txt1.split('-');
			for (i = 0; i < ${result[5]}; i++) {
				var url = 'UpdateWeek.action?inParam1=&inParam2=';
				url = url.replace('inParam1=', 'inParam1='+weekIds[i]);
				url = url.replace('inParam2=', 'inParam2='+$('#tripFreeNum'+Number(i+1)).text());
				var updateWeek = $.ajax({url: url, type: 'POST', cache: false});
				updateWeek.done( function (responseData) {
					var json = JSON.parse(responseData);
					if (json.data[0].success == '1') {
						$('#textModal').text("Salvataggio "+Number(i+2)+"/"+Number(slots+1)+" fatto!!! Aggiornata scheda SubWeek");
					} else {
						alert("Inserire Importo del Pagamento prima di Stampare!");
						$('#textModal').text("Salvataggio "+Number(i+2)+"/"+Number(slots+1)+" non eseguito!!! riprovare");
						
					}
				});
				updateWeek.fail( function() {
					$('#textModal').text("Salvataggio "+Number(i+2)+"/"+Number(slots+1)+" non eseguito!!! riprovare");
					$('#trip'+subWeekIds[i]).prop( "checked", false );
				});
			}
			save2();
		} else {
			$('#textModal').text("Salvataggio 1/"+slots+" non eseguito!!! riprovare");
		}
	}
	function save2() {
		var slots = Number(${sessionScope.login.selectedGrest.num_weeks})+1;
		$('#textModal').text("Salvataggio 1/"+slots+" fatto!!! Aggiornata scheda SubPayment");
		var txt = '${result[6]}';
		var subWeekIds = txt.split('-');
		for (i = 0; i < ${result[5]}; i++) {
			var url = 'UpdateSubWeek.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=&inParam7=&inParam8=&inParam9=';
			url = url.replace('inParam1=', 'inParam1='+subWeekIds[i]);
			url = url.replace('inParam2=', 'inParam2='+$('#inputWeek'+Number(i+1)).val());
			url = url.replace('inParam3=', 'inParam3='+$('#inputPool'+Number(i+1)).val());
			url = url.replace('inParam4=', 'inParam4='+$('#inputTrip'+Number(i+1)).val());
			url = url.replace('inParam5=', 'inParam5='+$('#inputDay1'+Number(i+1)).val());
			url = url.replace('inParam6=', 'inParam6='+$('#inputDay2'+Number(i+1)).val());
			url = url.replace('inParam7=', 'inParam7='+$('#inputDay3'+Number(i+1)).val());
			url = url.replace('inParam8=', 'inParam8='+$('#inputDay4'+Number(i+1)).val());
			url = url.replace('inParam9=', 'inParam9='+$('#inputDay5'+Number(i+1)).val());
			var updateSubPayment = $.ajax({url: url, type: 'POST', cache: false});
			updateSubPayment.done( function (responseData) {
				debugger;
				var json = JSON.parse(responseData);
				if (json.data[0].success == '1') {
					$('#textModal').text("Salvataggio "+Number(i+2)+"/"+Number(slots+1)+" fatto!!! Aggiornata scheda SubWeek");
				} else {
					$('#textModal').text("Salvataggio "+Number(i+2)+"/"+Number(slots+1)+" non eseguito!!! riprovare");
				}
			});
		}
		if ($('#isModify').val() == '0') {
			save3();
		} else {
			if ($('#isModifyId').val() != '') {
				update3();
			} else {
				save3();
			}
		}
		
	}
	function save3() {
		debugger;
		var textHeader = $('#receiptHeader').val();
		var header = textHeader.split('\n');
		var dateTime = header[0].replace('Data e Ora: ', '');
		var data = dateTime.split(" ")[0];
		var time = dateTime.split(" ")[1];
		//$('#dateTime').val(dateTime);
		var payments = $('#receiptRaw').val();
		$('#payments').val(payments);
		
		var url = 'SaveReceipt.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=&inParam7=&inParam8=&inParam9=&inParam10=';
		url = url.replace('inParam1=', 'inParam1='+$('#amount').val());
		url = url.replace('inParam2=', 'inParam2='+$('#typePayment').val());
		url = url.replace('inParam3=', 'inParam3='+$('#total').val());
		url = url.replace('inParam4=', 'inParam4='+$('#rest').val());
		url = url.replace('inParam5=', 'inParam5='+data);
		url = url.replace('inParam6=', 'inParam6='+time);
		url = url.replace('inParam7=', 'inParam7='+$('#payments').val());
		url = url.replace('inParam8=', 'inParam8=${sessionScope.login.location}');
		url = url.replace('inParam9=', 'inParam9=${result[0].oratory_location}');
		url = url.replace('inParam10=', 'inParam10=${result[1].id}');
		var updateSubPayment = $.ajax({url: url, type: 'POST', cache: false});
		updateSubPayment.done( function (responseData) {
			debugger;
			var json = JSON.parse(responseData);
			if (json.data[0].success != '0') {
				$('#isModifyId').val(json.data[0].id);
				$('#textModal').text("Salvataggio Pagamento fatto!!!");
			} else {
				$('#textModal').text("Salvataggio Pagamento non eseguito!!! riprovare");
			}
		});
	}
	function update3() {
		debugger;
		var textHeader = $('#receiptHeader').val();
		var header = textHeader.split('\n');
		var dateTime = header[0].replace('Data e Ora: ', '');
		var data = dateTime.split(" ")[0];
		var time = dateTime.split(" ")[1];
		//$('#dateTime').val(dateTime);
		var payments = $('#receiptRaw').val();
		$('#payments').val(payments);
		
		var url = 'UpdateReceipt.action?inParam1=&inParam2=&inParam3=&inParam4=&inParam5=&inParam6=&inParam7=&inParam8=&inParam9=&inParam10=&inParam11=';
		url = url.replace('inParam1=', 'inParam1='+$('#amount').val());
		url = url.replace('inParam2=', 'inParam2='+$('#typePayment').val());
		url = url.replace('inParam3=', 'inParam3='+$('#total').val());
		url = url.replace('inParam4=', 'inParam4='+$('#rest').val());
		url = url.replace('inParam5=', 'inParam5='+data);
		url = url.replace('inParam6=', 'inParam6='+time);
		url = url.replace('inParam7=', 'inParam7='+$('#payments').val());
		url = url.replace('inParam8=', 'inParam8=${sessionScope.login.location}');
		url = url.replace('inParam9=', 'inParam9=${result[0].oratory_location}');
		url = url.replace('inParam10=', 'inParam10=${result[1].id}');
		url = url.replace('inParam11=', 'inParam11='+$('#isModifyId').val());
		var updateSubPayment = $.ajax({url: url, type: 'POST', cache: false});
		updateSubPayment.done( function (responseData) {
			debugger;
			var json = JSON.parse(responseData);
			if (json.data[0].success != '0') {
				$('#isModifyId').val(json.data[0].id);
				$('#textModal').text("Salvataggio Pagamento fatto!!!");
			} else {
				$('#textModal').text("Salvataggio Pagamento non eseguito!!! riprovare");
			}
		});
	}

</script>

<input id="isModify" type="hidden" readonly="readonly" value="0">
<input id="isModifyId" type="hidden" readonly="readonly" value="">

<div class="container-fluid login100-form-title fs-1">
	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
	class="bi bi-cart4 fs-1" viewBox="0 0 16 16">
		<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
	</svg>
	<span class="">
		Pannello Gestione Pagamenti Iscritto
	</span>
</div>

<div class="wrap-div" style="width: 100%;">
      		
    <div class="item-menu"  style="width: 75%;">
    	<div style="border: 1px solid; padding: 5px; border-radius: 15px; background: #2c3e50; color: white">
	      	<span class="fs-5">
				<b>Informazioni Utili (non modificabili)</b>
			</span>
	      	<div class="wrap-div" style="width: 100%; justify-content: space-between;">
	
				<div class="item-menu"  style="width: 49%;">
			      	<span class="">
						<b>Cognome</b>
					</span>
					<input class="input100" type="text" value="${result[0].surname}" readonly="readonly">
				</div>
				
				<div class="item-menu"  style="width: 49%;">
			      		<span class="">
						<b>Nome</b>
					</span>
					<input class="input100" type="text" value="${result[0].name}" readonly="readonly">
				</div>
			</div>
			
			<div class="wrap-div" style="width: 100%; justify-content: space-between;">
	       
		       	<div class="item-menu"  style="width: 49%;">
		       		<span class="">
						<b>Classe Selezionata</b>
					</span>
					<input class="input100" value="${result[0].school_class}" readonly="readonly">
				</div>
		       				        	
		       	<div class="item-menu"  style="width: 49%;">
		       		<span class="">
						<b>Oratorio di Iscrizione*</b>
					</span>
					<input class="input100" value="${result[0].oratory_location}" readonly="readonly">
				</div>
			
			</div>
		</div>
		
		<hr>
		
		<div class="wrap-div" style="width: 100%; justify-content: space-between;">
		
			<div class="item-menu"  style="width: 24%; margin-top: 5px;">
	      		<div class="form-check input100" style="color: grey;">
		      		<c:if test="${result[1].sub eq '1'}">
						<input class="form-check-input" type="checkbox" id="sub" disabled="disabled" checked="checked">
					</c:if>
				  	<c:if test="${result[1].sub ne '1'}">
						<input class="form-check-input" type="checkbox" id="sub">
					</c:if>
				  <label class="form-check-label" for="sub">
				    <b>Iscrizione:</b>
				  </label>
				  <span class="fs-6" id="subPrice">${sessionScope.login.selectedGrest.sub_price}</span>
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro fs-6" viewBox="0 0 16 16">
				  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
					</svg>
					<c:if test="${result[1].sub eq '1'}">
						<input class="input100" type="hidden" id="inputSub" value="1">
					</c:if>
				  	<c:if test="${result[1].sub ne '1'}">
						<input class="input100" type="hidden" id="inputSub" value="0">
					</c:if>
				</div>
			</div>
			
			<div class="item-menu"  style="width: 24%; margin-top: 5px;">
		      	<div class="form-check input100" style="background: #4f8294; color: white;">
		      		<c:if test="${result[1].exoneration eq '1'}">
						<input class="form-check-input" type="checkbox" id="exoneration" disabled="disabled" checked="checked">
					</c:if>
				  	<c:if test="${result[1].exoneration ne '1'}">
						<input class="form-check-input" type="checkbox" id="exoneration">
					</c:if>
				  <label class="form-check-label" for="exoneration">
				    <b>Esonero Pagamenti</b>
				  </label>
				  	<c:if test="${result[1].exoneration eq '1'}">
						<input class="input100" type="hidden" id="inputExoneration" value="1">
					</c:if>
				  	<c:if test="${result[1].exoneration ne '1'}">
						<input class="input100" type="hidden" id="inputExoneration" value="0">
					</c:if>
				</div>
			</div>
			
			<div class="item-menu"  style="width: 48%; margin-top: 5px;">
		      	<div class="form-check input100" style="background: #ffbf00">
		      		<c:if test="${result[1].discount eq '1'}">
						<input class="form-check-input" type="checkbox" id="discount" disabled="disabled" checked="checked">
					</c:if>
				  	<c:if test="${result[1].discount ne '1'}">
						<input class="form-check-input" type="checkbox" id="discount">
					</c:if>
				  <label class="form-check-label" for="discount" style="color: grey;">
				    <b>Abilita Sconto 5&euro; Famigliari (2&ordm;/3&ordm; figlio)</b>
				  </label>
				  	<c:if test="${result[1].discount eq '1'}">
						<input class="input100" type="hidden" id="inputDiscount" value="1">
					</c:if>
				  	<c:if test="${result[1].discount ne '1'}">
						<input class="input100" type="hidden" id="inputDiscount" value="0">
					</c:if>
				</div>
			</div>
			
		</div>
		
		<hr>
		
		<div class="wrap-div" style="width: 100%;">
			
			<c:forEach var="res" items="${result[2]}">
			
				<c:if test="${res.num eq '1' }">
					<div class="item-menu">
				      	<button class="btn tab tablinks" onclick="openCard(event, '${res.num}')" id="defaultOpen">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" 
							fill="currentColor" class="bi bi-calendar-week fs-4" viewBox="0 0 16 16">
							  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
							  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
							</svg>
							<span class="fs-6">
								<b>Sett. ${res.num}</b>
							</span>
						</button>
					</div>
				</c:if>
				
				<c:if test="${res.num ne '1' }">
					<div class="item-menu">
				      	<button class="btn tab tablinks" onclick="openCard(event, '${res.num}')">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" 
							fill="currentColor" class="bi bi-calendar-week fs-4" viewBox="0 0 16 16">
							  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
							  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
							</svg>
							<span class="fs-6">
								<b>Sett. ${res.num}</b>
							</span>
						</button>
					</div>
				</c:if>
				
            </c:forEach>
			
		</div>
		
		<c:forEach var="res" items="${result[2]}">
		
		<div id="${res.num}" class="tabcontent">
		
			<div class="wrap-div" style="width: 100%;">
	      		
			    <div class="item-menu"  style="width: 55%;">
			    	
					<div class="wrap-div" style="width: 100%; justify-content: space-between;">
				      
					   	<div class="item-menu" style=" width: 100%; margin-top: 5px;">
				      		<div class="form-check input100" style="color: grey;">
				      			<c:if test="${result[4][res.num-1].week eq '1'}">
									<input class="form-check-input" type="checkbox" id="week${res.num}" disabled="disabled" checked="checked">
								</c:if>
							  	<c:if test="${result[4][res.num-1].week ne '1'}">
									<input class="form-check-input" type="checkbox" id="week${res.num}">
								</c:if>
							  <label class="form-check-label" for="week${res.num}">
							    <b>Quota Settimana:</b>
							  </label>
							  <span class="fs-6" id="weekPrice${res.num}">${sessionScope.login.selectedGrest.week_price}</span>
							  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro fs-6" viewBox="0 0 16 16">
							  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
								</svg>
								<c:if test="${result[4][res.num-1].week eq '1'}">
									<input class="input100" type="hidden" id="inputWeek${res.num}" value="1">
								</c:if>
							  	<c:if test="${result[4][res.num-1].week ne '1'}">
									<input class="input100" type="hidden" id="inputWeek${res.num}" value="0">
								</c:if>
							</div>
						</div>
						
					</div>
					
					<div class="wrap-div" style="width: 100%; justify-content: space-between;">
				      
					   	<div class="item-menu"  style="width: 100%; margin-top: 5px;">
					   		
				      		<div class="form-check input100" style="color: grey;">
				      			<c:if test="${result[3].pool_day eq '' or result[3].pool_day eq '0'}">
					   				<input class="form-check-input" type="checkbox" id="pool${res.num}" disabled="disabled">
					   			</c:if>
							  	<c:if test="${result[3].pool_day ne '' and result[3].pool_day ne '0'}">
					   				<c:if test="${result[4][res.num-1].pool eq '1'}">
										<input class="form-check-input" type="checkbox" id="pool${res.num}" disabled="disabled" checked="checked">
									</c:if>
								  	<c:if test="${result[4][res.num-1].pool ne '1'}">
										<input class="form-check-input" type="checkbox" id="pool${res.num}">
									</c:if>
					   			</c:if>
							  <label class="form-check-label" for="pool${res.num}">
							    <b>Piscina:</b>
							  </label>
							  <span class="fs-6" id="poolPrice${res.num}">${sessionScope.login.selectedGrest.pool_price}</span>
							  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro fs-6" viewBox="0 0 16 16">
							  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
								</svg>
								<c:if test="${result[4][res.num-1].pool eq '1'}">
									<input class="input100" type="hidden" id="inputPool${res.num}" value="1">
								</c:if>
							  	<c:if test="${result[4][res.num-1].pool ne '1'}">
									<input class="input100" type="hidden" id="inputPool${res.num}" value="0">
								</c:if>
							</div>
						</div>
						
					</div>
					
					<div class="wrap-div" style="width: 100%; justify-content: space-between;">
						
						<div class="item-menu"  style="width: 100%; margin-top: 5px;">
				      		<div class="form-check input100" style="color: grey;">
				      			<c:if test="${result[4][res.num-1].trip eq '1'}">
									<input class="form-check-input" type="checkbox" id="trip${res.num}" disabled="disabled" checked="checked">
								</c:if>
							  	<c:if test="${result[4][res.num-1].trip ne '1'}">
									<input class="form-check-input" type="checkbox" id="trip${res.num}">
								</c:if>
							  <label class="form-check-label" for="trip${res.num}">
							    <b>Gita:</b>
							  </label>
							  <span class="fs-6" id="tripPrice${res.num}">${res.trip_price}</span>
							  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro fs-6" viewBox="0 0 16 16">
							  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
								</svg>
								<c:if test="${result[4][res.num-1].trip eq '1'}">
									<input class="input100" type="hidden" id="inputTrip${res.num}" value="1">
								</c:if>
							  	<c:if test="${result[4][res.num-1].trip ne '1'}">
									<input class="input100" type="hidden" id="inputTrip${res.num}" value="0">		  
								</c:if>
							  <input class="input100" type="hidden" id="tripTotalNum${res.num}" value="${res.trip_num}">
							  <span class="fs-6" id="tripNum${res.num}">- Posti rimanenti:</span>
							  <span class="fs-6" id="tripFreeNum${res.num}">${res.free_num}</span>
							  <button type="button" class="btn-link" id="tripRefreshNum${res.num}">Aggiorna</button>
							</div>
						</div>
						
					</div>
					
					<div class="wrap-div" style="width: 100%; justify-content: space-between;">
						
						<div class="item-menu"  style="width: 100%; margin-top: 5px;">
				      		<div class="alert alert-warning" role="alert">
								<p>N.B. Se non esiste il "Giorno Piscina",la scelta piscina sarà disabilitata</p>
								<p>N.B. il giorno stabilito per la gità non avrà il pranzo selezionabile</p>
							</div>
						</div>
						
					</div>
						
					<script type="text/javascript">
						$(document).ready( function () {
							$("#week${res.num}").on('change', function() {
								debugger;
								if ($(this).is(':checked')) {
							    	$('#inputWeek${res.num}').val('1');
							  	} else {
							    	$('#inputWeek${res.num}').val('0');
							  	}
								var price = $('#weekPrice${res.num}').text();
								reloadReceipt('Quota Settimana ${res.num}:'+price);
							});
							$("#pool${res.num}").on('change', function() {
								debugger;
								if ($(this).is(':checked')) {
							    	$('#inputPool${res.num}').val('1');
							  	} else {
							    	$('#inputPool${res.num}').val('0');
							  	}
								var price = $('#poolPrice${res.num}').text();
								reloadReceipt('Piscina Settimana ${res.num}:'+price);
							});
							$("#trip${res.num}").on('change', function() {
								debugger;
								if ($(this).is(':checked')) {
							    	$('#inputTrip${res.num}').val('1');
							    	var freeByWeek = 0;
							    	var freeByCache = 0;
									var url = 'GetWeekById.action?inParam1=';
									url = url.replace('inParam1=', 'inParam1=${res.id}');
									var getWeekById = $.ajax({url: url, type: 'POST', cache: false});
									getWeekById.done( function (responseData) {
										debugger;
										var json = JSON.parse(responseData);
										freeByWeek = json.data[0].free_num;
										var url = 'GetCacheWeekById.action?inParam1=';
										url = url.replace('inParam1=', 'inParam1=${res.id}');
										var getCacheWeekById = $.ajax({url: url, type: 'POST', cache: false});
										getCacheWeekById.done( function (responseData1) {
											debugger;
											var json1 = JSON.parse(responseData1);
											freeByCache = json1.data[0].free_num;
											if (Number(freeByCache) < Number(freeByWeek)) {
												$('#tripFreeNum${res.num}').text(freeByCache);
											} else {
												$('#tripFreeNum${res.num}').text(freeByWeek);
											}
									    	var free = Number($('#tripFreeNum${res.num}').text());
									    	var new_free = free - 1;
									    	var url = 'UpdateBus.action?inParam1=&inParam2=';
											url = url.replace('inParam1=', 'inParam1=${res.id}');
											url = url.replace('inParam2=', 'inParam2='+new_free);
											var updateBus = $.ajax({url: url, type: 'POST', cache: false});
											updateBus.done( function (responseData) {
												$('#tripFreeNum${res.num}').text(new_free);
											});
										});
									});
							  	} else {
							    	$('#inputTrip${res.num}').val('0');
							    	var freeByWeek = 0;
							    	var freeByCache = 0;
									var url = 'GetWeekById.action?inParam1=';
									url = url.replace('inParam1=', 'inParam1=${res.id}');
									var getWeekById = $.ajax({url: url, type: 'POST', cache: false});
									getWeekById.done( function (responseData) {
										var json = JSON.parse(responseData);
										freeByWeek = json.data[0].free_num;
										var url = 'GetCacheWeekById.action?inParam1=';
										url = url.replace('inParam1=', 'inParam1=${res.id}');
										var getWeekById = $.ajax({url: url, type: 'POST', cache: false});
										getWeekById.done( function (responseData) {
											var json = JSON.parse(responseData);
											freeByCache = json.data[0].free_num;
											if (Number(freeByCache) < Number(freeByWeek)) {
												$('#tripFreeNum${res.num}').text(freeByCache);
											} else {
												$('#tripFreeNum${res.num}').text(freeByWeek);
											}
									    	var free = Number($('#tripFreeNum${res.num}').text());
									    	var new_free = free + 1;
									    	var url = 'UpdateBus.action?inParam1=&inParam2=';
											url = url.replace('inParam1=', 'inParam1=${res.id}');
											url = url.replace('inParam2=', 'inParam2='+new_free);
											var updateBus = $.ajax({url: url, type: 'POST', cache: false});
											updateBus.done( function (responseData) {
												$('#tripFreeNum${res.num}').text(new_free);
											});
										});
									});
							  	}
								var price = $('#tripPrice${res.num}').text();
								reloadReceipt('Gita Settimana ${res.num}:'+price);
							});
							$("#tripRefreshNum${res.num}").on('click', function() {
								var freeByWeek = 0;
								var url = 'GetWeekById.action?inParam1=';
								url = url.replace('inParam1=', 'inParam1=${res.id}');
								var getWeekById = $.ajax({url: url, type: 'POST', cache: false});
								getWeekById.done( function (responseData) {
									var json = JSON.parse(responseData);
									freeByWeek = json.data[0].free_num;
									var freeByCache = 0;
									var url = 'GetCacheWeekById.action?inParam1=';
									url = url.replace('inParam1=', 'inParam1=${res.id}');
									var getWeekById = $.ajax({url: url, type: 'POST', cache: false});
									getWeekById.done( function (responseData) {
										var json = JSON.parse(responseData);
										freeByCache = json.data[0].free_num;
										if (Number(freeByCache) < Number(freeByWeek)) {
											$('#tripFreeNum${res.num}').text(freeByCache);
										} else {
											$('#tripFreeNum${res.num}').text(freeByWeek);
										}
									});
								});
							});
						});
					</script>
						
				</div>
			
				<div class="item-menu"  style="width: 40%;">
			      	
			      	<div class="wrap-div" style="width: 100%; justify-content: space-between;">
			      	
			      		<div class="input100" style="color: grey; margin-top: 5px; height: 100%">
					      	<div class="form-check" style="color: grey;">
							  <span class="fs-5">
								<b>Pranzo:</b>
								</span>
							  <span class="fs-6" id="lunchPrice${res.num}">${sessionScope.login.selectedGrest.lunch_price}</span>
							  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro fs-6" viewBox="0 0 16 16">
							  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
								</svg>
							  </div>
							  
							<div class="form-check" style="color: red;">
							  <input class="form-check-input" type="checkbox" id="allLunch${res.num}">
							  <label class="form-check-label" for="allLunch${res.num}">
							    <b>Tutti Giorni</b>
							  </label>
							</div>
							
							<div class="form-check">
								<c:if test="${result[3].trip_day eq '1'}">
									<input class="form-check-input" type="checkbox" id="day1${res.num}" disabled="disabled">
								</c:if>
							  	<c:if test="${result[3].trip_day ne '1'}">
							  		<c:if test="${result[4][res.num-1].day1 eq '1'}">
										<input class="form-check-input" type="checkbox" id="day1${res.num}" disabled="disabled" checked="checked">
									</c:if>
								  	<c:if test="${result[4][res.num-1].day1 ne '1'}">
										<input class="form-check-input" type="checkbox" id="day1${res.num}">
									</c:if>
								</c:if>
							  <label class="form-check-label" for="day1${res.num}">
							    <b>Lunedi</b>
							  </label>
							  	<c:if test="${result[4][res.num-1].day1 eq '1'}">
									<input class="input100" type="hidden" id="inputDay1${res.num}" value="1" name="inParam16">
								</c:if>
							  	<c:if test="${result[4][res.num-1].day1 ne '1'}">
									<input class="input100" type="hidden" id="inputDay1${res.num}" value="0" name="inParam16">
								</c:if>
							</div>
							
							<div class="form-check">
							  	<c:if test="${result[3].trip_day eq '2'}">
									<input class="form-check-input" type="checkbox" id="day2${res.num}" disabled="disabled">
								</c:if>
							  	<c:if test="${result[3].trip_day ne '2'}">
									<c:if test="${result[4][res.num-1].day2 eq '1'}">
										<input class="form-check-input" type="checkbox" id="day2${res.num}" disabled="disabled" checked="checked">
									</c:if>
								  	<c:if test="${result[4][res.num-1].day2 ne '1'}">
										<input class="form-check-input" type="checkbox" id="day2${res.num}">
									</c:if>
								</c:if>
							  <label class="form-check-label" for="day2${res.num}">
							    <b>Martedi</b>
							  </label>
							  <c:if test="${result[4][res.num-1].day2 eq '1'}">
									<input class="input100" type="hidden" id="inputDay2${res.num}" value="1" name="inParam16">
								</c:if>
							  	<c:if test="${result[4][res.num-1].day2 ne '1'}">
									<input class="input100" type="hidden" id="inputDay2${res.num}" value="0" name="inParam16">
								</c:if>
							</div>
							
							<div class="form-check">
								<c:if test="${result[3].trip_day eq '3'}">
									<input class="form-check-input" type="checkbox" id="day3${res.num}" disabled="disabled">
								</c:if>
							  	<c:if test="${result[3].trip_day ne '3'}">
									<c:if test="${result[4][res.num-1].day2 eq '1'}">
										<input class="form-check-input" type="checkbox" id="day3${res.num}" disabled="disabled" checked="checked">
									</c:if>
								  	<c:if test="${result[4][res.num-1].day2 ne '1'}">
										<input class="form-check-input" type="checkbox" id="day3${res.num}">
									</c:if>
								</c:if>
							  <label class="form-check-label" for="day3${res.num}">
							    <b>Mercoledi</b>
							  </label>
							  <input class="input100" type="hidden" id="inputDay3${res.num}" value="0" name="inParam16">
							</div>
							
							<div class="form-check">
							  <c:if test="${result[3].trip_day eq '4'}">
									<input class="form-check-input" type="checkbox" id="day4${res.num}" disabled="disabled">
								</c:if>
							  	<c:if test="${result[3].trip_day ne '4'}">
									<c:if test="${result[4][res.num-1].day2 eq '1'}">
										<input class="form-check-input" type="checkbox" id="day4${res.num}" disabled="disabled" checked="checked">
									</c:if>
								  	<c:if test="${result[4][res.num-1].day2 ne '1'}">
										<input class="form-check-input" type="checkbox" id="day4${res.num}">
									</c:if>
								</c:if>
							  <label class="form-check-label" for="day4${res.num}">
							    <b>Giovedi</b>
							  </label>
							  <input class="input100" type="hidden" id="inputDay4${res.num}" value="0" name="inParam16">
							</div>
							
							<div class="form-check">
							  <c:if test="${result[3].trip_day eq '5'}">
									<input class="form-check-input" type="checkbox" id="day5${res.num}" disabled="disabled">
								</c:if>
							  	<c:if test="${result[3].trip_day ne '5'}">
									<c:if test="${result[4][res.num-1].day2 eq '1'}">
										<input class="form-check-input" type="checkbox" id="day5${res.num}" disabled="disabled" checked="checked">
									</c:if>
								  	<c:if test="${result[4][res.num-1].day2 ne '1'}">
										<input class="form-check-input" type="checkbox" id="day5${res.num}">
									</c:if>
								</c:if>
							  <label class="form-check-label" for="day5${res.num}">
							    <b>Venerdi</b>
							  </label>
							  <input class="input100" type="hidden" id="inputDay5${res.num}" value="0" name="inParam16">
							</div>
							
						</div>
						
						<script type="text/javascript">
							$(document).ready( function () {
								$("#allLunch${res.num}").on('change', function() {
									debugger;
									if ($(this).is(':checked')) {
										for (var i = 1; i < 6; i++) {
											if (!$("#day"+i+"${res.num}").is(':disabled')) {
												$("#day"+i+"${res.num}").click();
											}
										}
								    	$('#inputWeek${res.num}').val('1');
								  	} else {
								  		for (var i = 1; i < 6; i++) {
											if (!$("#day"+i+"${res.num}").is(':disabled')) {
												$("#day"+i+"${res.num}").click();
											}
										}
								    	$('#inputWeek${res.num}').val('0');
								  	}
								});
								$("#day1${res.num}").on('change', function() {
									debugger;
									if ($(this).is(':checked')) {
								    	$('#inputDay1${res.num}').val('1');
								  	} else {
								    	$('#inputDay1${res.num}').val('0');
								  	}
									var price = $('#lunchPrice${res.num}').text();
									reloadReceipt('Pranzo Lun Settimana ${res.num}:'+price);
								});
								$("#day2${res.num}").on('change', function() {
									debugger;
									if ($(this).is(':checked')) {
								    	$('#inputDay2${res.num}').val('1');
								  	} else {
								    	$('#inputDay2${res.num}').val('0');
								  	}
									var price = $('#lunchPrice${res.num}').text();
									reloadReceipt('Pranzo Mar Settimana ${res.num}:'+price);
								});
								$("#day3${res.num}").on('change', function() {
									debugger;
									if ($(this).is(':checked')) {
								    	$('#inputDay3${res.num}').val('1');
								  	} else {
								    	$('#inputDay3${res.num}').val('0');
								  	}
									var price = $('#lunchPrice${res.num}').text();
									reloadReceipt('Pranzo Mer Settimana ${res.num}:'+price);
								});
								$("#day4${res.num}").on('change', function() {
									debugger;
									if ($(this).is(':checked')) {
								    	$('#inputDay4${res.num}').val('1');
								  	} else {
								    	$('#inputDay4${res.num}').val('0');
								  	}
									var price = $('#lunchPrice${res.num}').text();
									reloadReceipt('Pranzo Gio Settimana ${res.num}:'+price);
								});
								$("#day5${res.num}").on('change', function() {
									debugger;
									if ($(this).is(':checked')) {
								    	$('#inputDay5${res.num}').val('1');
								  	} else {
								    	$('#inputDay5${res.num}').val('0');
								  	}
									var price = $('#lunchPrice${res.num}').text();
									reloadReceipt('Pranzo Ven Settimana ${res.num}:'+price);
								});
							});
						</script>
								
					</div>
			      	
				</div>
				
			</div>
		</div>
		
		</c:forEach>
		
		<hr>
		
		
		
		<div class="wrap-div" style="width: 100%; justify-content: space-between;">
	
			<div class="item-menu alert alert-success" style="width: 49%; border: 1px solid; padding: 5px; border-radius: 15px;">
		      	<span class="fs-5">
					<b>Inserire Pagamento</b>
				</span>
				
		      	<div class="wrap-div" style="width: 100%; justify-content: space-between;">
		
					<div class="item-menu"  style="width: 49%;">
				      	<span class="">
							<b>Importo</b>
						</span>
						<input class="input100" type="text" id="amount" placeholder="Inserisci Importo in Euro" name="inParam1" required="required">
					</div>
					
					<div class="item-menu"  style="width: 49%;">
				      		<span class="">
							<b>Tipologia</b>
						</span>
						<select class="input100" id="typePayment" name=inParam2 required="required">
							<option value="CONT">Contanti</option>
							<option value="POS">Pos</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="item-menu alert alert-info" style="width: 49%; border: 1px solid; padding: 5px; border-radius: 15px;">
		      	<span class="fs-5">
					<b>Risultato Pagamento</b>
				</span>
				
				<div class="wrap-div" style="width: 100%; justify-content: space-between;">
		       
			       	<div class="item-menu"  style="width: 49%;">
			       		<span class="">
							<b>Totale</b>
						</span>
						<input class="input100" id="total" name="inParam3" value="0.0" readonly="readonly">
					</div>
			       				        	
			       	<div class="item-menu"  style="width: 49%;">
			       		<span class="">
							<b>Resto</b>
						</span>
						<input class="input100" id="rest" name="inParam4" readonly="readonly">
					</div>
					
					<input type="hidden" id="user" name="inParam5" value="${result[1].id}" readonly="readonly">
					<input type="hidden" id="dateTime" name="inParam6" readonly="readonly">
					<input type="hidden" id="payments" name="inParam7" readonly="readonly">
				
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready( function () {
				$("#amount").on('change', function() {
					debugger;
					calcRest();
					reloadReceipt('');
				});
				$("#typePayment").change(function() {
					debugger;
					reloadReceipt('');
				});
			});
			function calcRest() {
				debugger;
				var total = $('#total').val();
				var amount = $('#amount').val();
				if (amount == '') {
					amount = 0.0;
				}
				var rest = 0.0;
				if (Number(amount) < Number(total)) {
					alert("Inserito importo troppo basso");
				} else {
					rest = amount - total;
				}
				$('#rest').val(rest);
			}
		</script>
		
		<div style="width: 100%;">
		
			<!-- <button type="button" class="btn btn-secondary" onclick="location.reload();">Annulla</button> -->
			<button type="submit" class="btn btn-success" onclick="save()">Salva</button>
			
		</div>
			
	</div>

	<div class="vl me-2" id="separator-1"></div>
	
	<div class="item-menu"  style="width: 20%;">
      	
      	<div class="wrap-div" style="width: 100%; min-height: 100%; justify-content: space-between;">
       
	       	<div class="item-menu"  style="width: 100%;">
	       		<span class="" style="color: grey;">
					<b>Anteprima Scontrino</b>
				</span>
				<div class="input100 overflow-auto" style="width: 100%; min-height: 90%;"
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
				<div style="width: 100%; margin-top: 2%;">
			
					<button type="button" class="btn btn-primary"onclick="print()">
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
	
</div>