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
			var object = this._getObjectFromJson(id, json);
			this._formController.addElement(object);
		},
		addTemplateToContainer : function(id, json, container) {
			container.append((this._getObjectFromJson(id, json)).dom);
		},
		_getObjectFromJson : function(id, json) {
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
			return new o($(aTemplate), json);
		},
		hasElement : function(label) {
			return this._formController.hasElement(label);
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