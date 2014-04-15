
<%@ page import="com.filbin.ProposalValue" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proposalValue.label', default: 'ProposalValue')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-proposalValue" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposalValue.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proposalValueInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposalValue.value.label" default="Value" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: proposalValueInstance, field: "value")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposalValue.proposal.label" default="Proposal" /></td>
				
				<td valign="top" class="value"><g:link controller="proposal" action="show" id="${proposalValueInstance?.proposal?.id}">${proposalValueInstance?.proposal?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
