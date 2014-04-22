/**
 * 
 */
kks.selectionWidget = (function() {
	var _container = $('#selections');
	
	var initialize = function() {
		_container.on('click', 'li', _.bind(_handleClick, this));
	};
	
	var _handleClick = function(ev) {
		var target = $(ev.currentTarget),
			id = target.attr('atype'),
			elementConfig = kks.FormElementBase.getElementConfig(id);
		this.curTarget = target;
		this.curTarget.addClass('is-selected');
		
		kks.pageController.notify('openEditorDialog',
								   elementConfig,
								   _.bind(_editorCallback, this));
	};
	
	var _editorCallback = function(json) {
		var id = this.curTarget.attr('atype');
		if(json !== null) {
			kks.pageController.addTemplate(id, json);
		}
		this.curTarget.removeClass('is-selected');
	};
	
	return {
		initialize : initialize
	};
})();