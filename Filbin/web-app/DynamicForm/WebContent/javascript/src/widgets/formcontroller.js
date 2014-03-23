/**
 * 
 */
kks.formController = (function() {
	
	var initialize = function(container, options) {
		if(!options) {
			options = {save : function(){}, load : function(){}};
		}
		var editor = new Editor(container),
			controller = new Controller(editor, container),
			loader = new Loader(controller, container, options.load),
			saver  = new Saver(controller, container, options.save);
		
		return controller;
	};
	
	/**
	 * =======================================================================
	 * 
	 * =======================================================================
	 */
	Controller = function(editor, container) {
		this._editor = editor;
		this._container = container;
		this._formElements = {};
		//Arbitrary ID number to keep track of all form elements. This number
		//does not get reset until a full clear, since it's arbitrary.
		this._elementCount = 0;
		
		kks.pageController.observe('deleteFormElement',
									_.bind(this.removeElement, this));
	};
	Controller.prototype = {
		/**
		 * Adds a templated form element to the form container. All form
		 * elements can be edited or deleted, so we also need to append an
		 * editor template to the object's dom.
		 * @param obj
		 */
		addElement : function(obj) {
			var editorControls = $(kks.templateManager.template('controls', {}));
			this._formElements[++this._elementCount] = obj;
			
			obj.dom.attr('indx', String(this._elementCount));
			obj.dom.append(editorControls);
			this._container.append(obj.dom);
			this._editor.connectEditorControls(editorControls, obj);
		},
		toJson : function() {
			var ret = [],
				arr = _.keys(this._formElements),
				i, len;
			for(i = 0, len = arr.length; i < len; i++) {
				ret.push(this._formElements[arr[i]].toJson());
			}
			return ret;
		},
		clear : function() {
			var arr = _.keys(this._formElements),
				i = arr.length - 1,
				len = 0;
			for(;i >= len; i--) {
				this.removeElement(this._formElements[arr[i]]);
			}
			this._formElements = {};
			this._elementCount = 0;
		},
		removeElement : function(formEle) {
			var index = formEle.dom.attr('indx');
			this._formElements[index].remove();
			this._formElements[index] = null;
			delete this._formElements[index];
		}
	};
	$.extend(Controller, kks.observable);
	
	/**
	 * =======================================================================
	 * 
	 * =======================================================================
	 */
	Loader = function(controller, container, loader) {
		this._controller = controller;
		this._container = container;
		this._loadMethod = loader;
		this._connectHandlers();
	};
	Loader.prototype = {
		_load : function() {
			this._controller.clear();
			var json = this._loadMethod();
			for(var i = 0; i < json.length; i++) {
				kks.pageController.addTemplate(json[i].type, json[i]);
			}
		},
		_connectHandlers : function() {
			this._container.find('.js-load-form').on(
				'click', _.bind(this._load, this)
			);
		}
	};
	
	/**
	 * =======================================================================
	 * 
	 * =======================================================================
	 */
	Editor = function(container) {
		this._container = container;
		this._connectHandlers();
	};
	Editor.prototype = {
		connectEditorControls : function(dom, formEle) {
			var that = this;
			dom.find('.edit-control').on('click', function() {
				var config = {};
				
				
				kks.pageController.notify('openEditorDialog',
										  formEle,
										  _.bind(that, that._editCallback));
			});
			dom.find('.delete-control').on('click', function() {
				kks.pageController.notify('deleteFormElement', formEle);
			});
		},
		_editCallback : function() {
			
		},
		_onHover : function(ev) {
			$(ev.currentTarget).addClass('hovered');
		},
		_onLeave : function(ev) {
			$(ev.currentTarget).removeClass('hovered');
		},
		_connectHandlers : function() {
			var that = this;
			this._container.on({
				mouseenter : _.bind(that._onHover, that),
				mouseleave : _.bind(that._onLeave, that)
			}, '.form-element');
		}
	};
	
	/**
	 * =======================================================================
	 * 
	 * =======================================================================
	 */
	Saver = function(controller, container, saver) {
		this._controller = controller;
		this._container = container;
		this._saveMethod = saver;
		this._connectHandlers();
	};
	Saver.prototype = {
		_save : function() {
			var json = this._controller.toJson();
			this._saveMethod(json);
		},
		_connectHandlers : function() {
			$('.js-save-form').on(
				'click', _.bind(this._save, this)
			);
		}
	};
	
	return {
		initialize : initialize
	};
})();