
<%@ page import="com.filbin.ClientType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'clientType.label', default: 'ClientType')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-clientType" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="clientType.type.label" default="Type" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientTypeInstance, field: "type")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
