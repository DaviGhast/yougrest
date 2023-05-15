<style type="text/css">
	
	.iconHeader {
		color: white;
		overflow: hidden;
	}
	
	.title {
	  font-family: Poppins-Bold;
	  font-size: 42px;
	  line-height: 1.2;
	  text-align: center;
	  width: 100%;
	  display: block;
	}
	
	#logo {
		margin-top: -10%;
		margin-bottom: -10%;
		align-items: center;
	}
	
	.logout {
		padding: 5px;
		color: white;
		overflow: hidden;
	}
	
	.space {
		color: white;
		overflow: hidden;
	}
	
	.wrap-nav-div {
	  border-radius: 10px;
	  margin-top: -2px;
	  overflow: hidden;
	  display: -webkit-box;
	  display: -webkit-flex;
	  display: -moz-box;
	  display: -ms-flexbox;
	  display: flex;
	  padding: 5px;
	  flex-wrap: wrap;
	  align-items: center;
	  justify-content: space-between;
	  border: 1px solid grey;
	}
	
	@media (max-width: 992px) {
	  .title {
		  font-family: Poppins-Bold;
		  font-size: 42px;
		  line-height: 1.2;
		  text-align: center;
		  width: 100%;
		  display: block;
		}
	}
	
	@media (max-width: 768px) {
	  .title {
		  font-family: Poppins-Bold;
		  font-size: 32px;
		  line-height: 1.2;
		  text-align: center;
		  width: 100%;
		  display: block;
		}
	}
	
	@media (max-width: 576px) {
	  .title {
		  font-family: Poppins-Bold;
		  font-size: 23px;
		  line-height: 1.2;
		  text-align: center;
		  width: 100%;
		  display: block;
		}
		
		.profile {
			font-size: 10px;
		}
		
		#logo {
			height: 50px;
		}
		
		.menu {
			width: 0%;
			font-size: 0px;
		}
		
		.user {
			width: 0%;
			font-size: 0px;
		}
	}
	
	.vl {
		margin-top: 2px;
		margin-bottom: 2px;
  		border-left: 5px solid grey;
  		border-radius: 10px;
	}
	
	.bi {
		width: 1em;
		height: 1em;
	}
	
</style>
	
<nav class="navbar bg-dark navbar-dark fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
    	<div class="iconHeader">
		<table>
			<tbody>
				<tr>
					<td rowspan="1" colspan="1">
						<img id="logo" alt="" src="<%=request.getContextPath()%>/images/logo.png" 
						height="62px" />
					</td>
					<td rowspan="1" colspan="1">
						<span class="title" style="color: #d8a451;">
							You
						</span>
					</td>
					<td rowspan="1" colspan="1">
						<span class="title" style="color: #cd903f;">
							Gre
						</span>
					</td>
					<td rowspan="1" colspan="1">
						<span class="title" style="color: #c86b32;">
							st
						</span>
					</td>
				</tr>
			</tbody>
		</table>			
	</div>
    </a>
    
    <div style="margin-left: -7%;">
    	<!-- <button type="button" class="navbar-toggler" onclick="back();">
	  		<div class="fs-3">
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
	      			<path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5z"/>
      			</svg>
				<span class="user">Indietro</span>
			</div>
	    </button>  -->
    <!-- Button trigger modal -->
	    <button type="button" class="navbar-toggler" data-bs-toggle="modal" data-bs-target="#profileModal">
	  		<div class="fs-3">
	      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
	      			<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"></path>
				</svg>
				<span class="user">Info Utente</span>
			</div>
	    </button>
	    
	    
	    
	    <button type="button" class="navbar-toggler" data-bs-toggle="modal" data-bs-target="#grestModal">
  		<div class="fs-3">
      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
      			<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/></svg>
			<span class="user">Oratorio Estivo</span>
		</div>
    </button>
    </div>
    
    <!-- <form class="d-flex">
        <input class="form-control me-2" type="text" placeholder="Search">
        <button class="btn btn-primary" type="button">Search</button>
    </form> -->
    
    <div>
    <button class="navbar-toggler fs-4" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
      <span class="menu">Menu</span>
    </button>
    </div>
    
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
    	<div class="container-fluid" style="display: flex;">
	      <ul class="navbar-nav me-2">
	        <li class="nav-item">
	          <a class="nav-link" href="Home.action">
	          	<div class="container-fluid">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" 
					class="bi bi-house-fill fs-2" viewBox="0 0 20 20">
					  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
  						<path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
					</svg>
					<span class="fs-4">
						Home
					</span>
				</div>
	          </a>
	        </li>
	       </ul>
	       <div class="vl me-2"></div>
	    	<ul class="navbar-nav me-2">
	        <li class="nav-item">
	          <a class="nav-link" href="index.jsp">
	          	<div class="container-fluid">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" 
					class="bi bi-box-arrow-left fs-2" viewBox="0 0 20 20">
					  <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
					  <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
					</svg>
					<span class="fs-4">
						Logout
					</span>
				</div>
	          </a>
	        </li>
	       </ul>
	    </div>
      
    </div>
    
    <!--  <div id="mySidenav" class="sidenav"> -->
  <!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
  <!-- <a href="#">About</a>
  <a href="#">Services</a>
  <a href="#">Clients</a>
  <a href="#">Contact</a>
</div> -->


    
	<script>
	function openCloseNav() {
		if(document.getElementById("mySidenav").style.width == "200px"){
			closeNav();
		}
	   	else{
	   		openNav();
	  	}
	}
	function openNav() {
	  document.getElementById("mySidenav").style.width = "200px";
	}
	
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
	
	</script>
    
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <div class="fs-4">
      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
      			<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"></path>
			</svg>
			Info Utente
		</div>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <c:if test="${not empty sessionScope.login}">
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
			<p class="profile">
				<b>Nome Utente:</b> ${sessionScope.login.username}
			</p>
			<p class="profile">
				<b>Ruolo:</b> ${sessionScope.login.role}
			</p>
			<p class="profile">
				<b>Luogo Collegamento:</b> ${sessionScope.login.role}
			</p>
			<p class="profile">
				<b>Terminale:</b> <%=request.getHeader("User-Agent") %>
			</p>
			<p class="profile">
				<b>Terminale:</b> <%=request.getRemoteAddr() %>
			</p>
			<p class="profile">
				<b>Terminale:</b> <%=java.net.InetAddress.getByName(request.getRemoteAddr()).getHostName() %>
			</p>
		</c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="grestModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <div class="fs-4">
      		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
      			<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
      		</svg>
			Info Grest
		</div>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <c:if test="${not empty sessionScope.login}">
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
			<p class="profile">
				<b>Nome Grest:</b> ${sessionScope.login.selectedGrest.name}
			</p>
			<p class="profile">
				<b>Anno:</b> ${sessionScope.login.selectedGrest.year}
			</p>
			<p class="profile">
				<b>Numero Settimane:</b> ${sessionScope.login.selectedGrest.num_weeks}
			</p>
			<p class="profile">
				<b>Data di Inizio:</b> ${sessionScope.login.selectedGrest.start_date}
			</p>
			
		</c:if>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>