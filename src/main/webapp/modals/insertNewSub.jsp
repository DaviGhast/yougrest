<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="wrap-div" style="width: 100%; justify-content: space-between;">

		<input type="hidden" id="subIdPerson" name="inParam1">

		<div class="item-menu"  style="width: 48%;">
       		<span class="" style="color: grey;">
				<b>Cognome</b>
			</span>
			<input class="input100" type="text" id="subSurname" readonly="readonly">
		</div>
       				        	
       	<div class="item-menu"  style="width: 48%;">
       		<span class="" style="color: grey;">
				<b>Nome</b>
			</span>
			<input class="input100" type="text" id="subName" readonly="readonly">
		</div>
		
	</div>
	
	<div class="wrap-div" style="width: 100%; justify-content: space-between;">
       
       	<div class="item-menu"  style="width: 48%;">
       		<span class="" style="color: grey;">
				<b>Classe Selezionata</b>
			</span>
			<input class="input100" id="subClass" readonly="readonly">
		</div>
       				        	
       	<div class="item-menu"  style="width: 48%;">
       		<span class="" style="color: grey;">
				<b>Oratorio di Iscrizione*</b>
			</span>
			<select class="input100" id="subOratory" name="inParam2" required="required">
				<option value=""></option>
				<c:forEach var="res" items="${sessionScope.login.listOratories}">
	                <option value="${res.id}">${res.location}</option>
	            </c:forEach>
			</select>
		</div>
		
	</div>
	
	<hr>
	
	<div class="wrap-div" style="width: 100%; justify-content: space-between;">
       
       	<div class="item-menu"  style="width: 48%;">
       		<span class="" style="color: grey;">
				<b>Squadra</b>
			</span>
			<select class="input100" id="squad" name="inParam3">
				<option value=""></option>
				<option>GIALLI</option>
				<option>BLU</option>
				<option>ROSSI</option>
				<option>VERDI</option>
			</select>
		</div>
		
		<div class="item-menu"  style="width: 48%;">
       		<span class="" style="color: grey;">
				<b>Taglia Maglietta*</b>
			</span>
			<select class="input100" type="text" id="tshirt" name="inParam4" placeholder="User" required="required">
				<option value=""></option>
				<option>7-8</option>
				<option>9-10</option>
				<option>11-12</option>
				<option>S</option>
				<option>M</option>
				<option>L</option>
				<option>XL</option>
			</select>
		</div>
		
	</div>
	
	<div class="wrap-div" style="width: 100%; justify-content: space-between;">
       
       	<div class="item-menu"  style="width: 100%;">
       		<span class="" style="color: grey;">
				<b>Note</b>
			</span>
			<textarea class="input100" id="note" name="inParam5" placeholder="Inserisci Note" 
			style="resize: none; height: 75px;" onkeyup="countChar(this)"></textarea>
			<div id="charNum"></div>
		</div>
		
		<script type="text/javascript">
			function countChar(val) {
				var len = val.value.length;
				if (len >= 255) {
					val.value = val.value.substring(0, 255);
				} else {
					$('#charNum').text(255 - len);
				}
			};
		</script>
					
	</div>