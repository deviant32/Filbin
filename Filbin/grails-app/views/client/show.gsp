
<%@ page import="com.filbin.Client" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-client" class="first">
	<h2>${fieldValue(bean: clientInstance, field: "name")}</h2>

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="client.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="client.emailAddress.label" default="Email Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientInstance, field: "emailAddress")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="client.notes.label" default="Notes" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientInstance, field: "notes")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="client.address.label" default="Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientInstance, field: "address")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="client.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${clientInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="client.phoneNumber.label" default="Phone Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: clientInstance, field: "phoneNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="client.type.label" default="Type" /></td>
				
				<td valign="top" class="value"><g:link controller="clientType" action="show" id="${clientInstance?.type?.id}">${clientInstance?.type?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
	
	
	<div>
    <h2>Proposals</h2>
    <a class="btn btn-primary" href="${createLink(controller:'proposal',action:'create',params:['client.id': clientInstance.id])}" role="button">Create Proposal</a>
    <table class="table table-bordered margin-top-medium">
      <thead>
        <tr>
          <th class="sortable">Name</th>
          <th class="sortable">Date Added</th>
          <th class="sortable">Date Updated</th>
        </tr>
      </thead>
      <tbody>
      	<g:each in="${proposalList}" status="i" var="proposal">
      		<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" controller="proposal" id="${proposal.id}">${proposal.name}</g:link></td>
				<td><g:formatDate date="${proposal.dateCreated}" type="datetime" style="SHORT"/></td>
				<td><g:formatDate date="${proposal.lastUpdated}" type="datetime" style="SHORT"/></td>
			<tr>
		</g:each>
      </tbody>
    </table>
</div>
</section>

</body>

</html>
