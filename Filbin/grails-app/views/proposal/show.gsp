
<%@ page import="com.filbin.Proposal" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proposal.label', default: 'Proposal')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'dynamicform.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'bootstrap.min.css')}" type="text/css">
	
	<script>
		$(document).ready(function() {
			kks.DynamicFormApp.initialize();
			var url = '${createLink(controller : 'proposal', action:'getJson', params: [id:proposalInstance.id])}';
			$.getJSON(url, function(data) {
				var container = $('#jobTypes');
				for(var j = 0; j < data.length; j++) {
					var form = (JSON.parse(data[j].jsonFormText))['0'];
					for(var i = 0; i < form.length; i++) {
						var id = form[i].type;
						kks.pageController.addTemplateToContainer(id, form[i], container);
					}
				}
			});
		});
	</script>
</head>

<body>

<section id="show-proposal" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.client.label" default="Client" /></td>
				
				<td valign="top" class="value"><g:link controller="client" action="show" id="${proposalInstance?.client?.id}">${proposalInstance?.client?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${proposalInstance?.dateCreated}" format="MM/dd/yyyy" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.jobTypes.label" default="Job Types" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${proposalInstance.jobTypes}" var="j">
						<li><g:link controller="jobType" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="proposal.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${proposalInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

<div class='templates'>
	<div id='inputbox' class='template'>
		<div class='form-group form-element'>
			<label>
				{{label}}
				<input type='text' name={{name}} class='form-control'>
			</label>
		</div>
	</div>
	<div id='textarea' class='template'>
		<div class='form-group form-element'>
			<label>
				{{label}}
				<textarea class='form-control' name={{name}}></textarea>
			</label>
		</div>
	</div>
	<div id='radiogroup' class='template'>
		<div class='form-group form-element'>
			<span class='label'>{{label}}</span>
			<div class='js-option-container'>
			</div>
		</div>
	</div>
	<div id='dropdown' class='template'>
		<div class='form-group form-element'>
			<span class='label'>{{label}}</span>
			<select class='form-control js-option-container'></select>
		</div>
	</div>
	<div id='selectlist' class='template'>
		<div class='form-group form-element'>
			<span class='label'>{{label}}</span>
			<select multiple class='form-control js-option-container'></select>
		</div>
	</div>
	<div id='checkbox' class='template'>
		<div class='form-group form-element'>
			<label>
				<input type='checkbox' name={{name}} value={{value}} class='form-control'>{{label}}
			</label>
		</div>
	</div>
	
	<div id='aradio' class='template'>
		<div class='radio'>
			<input type='radio' name={{optionName}} value={{optionValue}}>
			<span class='label'>{{optionLabel}}</span>
		</div>
	</div>
	
	<div id='anoption' class='template'>
		<option class='form-control' value={{optionValue}}>{{optionLabel}}</option>
	</div>
</div>

<ul class="nav nav-tabs">
  <li class="active"><a href="#">Home</a></li>
  <li><a href="#">Profile</a></li>
  <li><a href="#">Messages</a></li>
</ul>

<div id='jobTypes'></div>

</body>

</html>
