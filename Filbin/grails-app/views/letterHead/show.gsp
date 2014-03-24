
<%@ page import="com.filbin.LetterHead" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'letterHead.label', default: 'LetterHead')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-letterHead" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterHead.title.label" default="Title" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: letterHeadInstance, field: "title")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="letterHead.contents.label" default="Contents" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: letterHeadInstance, field: "contents")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
