
<%@ page import="com.filbin.Client" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-client" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="emailAddress" title="${message(code: 'client.emailAddress.label', default: 'Email Address')}" />
			
				<g:sortableColumn property="notes" title="${message(code: 'client.notes.label', default: 'Notes')}" />
			
				<g:sortableColumn property="address" title="${message(code: 'client.address.label', default: 'Address')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'client.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="phoneNumber" title="${message(code: 'client.phoneNumber.label', default: 'Phone Number')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${clientInstanceList}" status="i" var="clientInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: clientInstance, field: "emailAddress")}</td>
			
				<td>${fieldValue(bean: clientInstance, field: "notes")}</td>
			
				<td>${fieldValue(bean: clientInstance, field: "address")}</td>
			
				<td><g:formatDate date="${clientInstance.dateCreated}" /></td>
			
				<td>${fieldValue(bean: clientInstance, field: "phoneNumber")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${clientInstanceCount}" />
	</div>
</section>

</body>

</html>
