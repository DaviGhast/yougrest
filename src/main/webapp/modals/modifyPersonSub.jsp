<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

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
	

</script>

<div class="wrap-div" style="width: 100%;">
      		
      	<div class="item-menu"  style="width: 40%; margin-left: 5%;">
      		<button class="btn tab tablinks" onclick="openCard(event, 'Person')" id="defaultOpen">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" 
			class="bi bi-people-fill fs-4" viewBox="0 0 18 18">
 					<path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
			</svg>
			<span class="fs-6">
				<b>Apri Scheda Anagrafica - ID:</b>
			</span>
			<span id="idPerson" class="fs-6">0</span>
		</button>
	</div>

	<div class="vl me-2" id="separator-1"></div>
	
	<div class="item-menu"  style="width: 40%; margin-right: 5%;">
      		<button class="btn tab tablinks" onclick="openCard(event, 'Sub')">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" 
			class="bi bi-people-fill fs-4" viewBox="0 0 18 18">
 					<path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
			</svg>
			<span class="fs-6">
				<b>Apri Scheda Iscrizione - ID:</b>
			</span>
			<span id="idSub" class="fs-6">0</span>
		</button>
	</div>
	
</div>

<div id="Person" class="tabcontent">

	<jsp:include page="/modals/insertNewPerson.jsp"></jsp:include>
	
</div>

<div id="Sub" class="tabcontent">

	<div class="wrap-div" style="width: 100%; justify-content: space-between;">

		<input type="hidden" id="formIdPerson" name="inParam20">
		<input type="hidden" id="formIdSub" name="inParam21">

		<div class="item-menu"  style="width: 33%;">
       		<span class="" style="color: grey;">
				<b>Oratorio di Iscrizione*</b>
			</span>
			<select class="input100" id="subOratory" name="inParam22" required="required">
				<option value=""></option>
				<c:forEach var="res" items="${sessionScope.login.listOratories}">
	                <option value="${res.id}">${res.location}</option>
	            </c:forEach>
			</select>
		</div>
		
		<div class="item-menu"  style="width: 33%;">
       		<span class="" style="color: grey;">
				<b>Squadra</b>
			</span>
			<select class="input100" id="squad" name="inParam23">
				<option value=""></option>
				<option>GIALLI</option>
				<option>BLU</option>
				<option>ROSSI</option>
				<option>VERDI</option>
			</select>
		</div>
		
		<div class="item-menu"  style="width: 33%;">
       		<span class="" style="color: grey;">
				<b>Taglia Maglietta*</b>
			</span>
			<select class="input100" type="text" id="tshirt" name="inParam24" placeholder="User" required="required">
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
			<textarea class="input100" id="note" name="inParam25" placeholder="Inserisci Note" 
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
	
</div>