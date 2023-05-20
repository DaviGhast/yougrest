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
		
	.tab1 {
		background-color: #4f8294;
		border-radius: 10px;
		color: white;
	}
	
	/* Change background color of buttons on hover */
	.tab1:hover {
	  background-color: #ddd;
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
		document.getElementById("defaultOpen").click();
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
		  //$('#'+cardName).css('display','block');
		  document.getElementById(cardName).style.display = "block";
		  evt.currentTarget.className += " active";
	}
	function openUrl(week, day) {
		debugger;
		var url = 'WelcomePage.action?inParam1=&inParam2=';
		url = url.replace('inParam1=', 'inParam1='+week);
		url = url.replace('inParam2=', 'inParam2='+day);
		window.top.location.href=url;
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


<div class="wrap-login100" style="border: 1px solid;">

	<div class="container-fluid login100-form-title">
		<span class="">
			Seleziona Settimana e Giorno
		</span>
	</div>

	<c:forEach var = "i" begin = "1" end = "${result[0].num_weeks}">
	
		<c:if test="${i eq '1' }">
			<div class="item-menu">
		      	<button class="btn tab tablinks" onclick="openCard(event, '${i}')" id="defaultOpen">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" 
					fill="currentColor" class="bi bi-calendar-week fs-4" viewBox="0 0 16 16">
					  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
					</svg>
					<span class="fs-6">
						<b>Sett. ${i}</b>
					</span>
				</button>
			</div>
		</c:if>
		
		<c:if test="${i ne '1' }">
			<div class="item-menu">
		      	<button class="btn tab tablinks" onclick="openCard(event, '${i}')">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" 
					fill="currentColor" class="bi bi-calendar-week fs-4" viewBox="0 0 16 16">
					  <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm-5 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
					  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
					</svg>
					<span class="fs-6">
						<b>Sett. ${i}</b>
					</span>
				</button>
			</div>
		</c:if>
		
	</c:forEach>
	
	<c:forEach var = "i" begin = "1" end = "${result[0].num_weeks}">
		
		<div id="${i}" class="tabcontent" style="width: 100%;">
		
			<div class="wrap-div" style="width: 100%; background: transparent;">
			
				<c:forEach var = "y" begin = "1" end = "5">
				
					<div class="item-menu">
				      	<button class="btn tab1" onclick="openUrl('${i}', '${y}')">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" 
							fill="currentColor" class="bi bi-calendar2-event fs-4" viewBox="0 0 16 16">
							  <path d="M11 7.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
							  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z"/>
							  <path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z"/>
							</svg>
							<span class="fs-6">
								<b>${result[2][y-1]}</b>
							</span>
						</button>
					</div>
					
	            </c:forEach>
	            
			</div>
			
		</div>
		
	</c:forEach>

</div>
		
	


