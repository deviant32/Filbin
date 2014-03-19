/**
 * 
 */
kks.ElementEditorDialog = function(container) {
	this._container = container;
	this._body = this._container.find('.modal-body');
	this.REPLACE = '{replace}';
	this._connectHandlers();
};
kks.ElementEditorDialog.prototype = {
	setConfiguration : function(config) {
		this._clear();
		if(config.isLoad) {
			this.setLoadedConfiguration(config);
			return;
		}
		this._setTitle(config.title);
		var appendents = [];
		
		//TODO use templating
		if(config.value === this.REPLACE) {
			appendents.push(
				$('<div>').append(
					$('<label>').text('Field Value:').append(
						$('<input>').addClass('form-control')
					)
				).addClass('js-value')
			);
		}
		
		if(config.name === this.REPLACE) {
			appendents.push(
				$('<div>').append(
					$('<label>').text('Field Name:').append(
						$('<input>').addClass('form-control')
					)
				).addClass('js-name')
			);
		}
		
		if(config.label === this.REPLACE) {
			appendents.push(
				$('<div>').append(
					$('<label>').text('Field Label:').append(
						$('<input>').addClass('form-control')
					)
				).addClass('js-label')
			);
		}
		
		if(config.needOptions) {
			var that = this;
			appendents.push(
				$('<div>').append(
					$('<label>').text('Field Options: '),
					$('<button>').text('Add Option').on('click', function() {
						that._handleAddOption($(this).parent());
					})
				).addClass('js-options')
			);
		}
		
		//Radio button is a different kind of element - all options must have
		//the same name, so we need to do something a little different
		this._isRadio = (config.title === 'Radio Group');
		
		var i, len;
		for(i = 0, len = appendents.length; i < len; i++) {
			appendents[i].addClass('input-group');
			this._body.append(appendents[i]);
		}
	},
	setLoadedConfiguration : function(config) {
		
	},
	marshal : function() {
		var valueEle  = this._container.find('.js-value'),
			nameEle   = this._container.find('.js-name'),
			labelEle  = this._container.find('.js-label'),
			optionEle = this._container.find('.js-options'),
			obj = {};
		
		if(valueEle.exists()) {
			obj.value = valueEle.find('input').val();
		}
		if(nameEle.exists()) {
			obj.name = nameEle.find('input').val();
		}
		if(labelEle.exists()) {
			obj.label = labelEle.find('input').val();
		}
		if(optionEle.exists()) {
			var options = [];
			optionEle.children('.options-div').each(function() {
				var inputs = $(this).find('input');
				var o = {
					'optionLabel' : inputs.eq(0).val(),
					'optionValue' : inputs.eq(1).val()
				};
				if(inputs.eq(2).exists()) {
					o.optionName = inputs.eq(2).val();
				}
				options.push(o);
			});
			obj.fieldOptions = options;
		}
		
		return obj;
	},
	show : function() {
		this._container.modal('show');
	},
	close : function() {
		this._isSubmit = true;
		this._container.modal('hide');
	},
	_handleAddOption : function(container) {
		var div = $('<div>').addClass('options-div'),
			lbl1 = $('<label>').text('Option text').append(
						$('<input>').addClass('form-control')
					),
			lbl2 = $('<label>').text('Option value').append(
						$('<input>').addClass('form-control')
					),
			lbl3 = (this._isRadio) ? $('<label>').text('Option name').append(
										$('<input>').addClass('form-control')
										.addClass('js-radio-option')
									) : '';
		container.append(div.append(lbl1, lbl2, lbl3));
		
		if(this._isRadio) {
			this._container.find('.js-radio-option').on(
				'input', _.bind(this._handleRadioNameInput, this)
			);
		}
	},
	_handleRadioNameInput : function(ev) {
		this._container.find('.js-radio-option').val($(ev.currentTarget).val());
	},
	_setTitle : function(title) {
		this._container.find('.modal-title').text(title);
	},
	_clear : function() {
		this._body.children().remove();
	},
	_connectHandlers : function() {
		var that = this;
		/**
		 * Bootstrap doesn't have a "submitted" event, so I had to create my own
		 * onClick event. Unfortunately, I also need to use bootstrap's hidden
		 * event, which coincides with the submit event and crashes the browser.
		 * A few options to fix this:
		 * 1) Don't use the Bootstrap Modal window.
		 * 2) Pass a variable to the "hide" event that tells the code that it's
		 * a submit call.
		 * 3) The "view" object should hold a property that says we are
		 * performing a submit.
		 * 
		 * I decided 3 was the way to go because a) I don't want to be passing
		 * around boolean variables that should not need them, and b) I don't
		 * want to start over and create my own Modal window class.
		 */
		this._container.on('hide.bs.modal', function() {
			if(!that._isSubmit) {
				that.notify('close');
			}
			that._isSubmit = false;
		});
		this._container.find('.btn-primary').on('click', function() {
			that.notify('submit');
		});
	}
};
$.extend(kks.ElementEditorDialog.prototype, kks.observable);
//============================================================================
//============================================================================
//============================================================================
/**
 * 
 */
kks.ElementEditorDialogController = function(view) {
	this._view = view;
	this._view.observe('submit', _.bind(this.submit, this));
	this._view.observe('close', _.bind(this.close, this));
};
kks.ElementEditorDialogController.prototype = {
	show : function(config, callback) {
		this._callback = callback;
		this._view.setConfiguration(config);
		this._view.show();
	},
	close : function() {
		this._callback(null);
	},
	submit : function() {
		this._view.close();
		var obj = this._view.marshal();
		this._callback(obj);
	}
};
/**
 * Factory method for the ElementEditor dialog.
 */
kks.ElementEditorDialogController.create = function() {
	var view = new kks.ElementEditorDialog($('#formelementeditor'));
	var controller = new kks.ElementEditorDialogController(view);
	return controller;
};
//============================================================================
//============================================================================
//============================================================================
/**
 * Proxy pattern for the ElementEditor dialog. Don't instantiate the dialog
 * until it's actually needed.
 */
kks.ElementEditorProxy = function() {
	this._component = null;
	
	kks.pageController.observe('openEditorDialog', _.bind(this.show, this));
};
kks.ElementEditorProxy.prototype.show = function(config, callback) {
	if(!this._component) {
		this._component = kks.ElementEditorDialogController.create();
	}
	this._component.show(config, callback);
};
kks.ElementEditorProxy.create = function() {
	new kks.ElementEditorProxy();
};