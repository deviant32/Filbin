
<%@ page import="com.filbin.Quote" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'quote.label', default: 'Quote')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-quote" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="quote.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${quoteInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="quote.footer.label" default="Footer" /></td>
				
				<td valign="top" class="value"><g:link controller="footer" action="show" id="${quoteInstance?.footer?.id}">${quoteInstance?.footer?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="quote.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${quoteInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="quote.letterHead.label" default="Letter Head" /></td>
				
				<td valign="top" class="value"><g:link controller="letterHead" action="show" id="${quoteInstance?.letterHead?.id}">${quoteInstance?.letterHead?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="quote.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: quoteInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="quote.paragraphs.label" default="Paragraphs" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${quoteInstance.paragraphs}" var="p">
						<li><g:link controller="paragraph" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="quote.proposal.label" default="Proposal" /></td>
				
				<td valign="top" class="value"><g:link controller="proposal" action="show" id="${quoteInstance?.proposal?.id}">${quoteInstance?.proposal?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
