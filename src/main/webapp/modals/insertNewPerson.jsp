<script type="text/javascript">

	function addPhoneToList() {
		var phone = $('#inputPhone').val();
		var num = $('#inputPhoneList').val();
		if (num.length < 255) {
			if (phone.trim() != "") {
				var x = document.getElementById("selectPhone");
				var option = document.createElement("option");
				option.text = phone;
				x.add(option);
				$('#inputPhone').val("");
				createPhoneList();
			}
		} else {
			alert("Non è possibile aggiungere altri numeri di telefono")
		}
	}
	function removePhoneToList() {
		var x = document.getElementById("selectPhone");
		x.remove(x.selectedIndex);
		createPhoneList();
	}
	function createPhoneList() {
		debugger;
		var collection = [];
		var output = "";
		var x = 0;
		$("#selectPhone option").each(function()
		{
			collection[x] = $(this).val();
			x++;
		});
	    for (var i = 0; i < collection.length; i++) {	    	
	    	output += collection[i];
   			if (i < collection.length - 1) {
	     		output += " - ";
      		}
	    }
	    $('#inputPhoneList').val(output);
	}
	function addIceToList() {
		var phone = $('#inputIce').val();
		var num = $('#inputIceList').val();
		if (num.length < 255) {
			if (phone.trim() != "") {
				var x = document.getElementById("selectIce");
				var option = document.createElement("option");
				option.text = phone;
				x.add(option);
				$('#inputIce').val("");
				createIceList();
			}
		} else {
			alert("Non è possibile aggiungere altri numeri Ice")
		}
	}
	function removeIceToList() {
		var x = document.getElementById("selectIce");
		x.remove(x.selectedIndex);
		createIceList();
	}
	function createIceList() {
		debugger;
		var collection = [];
		var output = "";
		var x = 0;
		$("#selectIce option").each(function()
		{
			collection[x] = $(this).val();
			x++;
		});
	    for (var i = 0; i < collection.length; i++) {	    	
	    	output += collection[i];
   			if (i < collection.length - 1) {
	     		output += " - ";
      		}
	    }
	    $('#inputIceList').val(output);
	}
	function addEmailToList() {
		var phone = $('#inputEmail').val();
		var num = $('#inputEmailList').val();
		if (num.length < 255) {
			if (phone.trim() != "") {
				var x = document.getElementById("selectEmail");
				var option = document.createElement("option");
				option.text = phone;
				x.add(option);
				$('#inputEmail').val("");
				createEmailList();
			}
		} else {
			alert("Non è possibile aggiungere altri indirizzi Email")
		}
	}
	function removeEmailToList() {
		var x = document.getElementById("selectEmail");
		x.remove(x.selectedIndex);
		createEmailList();
	}
	function createEmailList() {
		debugger;
		var collection = [];
		var output = "";
		var x = 0;
		$("#selectEmail option").each(function()
		{
			collection[x] = $(this).val();
			x++;
		});
	    for (var i = 0; i < collection.length; i++) {	    	
	    	output += collection[i];
   			if (i < collection.length - 1) {
	     		output += " - ";
      		}
	    }
	    $('#inputEmailList').val(output);
	}

</script>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">

	<div class="item-menu"  style="width: 49%;">
      	<span class="" style="color: grey;">
			<b>Cognome*</b>
		</span>
		<input class="input100" type="text" id="surname" name="inParam1" placeholder="Inserisci" required="required">
	</div>
	
	<div class="item-menu"  style="width: 49%;">
      		<span class="" style="color: grey;">
			<b>Nome*</b>
		</span>
		<input class="input100" type="text" id="name" name="inParam2" placeholder="Inserisci" required="required">
	</div>
	
</div>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">

	<div class="item-menu"  style="width: 33%;">
      		<span class="" style="color: grey;">
			<b>Genere*</b>
		</span>
		<select class="input100" type="text" id="sex" name="inParam3" placeholder="Inserisci" required="required">
			<option value="M">Maschio</option>
			<option value="F">Femmina</option>
		</select>
	</div>
      
    <div class="item-menu"  style="width: 33%;">
      	<span class="" style="color: grey;">
			<b>Data Nascita*</b>
		</span>
		<input class="input100" type="date" id="birth_date" name="inParam4" placeholder="Inserisci" required="required">
	</div>
	
	<div class="item-menu"  style="width: 33%;">
      		<span class="" style="color: grey;">
			<b>Comune Nascita*</b>
		</span>
		<input class="input100" type="text" id="birth_city" name="inParam5" placeholder="Inserisci" required="required">
	</div>
	
</div>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">

	<div class="item-menu"  style="width: 49%;">
      		<span class="" style="color: grey;">
			<b>Codice Fiscale*</b>
		</span>
		<input class="input100" type="text" id="cf" name="inParam6" placeholder="Inserisci" required="required">
	</div>
	
	<div class="item-menu"  style="width: 49%;">
      		<span class="" style="color: grey;">
			<b>Classe*</b>
		</span>
		<select class="input100" type="text" id="school_class" name="inParam7" placeholder="Inserisci" required="required">
			<option value=""></option>
			<option value="1_ELEMENTARE">1^ ELEMENTARE</option>
			<option value="2_ELEMENTARE">2^ ELEMENTARE</option>
			<option value="3_ELEMENTARE">3^ ELEMENTARE</option>
			<option value="4_ELEMENTARE">4^ ELEMENTARE</option>
			<option value="5_ELEMENTARE">5^ ELEMENTARE</option>
			<option value="1_MEDIA">1^ MEDIA</option>
			<option value="2_MEDIA">2^ MEDIA</option>
			<option value="3_MEDIA">3^ MEDIA</option>
			<option value="ANIMATORE">ANIMATORE</option>
			<!-- <option value="GIOVANE">GIOVANE</option> -->
			<!-- <option value="ADULTO">ADULTO</option> -->
		</select>
	</div>
	
</div>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">
      
      	<div class="item-menu"  style="width: 33%;">
      		<span class="" style="color: grey;">
			<b>Indirizzo Residenza*</b>
		</span>
		<input class="input100" type="text" id="residence_address" name="inParam8" placeholder="Inserisci" required="required">
	</div>
	
	<div class="item-menu"  style="width: 33%;">
      		<span class="" style="color: grey;">
			<b>Comune Residenza*</b>
		</span>
		<input class="input100" type="text" id="residence_city" name="inParam9" placeholder="Inserisci" required="required">
	</div>
	
	  
    <div class="item-menu"  style="width: 33%;">
      	<span class="" style="color: grey;">
			<b>Nazionalità</b>
		</span>
		<input class="input100" type="text" id="nationality" name="inParam10" placeholder="Inserisci">
	</div>
	
</div>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">
      
    <div class="item-menu"  style="width: 49%;">
      	<span class="" style="color: grey;">
			<b>Nominativo Padre*</b>
		</span>
		<input class="input100" type="text" id="father" name="inParam11" placeholder="Inserisci" required="required">
	</div>
	
	<div class="item-menu"  style="width: 49%;">
      		<span class="" style="color: grey;">
			<b>Nominativo Madre*</b>
		</span>
		<input class="input100" type="text" id="mother" name="inParam12" placeholder="Inserisci" required="required">
	</div>
	
</div>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">
      
    <div class="item-menu"  style="width: 33%;">
      	<span class="" style="color: grey;">
			<b>Telefono/i*</b>
		</span>
		<div style="display: flex;">
			<input class="input100" type="tel" id="inputPhone" placeholder="User">
			<button type="button" class="btn btn-success btn-sm" style="margin-left: 5px;"
			title="Apri Anagrafica" onclick="addPhoneToList()">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
				class="bi bi-file-earmark-plus fs-6" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
				</svg>
			</button>
		</div>
		<div style="display: flex; margin-top: 5px;">
			<select class="input100" id="selectPhone" placeholder="User">
			</select>
			<button type="button" class="btn btn-danger btn-sm" style="margin-left: 5px;"
			title="Apri Anagrafica" onclick="removePhoneToList()">
         		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
         			<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
				</svg>
         	</button>
		</div>
		<input class="input100" type="hidden" id="inputPhoneList" name="inParam13" required="required">
	</div>
	
	<div class="item-menu"  style="width: 33%;">
      	<span class="" style="color: grey;">
			<b>Numero/i ICE*</b>
		</span>
		<div style="display: flex;">
			<input class="input100" type="tel" id="inputIce" placeholder="User">
			<button type="button" class="btn btn-success btn-sm" style="margin-left: 5px;"
			title="Apri Anagrafica" onclick="addIceToList()">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
				class="bi bi-file-earmark-plus fs-6" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
				</svg>
			</button>
		</div>
		<div style="display: flex; margin-top: 5px;">
			<select class="input100" id="selectIce" placeholder="User">
			</select>
			<button type="button" class="btn btn-danger btn-sm" style="margin-left: 5px;"
			title="Apri Anagrafica" onclick="removeIceToList()">
         				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
         					<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
				</svg>
         			</button>
		</div>
		<input class="input100" type="hidden" id="inputIceList" name="inParam14" required="required">
	</div>
	
	<div class="item-menu"  style="width: 33%;">
      		<span class="" style="color: grey;">
			<b>Indirizzo/i Email*</b>
		</span>
		<div style="display: flex;">
			<input class="input100" type="tel" id="inputEmail" placeholder="User">
			<button type="button" class="btn btn-success btn-sm" style="margin-left: 5px;"
			title="Apri Anagrafica" onclick="addEmailToList()">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
				class="bi bi-file-earmark-plus fs-6" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
				</svg>
			</button>
		</div>
		<div style="display: flex; margin-top: 5px;">
			<select class="input100" id="selectEmail" placeholder="User">
			</select>
			<button type="button" class="btn btn-danger btn-sm" style="margin-left: 5px;"
			title="Apri Anagrafica" onclick="removeEmailToList()">
         				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
         					<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
				</svg>
         			</button>
		</div>
		<input class="input100" type="hidden" id="inputEmailList" name="inParam15" required="required">
	</div>
</div>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">
      
      	<div class="item-menu"  style="width: 24%; margin-top: 5px;">
      		<div class="form-check input100">
		  <input class="form-check-input" type="checkbox" id="privacy">
		  <label class="form-check-label" for="privacy" style="color: grey; margin-left: 0px;">
		    <b>Aut. Privacy*</b>
		  </label>
		  <input class="input100" type="hidden" id="inputPrivacy" value="0" name="inParam16">
		</div>
	</div>
	
	<div class="item-menu"  style="width: 24%; margin-top: 5px;">
      		<div class="form-check input100">
		  <input class="form-check-input" type="checkbox" id="exit" >
		  <label class="form-check-label" for="exit" style="color: grey;">
		    <b>Aut. Uscite*</b>
		  </label>
		  <input class="input100" type="hidden" id="inputExit" value="0" name="inParam17">
		</div>
	</div>
	
	<div class="item-menu"  style="width: 24%; margin-top: 5px;">
      		<div class="form-check input100">
		  <input class="form-check-input" type="checkbox" value="0" id="photo" >
		  <label class="form-check-label" for="photo" style="color: grey;">
		    <b>Aut. Foto*</b>
		  </label>
		  <input class="input100" type="hidden" id="inputPhoto" value="0" name="inParam18">
		</div>
	</div>
	
	<div class="item-menu"  style="width: 24%; margin-top: 5px;">
      		<div class="form-check input100">
		  <input class="form-check-input" type="checkbox" value="0" id="rescue">
		  <label class="form-check-label" for="rescue" style="color: grey;">
		    <b>Aut. Soccorso*</b>
		  </label>
		  <input class="input100" type="hidden" id="inputRescue" value="0" name="inParam19">
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready( function () {
			$("#privacy").on('change', function() {
				debugger;
				if ($(this).is(':checked')) {
			    	$('#inputPrivacy').val('1');
			  	} else {
			    	$('#inputPrivacy').val('0');
			  	}
			});
			$("#exit").on('change', function() {
				debugger;
				if ($(this).is(':checked')) {
					$('#inputExit').val('1');
			  	} else {
			  		$('#inputExit').val('0');
			  	}
			});
			$("#photo").on('change', function() {
				debugger;
				if ($(this).is(':checked')) {
					$('#inputPhoto').val('1');
			  	} else {
			  		$('#inputPhoto').val('0');
			  	}
			});
			$("#rescue").on('change', function() {
				debugger;
				if ($(this).is(':checked')) {
					$('#inputRescue').val('1');
			  	} else {
			  		$('#inputRescue').val('0');
			  	}
			});
		});
	</script>
	
</div>