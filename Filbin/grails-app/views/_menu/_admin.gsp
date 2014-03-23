<li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
   		<i class="glyphicon glyphicon-wrench"></i>
		<g:message code="default.admin.label"/><b class="caret"></b>
	</a>
	<ul class="dropdown-menu">
		<li class="controller${params.controller == 'clientType' ? " active" : ""}">
		  	<g:link controller="ClientType" action="index">
				<g:message code="CLient Type" default="Client Types"/>
			</g:link>
		</li>
		<li class="controller${params.controller == 'jobType' ? " active" : ""}">
		  	<g:link controller="JobType" action="index">
				<g:message code="Job Type" default="Job Types"/>
			</g:link>
		</li>
		<g:if env="development">
		<hr>
		<li class="">
			<a href="${createLink(uri: '/dbconsole')}">
				<i class="glyphicon glyphicon-dashboard"></i>
				<g:message code="default.dbconsole.label"/>
			</a>
		</li>
		</g:if>
		<li class="">
			<a href="${createLink(uri: '/systeminfo')}">
				<i class="glyphicon glyphicon-info-sign"></i>
				<g:message code="default.systeminfo.label"/>
			</a>
		</li>
	</ul>
</li>
