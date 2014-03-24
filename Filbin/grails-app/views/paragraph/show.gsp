
<%@ page import="com.filbin.Paragraph" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paragraph.label', default: 'Paragraph')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-paragraph" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="paragraph.contents.label" default="Contents" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: paragraphInstance, field: "contents")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
