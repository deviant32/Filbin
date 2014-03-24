
<%@ page import="com.filbin.LetterHead" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'letterHead.label', default: 'LetterHead')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-letterHead" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
			
				<g:sortableColumn property="title" title="${message(code: 'letterHead.title.label', default: 'Title')}" />
			
				<g:sortableColumn property="contents" title="${message(code: 'letterHead.contents.label', default: 'Contents')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${letterHeadInstanceList}" status="i" var="letterHeadInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${letterHeadInstance.id}">${fieldValue(bean: letterHeadInstance, field: "title")}</g:link></td>
			
				<td>${fieldValue(bean: letterHeadInstance, field: "contents")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${letterHeadInstanceCount}" />
	</div>
</section>

</body>

</html>
