
<%@ page import="com.filbin.Quote" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'quote.label', default: 'Quote')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-quote" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'quote.dateCreated.label', default: 'Date Created')}" />
			
				<th><g:message code="quote.footer.label" default="Footer" /></th>
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'quote.lastUpdated.label', default: 'Last Updated')}" />
			
				<th><g:message code="quote.letterHead.label" default="Letter Head" /></th>
			
				<g:sortableColumn property="name" title="${message(code: 'quote.name.label', default: 'Name')}" />
			
				<th><g:message code="quote.proposal.label" default="Proposal" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${quoteInstanceList}" status="i" var="quoteInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${quoteInstance.id}">${fieldValue(bean: quoteInstance, field: "dateCreated")}</g:link></td>
			
				<td>${fieldValue(bean: quoteInstance, field: "footer")}</td>
			
				<td><g:formatDate date="${quoteInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: quoteInstance, field: "letterHead")}</td>
			
				<td>${fieldValue(bean: quoteInstance, field: "name")}</td>
			
				<td>${fieldValue(bean: quoteInstance, field: "proposal")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${quoteInstanceCount}" />
	</div>
</section>

</body>

</html>
