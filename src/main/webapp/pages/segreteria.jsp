<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.vl {
		margin-top: 2px;
		margin-bottom: 2px;
  		border-left: 5px solid grey;
  		border-radius: 10px;
	}
	
	.item-menu {
		text-align: center;
		width: 20%;
	}
	
	.menu-action {
		border: 1px solid;
		width: 100%;
		margin-left: 5%;
		margin-right: 5%;
		padding: 33px 20px 33px 20px;
	}
	
	.bi {
		margin-bottom: 1%;
	}
	
	.bi-title {
		margin-bottom: 0;
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
	}
	
</style>

<script>
	$(document).ready( function () {
		var url = 'IndicatorsMenu.action?inParam1=';
		url = url.replace('inParam1=', 'inParam1=${sessionScope.login.selectedGrest.id}');
		var indicatorsMenu = $.ajax({url: url, type: 'POST', cache: false});
		indicatorsMenu.done( function (responseData) {
			var json = JSON.parse(responseData);
			$('#numSub').text(json.data[0].num);
			$('#numReceipt').text(json.data[1].num);
		});
	});
</script>

<script type="text/javascript">
	function openSubsPage() {
		window.top.location.href="toSubsPage.action?";
	}
	function openReportsPage() {
		window.top.location.href="ReportsPage.action?";
	}
	function openReceiptsPage() {
		window.top.location.href="toReceiptsPage.action?";
	}
	function openRegistersPage() {
		window.top.location.href="RegistersPage.action?";
	}
</script>

<div class="wrap-login100" style="border: 1px solid;" >
	<div class="container-fluid login100-form-title">
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" 
		class="bi bi-title bi-person-vcard-fill fs-2" viewBox="0 0 18 18">
			<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
		</svg>
		<span class="">
			Info Oratorio Estivo
		</span>
	</div>
	
	<div class="login100-pic js-tilt" data-tilt>
		<c:if test="${not empty result[0]}">
			<img src="images/logo-grest-${result[0].year}.png" alt="IMG">
		</c:if>
	</div>
	
	<div class="login100-form validate-form" style="text-align: center;">
        <c:if test="${not empty result[0]}">
        	<!-- <table class="table">
        		<thead>
        			<tr>
        				<th scope="col">Info</th>
        				<th scope="col">Valore</th>
        			</tr>
        		</thead>
        		<tbody>
        			<tr>
        				<td>Nome Utente</td>
        				<td>${sessionScope.login.username}</td>
        			</tr>
        		</tbody>
        	</table> -->
			<p class="profile fs-6">
				<b>Nome:</b> ${result[0].name}
			</p>
			<p class="profile">
				<b>Anno:</b> ${result[0].year}
			</p>
			<p class="profile">
				<b>Numero Settimane:</b> ${result[0].num_weeks}
			</p>
			<p class="profile">
				<b>Data di Inizio:</b> ${result[0].start_date}
			</p>
			<p class="profile">
				<b>Prezzo Iscrizione:</b> ${result[0].sub_price}
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro" viewBox="0 0 16 16">
				  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
				</svg>
			</p>
			<p class="profile">
				<b>Prezzo Settimane:</b> ${result[0].week_price}
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro" viewBox="0 0 16 16">
				  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
				</svg>
			</p>
			<p class="profile">
				<b>Prezzo Pranzi:</b> ${result[0].lunch_price}
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro" viewBox="0 0 16 16">
				  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
				</svg>
			</p>
			<p class="profile">
				<b>Prezzo Piscina:</b> ${result[0].pool_price}
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-euro" viewBox="0 0 16 16">
				  <path d="M4 9.42h1.063C5.4 12.323 7.317 14 10.34 14c.622 0 1.167-.068 1.659-.185v-1.3c-.484.119-1.045.17-1.659.17-2.1 0-3.455-1.198-3.775-3.264h4.017v-.928H6.497v-.936c0-.11 0-.219.008-.329h4.078v-.927H6.618c.388-1.898 1.719-2.985 3.723-2.985.614 0 1.175.05 1.659.177V2.194A6.617 6.617 0 0 0 10.341 2c-2.928 0-4.82 1.569-5.244 4.3H4v.928h1.01v1.265H4v.928z"/>
				</svg>
			</p>
			<c:if test="${not empty result[1]}">
		    	<c:forEach var="res" items="${result[1]}">
		    		<p class="profile">
						<b>Giorno della Piscina ${res.oratory_location}:</b> ${res.pool_day}
					</p>
					<p class="profile">
						<b>Giorno della Gita ${res.oratory_location}:</b> ${res.trip_day}
					</p>
		        </c:forEach>
		    </c:if>
			
		</c:if>
      </div>
	
</div>


<div class="wrap-login100 menu-action" >

	<div class="item-menu">
		<div class="container-fluid">
			<span class="fs-3" style="color: grey;">
				<b>Iscrizioni</b>
			</span>
		</div>
		<div class="container-fluid">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" 
			class="bi bi-people-fill fs-2" viewBox="0 0 18 18">
 					<path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z"/>
			</svg>
			<span id="numSub" class="fs-4">
				<b>0</b>
			</span>
		</div>
		<div class="container-fluid">
			<button class="btn btn-secondary" type="button" onclick="openSubsPage();">
				Apri
			</button>
		</div>
	</div>
	
	<div class="vl me-2" id="separator-1"></div>
	
	<div class="item-menu">
		<div class="container-fluid">
			<span class="fs-3" style="color: grey;">
				<b>Scontrini</b>
			</span>
		</div>
		<div class="container-fluid">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
			class="bi bi-cash-coin fs-2" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"/>
			  <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"/>
			  <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"/>
			  <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"/>
			</svg>
			<span id="numReceipt" class="fs-4">
				<b>0</b>
			</span>
		</div>
		<div class="container-fluid">
			<button class="btn btn-secondary" type="button" onclick="openReceiptsPage();">
				Apri
			</button>
		</div>
	</div>
	
	<div class="vl me-2" id="separator-2"></div>
	
	<div class="item-menu">
		<span class="fs-3" style="color: grey;">
			<b>Resoconti</b>
		</span>
		<div class="container-fluid">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
			class="bi bi-wallet-fill fs-2" viewBox="0 0 16 16">
			  <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v2h6a.5.5 0 0 1 .5.5c0 .253.08.644.306.958.207.288.557.542 1.194.542.637 0 .987-.254 1.194-.542.226-.314.306-.705.306-.958a.5.5 0 0 1 .5-.5h6v-2A1.5 1.5 0 0 0 14.5 2h-13z"/>
			  <path d="M16 6.5h-5.551a2.678 2.678 0 0 1-.443 1.042C9.613 8.088 8.963 8.5 8 8.5c-.963 0-1.613-.412-2.006-.958A2.679 2.679 0 0 1 5.551 6.5H0v6A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-6z"/>
			</svg>
			<span class="fs-4">
				<b></b>
			</span>
		</div>
		<div class="container-fluid">
			<button class="btn btn-secondary" type="button" onclick="openReportsPage();">
				Apri
			</button>
		</div>
	</div>
	
	<div class="vl me-2" id="separator-3"></div>
	
	<div class="item-menu">
		<span class="fs-3" style="color: grey;">
			<b>Registri</b>
		</span>
		<div class="container-fluid">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
			class="bi bi-journal-text fs-2" viewBox="0 0 16 16">
			  <path d="M5 10.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0-2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
			  <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
			  <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
			</svg>
			<span class="fs-4">
				<b></b>
			</span>
		</div>
		<div class="container-fluid">
			<button class="btn btn-secondary" type="button" onclick="openRegistersPage();">
				Apri
			</button>
		</div>
	</div>
</div>
		
	


