<%@ page import="com.filbin.JobType" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'jobType.label', default: 'JobType')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
	
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'dynamicform.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'DynamicForm/WebContent/styles', file: 'bootstrap.min.css')}" type="text/css">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js'></script>
      <script src='https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js'></script>
    <![endif]-->
    <script type="text/javascript">
	$(document).ready(function() {
		kks.DynamicFormApp.initialize( {
			'save' : function() {
				$("#jsonFormText").val((JSON.stringify(arguments)));
				$("[name='jobTypeForm']").submit();		
			},
			'load' : function() {
				console.log('load!', arguments);
			}
		});
	});
	</script>
	
</head>

<body>

	<section id="create-jobType" class="first">

		<g:hasErrors bean="${jobTypeInstance}">
		<div class="alert alert-danger">
			<g:renderErrors bean="${jobTypeInstance}" as="list" />
		</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal" name="jobTypeForm" role="form" >
			<g:render template="form"/>
			
			
		</g:form>
		
		<div id='selections'>
  		<ul>
  			<li class='element-selector' atype='inputbox'>
  				Text <span class='add'></span>
  			</li>
  			<li class='element-selector' atype='textarea'>
  				Text Area <span class='add'></span>
  			</li>
  			<li class='element-selector' atype='radiogroup'>
  				Radio <span class='add'></span>
  			</li>
  			<li class='element-selector' atype='dropdown'>
  				Drop-down <span class='add'></span>
  			</li>
  			<li class='element-selector' atype='selectlist'>
  				Select <span class='add'></span>
  			</li>
  			<li class='element-selector' atype='checkbox'>
  				Check box <span class='add'></span>
  			</li>
  		</ul>
  	</div>
  	
  	<div id='content'>
  		<%--<button class='js-save-form'>Save Form</button>
  		<button class='js-load-form'>Load Form</button>
  	--%></div>
  	
  	<div style="clear:both; margin-bottom:40px;"></div>
  	
	<div class="form-actions margin-top-medium">
		<g:submitButton name="create" class="btn btn-primary js-save-form" value="${message(code: 'default.button.create.label', default: 'Create')}" />
           <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
	</div>
  	
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
  		
  		<div id='controls' class='template'>
			<ul class='form-element-controls'>
				<li class='edit-control'></li>
				<li class='delete-control'></li>
			</ul>
  		</div>
  	</div>
  	
  	<div class='dialogs'>
		<div id='formelementeditor' class='modal fade'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-header'>
						<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
						<h4 class='modal-title'>Modal title</h4>
					</div>
					<div class='modal-body'>
					</div>
					<div class='modal-footer'>
						<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>
						<button type='button' class='btn btn-primary'>Save changes</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	
  	
  	
	</section>
	

</body>

</html>
