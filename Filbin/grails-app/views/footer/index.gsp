
<%@ page import="com.filbin.Footer" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'footer.label', default: 'Footer')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-footer" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'footer.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="contents" title="${message(code: 'footer.contents.label', default: 'Contents')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${footerInstanceList}" status="i" var="footerInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${footerInstance.id}">${fieldValue(bean: footerInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: footerInstance, field: "contents")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${footerInstanceCount}" />
	</div>
</section>

</body>

</html>
