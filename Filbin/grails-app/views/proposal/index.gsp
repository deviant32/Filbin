
<%@ page import="com.filbin.Proposal" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proposal.label', default: 'Proposal')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-proposal" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'proposal.name.label', default: 'Proposal Name')}" />
				
				<th><g:message code="proposal.client.label" default="Client" /></th>
				
				<g:sortableColumn property="dateCreated" title="${message(code: 'proposal.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'proposal.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${proposalInstanceList}" status="i" var="proposalInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${proposalInstance.id}">${fieldValue(bean: proposalInstance, field: "name")}</g:link></td>
				
				<td><g:link action="show" id="${proposalInstance.id}">${fieldValue(bean: proposalInstance, field: "client")}</g:link></td>
				
				<td><g:formatDate date="${proposalInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${proposalInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${proposalInstanceCount}" />
	</div>
</section>

</body>

</html>
