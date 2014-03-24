
<%@ page import="com.filbin.Footer" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'footer.label', default: 'Footer')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-footer" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="title"><g:message code="footer.title.label" default="Title" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: footerInstance, field: "title")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="footer.contents.label" default="Contents" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: footerInstance, field: "contents")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
