
<%@ page import="com.filbin.Proposal" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'proposal.label', default: 'Proposal')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'dynamicform.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'bootstrap.min.css')}" type="text/css">
	<style type="text/css">
		.tab-content{padding:20px;}
	</style>
	
	<script>
		$(document).ready(function() {
			kks.DynamicFormApp.initialize();
			var url = '${createLink(controller : 'proposal', action:'getJson', params: [id:proposalInstance.id])}';
			$.getJSON(url, function(data) {
				var container = $('#jobTypes');

				
				
				for(var j = 0; j < data.length; j++) {
					var form = (JSON.parse(data[j].jsonFormText))['0'];
					console.log(data[j].name);
					var job = $('<div/>', {className:'job'});
					//var title = $('<h2>Job Type</h2>');
					
					var tab;
					var pane;
					if(j === 0){
						tab = $('<li class="active"><a href="#pane'+j+'" data-toggle="tab">'+data[j].name+'</a></li>');
						pane = $('<div id="pane'+j+'" class="tab-pane active">');
					}else{
						tab = $('<li><a href="#pane'+j+'" data-toggle="tab">'+data[j].name+'</a></li>');
						pane = $('<div id="pane'+j+'" class="tab-pane">');
					}
					$('.nav-tabs').append(tab);

					
					$('.tab-content').append(pane);
					for(var i = 0; i < form.length; i++) {
						
						var id = form[i].type;
						kks.pageController.addTemplateToContainer(id, form[i], job);
						$('#pane'+j).append(job);
						
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
  				<label>{{label}}</label>
	  			<div class='js-option-container'>
	  			</div>
	  		</div>
  		</div>
  		<div id='dropdown' class='template'>
  			<div class='form-group form-element'>
  				<label>{{label}}</label>
  				<select class='form-control js-option-container'></select>
  			</div>
  		</div>
  		<div id='selectlist' class='template'>
  			<div class='form-group form-element'>
	  			<label>{{label}}</label>
  				<select multiple class='form-control js-option-container'></select>
	  		</div>
  		</div>
  		<div id='checkbox' class='template'>
  			<div class='form-group form-element'>
	  			<label>{{label}}</label>
	  			<input type='checkbox' name={{name}} value={{value}} class='form-control'>
	  		</div>
  		</div>
  		
  		<div id='aradio' class='template'>
  			<div class='radio'>
  				<label>{{label}}</label>
  				<input type='radio' name={{optionName}} value={{optionValue}}>
  			</div>
  		</div>
  		
  		<div id='anoption' class='template'>
  			<option class='form-control' value={{optionValue}}>{{optionLabel}}</option>
  		</div>
  		
  		<div id='controls' class='template'>
			<ul class='form-element-controls'>
				<li class='edit-control'></li>
				<li class='delete-control'></li>
			</ul>
  		</div>
  	</div>

<div class="tabbable">
  <ul class="nav nav-tabs">
    
  </ul>
  <div class="tab-content">
  </div><!-- /.tab-content -->
</div><!-- /.tabbable -->

<div id='jobTypes'></div>

</body>

</html>
