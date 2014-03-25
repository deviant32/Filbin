<%@ page import="com.filbin.JobType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'jobType.label', default: 'JobType')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	
	
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'dynamicform.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'bootstrap.min.css')}" type="text/css">
	
	<script>
		$(document).ready(function() {
			kks.DynamicFormApp.initialize();
			var url = '${createLink(controller : 'jobType', action:'getJobTypeById', params: [id:jobTypeInstance.id])}';
			$.getJSON(url, function(data) {
				var container = $('#jobTypes');
				console.log(data.jsonFormText);
					var form = (JSON.parse(data.jsonFormText))['0'];
					var job = $('<div/>', {className:'job'});
					
					for(var i = 0; i < form.length; i++) {
						
						var id = form[i].type;
						kks.pageController.addTemplateToContainer(id, form[i], job);
						$('#jobTypes').append(job);
						
					}
			});
		});
	</script>
</head>
<body>

<section id="show-jobType" class="first">

	<h2>${jobTypeInstance.name}</h2>
	(View Only)
	
  <div class='templates' style="padding-top:30px;">
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
  	
  	
	
</section>

</body>

</html>
