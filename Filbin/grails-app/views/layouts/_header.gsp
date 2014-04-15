	<div class="container" style="margin-top:30px;">
		<ul class="nav nav-pills">
		  <li class="controller${params.controller == 'home' ? " active" : ""}">
		  	<g:link controller="home" action="index">
				<g:message code="Home" default="Home"/>
			</g:link>
		  </li>
		  <li class="controller${params.controller == 'client' ? " active" : ""}">
			<g:link controller="client" action="index">
				<g:message code="CLient" default="View All Clients"/>
			</g:link>
		  </li>
		<li class="controller${params.controller == 'proposal' ? " active" : ""}">
		  	<g:link controller="Proposal" action="index">
				<g:message code="Proposals" default="View All Proposals"/>
			</g:link>
		</li>
		<%--<li class="controller${params.controller == 'quote' ? " active" : ""}">
		  	<g:link controller="quote" action="index">
				<g:message code="Quotes" default="View All Quotes"/>
			</g:link>
		</li>
	   --%></ul>
	</div>
	
	<hr>
