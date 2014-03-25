
<%@ page import="com.filbin.JobType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'jobType.label', default: 'JobType')}" />
	<title><g:message code="default.index.label" args="[entityName]" /></title>
</head>

<body>

<section id="index-jobType" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
				<g:sortableColumn property="name" title="${message(code: 'jobType.name.label', default: 'Name')}" />
				<g:sortableColumn property="dateCreated" title="${message(code: 'jobType.dateCreated.label', default: 'Date Created')}" />
				<g:sortableColumn property="lastUpdated" title="${message(code: 'jobType.lastUpdated.label', default: 'Last Updated')}" />
			</tr>
		</thead>
		<tbody>
		<g:each in="${jobTypeInstanceList}" status="i" var="jobTypeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${jobTypeInstance.id}">${fieldValue(bean: jobTypeInstance, field: "name")}</g:link></td>			
				<td>${fieldValue(bean: jobTypeInstance, field: "dateCreated") }</td>
				<td>${fieldValue(bean: jobTypeInstance, field: "lastUpdated") }</td>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div>
		<bs:paginate total="${jobTypeInstanceCount}" />
	</div>
</section>

</body>

</html>
