
<%@ page import="com.filbin.Proposal" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proposal.label', default: 'Proposal')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-proposal" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.client.label" default="Client" /></td>
				
				<td valign="top" class="value"><g:link controller="client" action="show" id="${proposalInstance?.client?.id}">${proposalInstance?.client?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${proposalInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.jobTypes.label" default="Job Types" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${proposalInstance.jobTypes}" var="j">
						<li><g:link controller="jobType" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${proposalInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
