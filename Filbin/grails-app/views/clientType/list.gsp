
<%@ page import="com.filbin.ClientType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clientType.label', default: 'ClientType')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-clientType" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="type" title="${message(code: 'clientType.type.label', default: 'Type')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${clientTypeInstanceList}" status="i" var="clientTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${clientTypeInstance.id}">${fieldValue(bean: clientTypeInstance, field: "type")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${clientTypeInstanceCount}" />
	</div>
</section>

</body>

</html>
