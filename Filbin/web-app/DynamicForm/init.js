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


