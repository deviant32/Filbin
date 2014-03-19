/**
 * 
 */
if(kks.isProduction) {
	kks.DynamicFormApp = (function() {
		kks.pageController = {
			init : function(options) {
				kks.templateManager.grabTemplates();
				kks.selectionWidget.initialize();
				
				this._formController = kks.formController.initialize($('#content'),
																	 options);
			},
			addBlankTemplate : function(id) {
				var aTemplate = kks.templateManager.template(id, {label : ''});
			},
			addTemplate : function(id, json) {
				var config = kks.FormElementBase.getElementConfig(id),
					o = eval(config.obj),
					aTemplate;
				if(config.needOptions) {
					if(json.fieldOptions.length < 0) {
						throw Error('you need some options for ', config);
					} else {
						var options = json.fieldOptions,
							i, len;
						
						aTemplate = $(kks.templateManager.template(id, json));
						
						for(i = 0, len = options.length; i < len; i++) {
							var optionTemplate = $(kks.templateManager.template(config.optionId, options[i]));
							aTemplate.find('.js-option-container').append(optionTemplate);
						}
					}
				} else {
					aTemplate = kks.templateManager.template(id, json);
				}
				var elementObj = new o($(aTemplate), json);
				this._formController.addElement(elementObj);
			}
		};
		$.extend(kks.pageController, kks.observable);
		
		var _createComponents = function() {
			kks.ElementEditorProxy.create();
		};
		
		var initialize = function(options) {
			kks.pageController.init(options);
			_createComponents();
		};
		
		return {
			initialize : initialize
		};
	})();
	
	//Example usage
	/**
	 * 
	 *
	 $(document).ready(function() {
		kks.DynamicFormApp.initialize( {
			'save' : function() {
				console.log('save!', arguments);
			},
			'load' : function() {
				console.log('load!', arguments);
			}
		});
	});
	*/
} else {
	$(document).ready(function() {
		kks.pageController = {
			init : function() {
				kks.templateManager.grabTemplates();
				kks.selectionWidget.initialize();
				
				this._formController = kks.formController.initialize($('#content'));
			},
			addBlankTemplate : function(id) {
				var aTemplate = kks.templateManager.template(id, {label : ''});
			},
			addTemplate : function(id, json) {
				var config = kks.FormElementBase.getElementConfig(id),
					o = eval(config.obj),
					aTemplate;
				if(config.needOptions) {
					if(json.fieldOptions.length < 0) {
						throw Error('you need some options for ', config);
					} else {
						var options = json.fieldOptions,
							i, len;
						
						aTemplate = $(kks.templateManager.template(id, json));
						
						for(i = 0, len = options.length; i < len; i++) {
							var optionTemplate = $(kks.templateManager.template(config.optionId, options[i]));
							aTemplate.find('.js-option-container').append(optionTemplate);
						}
					}
				} else {
					aTemplate = kks.templateManager.template(id, json);
				}
				var elementObj = new o($(aTemplate), json);
				this._formController.addElement(elementObj);
			}
		};
		$.extend(kks.pageController, kks.observable);
		
		kks.pageController.init();
		
		//Create components
		(function() {
			kks.ElementEditorProxy.create();
		})();
	});
}