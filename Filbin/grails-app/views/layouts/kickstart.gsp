<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<link rel="shortcut icon"		href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
	<link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-72x72.png"	sizes="72x72">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-114x114.png"	sizes="114x114">
    
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap3-wysiwyg5.css')}" />
	
	<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
	<r:require modules="jquery"/> <%-- jQuery is required for Bootstrap! --%>
	<r:require modules="bootstrap"/>
	<r:require modules="bootstrap_utils"/>
	
	<script type='text/javascript'>
    	//namespacing
    	window.kks = {};
    	kks.isProduction = true;
    </script>
    
	<r:layoutResources />
	<g:layoutHead />

	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
		<script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<%-- For Javascript see end of body --%>
</head>

<body>
	<g:render template="/_menu/navbar"/>	
	
	<div class="jumbotron" style="text-align:center">
	  <a href='<g:createLink controller="client" action="create" />' class="btn btn-primary btn-lg" role="button" style="margin-right:10px;">New Client</a>
	  <a href='<g:createLink controller="proposal" action="create" />' class="btn btn-primary btn-lg" role="button" style="margin-right:10px;">New Proposal</a>
	  <%--<a href='<g:createLink controller="quote" action="create" />' class="btn btn-primary btn-lg" role="button">New Quote</a>
	--%></div>													

	<!-- Enable to overwrite Header by individual page -->
	<g:if test="${ pageProperty(name:'page.header') }">
   		<g:pageProperty name="page.header" />
	</g:if>
	<g:else>
		<g:render template="/layouts/header"/>														
	</g:else>

	<g:render template="/layouts/content"/>														

	<!-- Enable to overwrite Footer by individual page -->
	<g:if test="${ pageProperty(name:'page.footer') }">
	    <g:pageProperty name="page.footer" />
	</g:if>
	<g:else>
		<g:render template="/layouts/footer"/>														
	</g:else>

	<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
	<g:if test="${ pageProperty(name:'page.include.bottom') }">
   		<g:pageProperty name="page.include.bottom" />
	</g:if>
	<g:else>
		<!-- Insert a modal dialog for registering (for an open site registering is possible on any page) -->
		<g:render template="/_common/modals/registerDialog" model="[item: item]"/>
	</g:else>
	
	<!-- Included Javascript files and other resources -->
	<r:layoutResources />
	
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/libs/bootstrap', file: 'bootstrap.min.js')}'></script>
	<script src='${resource(dir: 'DynamicForm/WebContent/javascript/libs/handlebars', file: 'handlebars.js')}'></script>
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/libs/backbone', file: 'underscore.js')}'></script>
    <!-- Util -->
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src/util', file: 'observable.js')}'></script>
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src/util', file: 'function.js')}'></script>
    <!-- Widgets -->
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src/widgets', file: 'templatemanager.js')}'></script>
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src/widgets', file: 'selectionwidget.js')}'></script>
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src/widgets', file: 'formcontroller.js')}'></script>
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src/widgets', file: 'elementeditordialog.js')}'></script>
    <!-- Base -->
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src', file: 'elements.js')}'></script>
    <script src='${resource(dir: 'DynamicForm/WebContent/javascript/src', file: 'app.js')}'></script>
    <script src='${resource(dir: 'js', file: 'wysihtml5-0.3.0.js')}'></script>
    <script src='${resource(dir: 'js', file: 'bootstrap3-wysihtml5.js')}'></script>
    
    <script type="text/javascript">
		$(document).ready(function(){
			$('.textarea').wysihtml5();
		});
	</script>
    
    
</body>

</html>