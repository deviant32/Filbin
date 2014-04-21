
<%@ page import="com.filbin.Client" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>

	
	<%--
	
	<script src='${resource(dir: 'js', file: 'binaryajax.js')}'></script>
    <script src='${resource(dir: 'js', file: 'exif.js')}'></script>
    <script src='${resource(dir: 'js', file: 'jquery.canvasResize.js')}'></script>
    <script src='${resource(dir: 'js', file: 'canvasResize.js')}'></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('input[name=file]').change(function(e) {
					var file = e.target.files[0];
					canvasResize(file, {
					width: 100,
					height: 0,
					crop: false,
					quality: 20,
					//rotate: 90,
					callback: function(data, width, height) {
						console.log($('input[name=file]'));
						e.target.files[0] = data;
					//$(img).attr('src', data);
				}
				});
			});
		});
	</script>
--%>



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
	
	<div style="margin-bottom: 30px;">
		<div class="content scaffold-create" role="main">
			<h2>Upload New Document</h2>
			<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
			<g:uploadForm  action="upload">
			   <input type="file" name="file"  style="display:inline" required/>
			   <input type="text" id="fileName" name="fileName"  style="display:inline"/>
			   <input type="hidden" name="clientId" value="${clientInstance.id }" />
			   <g:submitButton name="upload" value="Upload" />
			</g:uploadForm>
		</div>
	</div>
	<div class="well">
	<g:if test="${flash.message}"><div class="message" role="status">${flash.message}</div></g:if>
		<table style="margin-bottom:20px; width:100%;">
			<thead>
				<tr>
					<g:sortableColumn property="filename" title="Filename" />
					<g:sortableColumn property="uploadDate" title="Upload Date" />
				</tr>
			</thead>
			<tbody>
			<g:each in="${clientInstance.clientFiles}" status="i" var="documentInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td><g:link action="download" id="${documentInstance.id}">${documentInstance.filename}</g:link></td>
					<td><g:formatDate date="${documentInstance.uploadDate}" /></td>
				</tr>
			</g:each>
			</tbody>
		</table>
	</div>
	
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
