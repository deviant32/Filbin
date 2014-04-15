
<%@ page import="com.filbin.ProposalValue" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proposalValue.label', default: 'ProposalValue')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-proposalValue" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'proposalValue.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="value" title="${message(code: 'proposalValue.value.label', default: 'Value')}" />
			
				<th><g:message code="proposalValue.proposal.label" default="Proposal" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${proposalValueInstanceList}" status="i" var="proposalValueInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${proposalValueInstance.id}">${fieldValue(bean: proposalValueInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: proposalValueInstance, field: "value")}</td>
			
				<td>${fieldValue(bean: proposalValueInstance, field: "proposal")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${proposalValueInstanceCount}" />
	</div>
</section>

</body>

</html>
