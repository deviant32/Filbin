	<div class="container" style="margin-top:30px;">
		<ul class="nav nav-pills">
		  <li class="controller${params.controller == 'home' ? " active" : ""}">
		  	<g:link controller="home" action="index">
				<g:message code="Home" default="Home"/>
			</g:link>
		  </li>
		  <li class="controller${params.controller == 'client' ? " active" : ""}">
			<g:link controller="client" action="index">
				<g:message code="CLient" default="Client"/>
			</g:link>
		  </li>
		
		  <li class="controller${params.controller == 'clientType' ? " active" : ""}">
		  	<g:link controller="ClientType" action="index">
				<g:message code="CLient Type" default="Client Type"/>
			</g:link>
		</li>
		
		<li class="controller${params.controller == 'jobType' ? " active" : ""}">
		  	<g:link controller="JobType" action="index">
				<g:message code="Job Type" default="Job Type"/>
			</g:link>
		</li>
		
		<li class="controller${params.controller == 'proposal' ? " active" : ""}">
		  	<g:link controller="Proposal" action="index">
				<g:message code="Proposals" default="Proposal"/>
			</g:link>
		</li>
	   </ul>
	</div>
	
	<hr>
