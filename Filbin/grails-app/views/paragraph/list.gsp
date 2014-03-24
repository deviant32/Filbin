
<%@ page import="com.filbin.Paragraph" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'paragraph.label', default: 'Paragraph')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-paragraph" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="contents" title="${message(code: 'paragraph.contents.label', default: 'Contents')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${paragraphInstanceList}" status="i" var="paragraphInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${paragraphInstance.id}">${fieldValue(bean: paragraphInstance, field: "contents")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${paragraphInstanceCount}" />
	</div>
</section>

</body>

</html>
