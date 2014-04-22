kks.templateManager = (function() {
	var templates = [];
	
	var grabTemplates = function() {
		$('.templates').children().each(function() {
			var id = $(this).attr('id');
			templates.push(id);
		});
	};
	
	var template = function(t, vals) {
		if(!typeof vals === Object) {
			throw new TypeError('vals needs to be a hash of name-value pairs');
		}
		if(templates.indexOf(t) < 0) {
			throw new Error('[' + t + '] does not exist as a template');
		}
		var comp = Handlebars.compile($('#' + t).html());
		return comp(vals);
	};
	
	return {
		grabTemplates : grabTemplates,
		template : template
	};
})();