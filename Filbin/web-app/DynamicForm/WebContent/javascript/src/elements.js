/**
 * 
 */
kks.FormElementBase = function(container, options) {
	this.dom = container;
	this._options = options;
};
kks.FormElementBase.prototype = {
	constructor : kks.FormElementBase,
	update : function(o) {
		if(o.label) {
			this.dom.find('label').text(o.label);
		}
		if(o.value) {
			this.dom.find('input').val(o.value);
		}
	},
	remove : function() {
		this.dom.remove();
	},
	toJson : function() {
		var label = this.dom.find('label').text().trim();
		return {
			'value' : this.dom.find('input').val().trim(),
			'label' : label,
			'name'  : label,
			'type'  : this._type
		};
	}
};
/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.InputBox = function(container, options) {
	this._super.constructor.apply(this, arguments);
	this._type = 'inputbox';
};
kks.InputBox.inherit(kks.FormElementBase);
/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.TextArea = function(container, options) {
	this._super.constructor.apply(this, arguments);
	this._type = 'textarea';
};
kks.TextArea.inherit(kks.FormElementBase);

kks.TextArea.prototype.toJson = function() {
	var label = this.dom.find('label').text().trim();
	return {
		'value' : this.dom.find('textarea').val().trim(),
		'label' : label,
		'name'  : label,
		'type'  : this._type
	};
};
kks.TextArea.prototype.update = function(o) {
	if(o.label) {
		this.dom.find('label').text(o.label);
	}
	if(o.value) {
		this.dom.find('textarea').val(o.value);
	}
};
/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.RadioGroup = function(container, options) {
	this._super.constructor.apply(this, arguments);
	this._type = 'radiogroup';
};
kks.RadioGroup.inherit(kks.FormElementBase);

kks.RadioGroup.prototype.toJson = function() {
	var label = this.dom.find('label').text().trim();
	var ret = {
		'label'   : label,
		'name'    : label,
		'fieldOptions' : [],
		'type'    : this._type
	};
	this.dom.find('input').each(function() {
		ret.fieldOptions.push({
			'optionValue' : $(this).val().trim(),
			'optionLabel' : $(this).next('.label').text().trim()
		});
	});
	return ret;
};
kks.RadioGroup.prototype.update = function(o) {
	if(o.label) {
		this.dom.find('label').text(o.label);
	}
	if(o.fieldOptions) {
		var opts = o.fieldOptions,
			i = 0,
			len = opts.length;
		for(; i < len; i++) {
			var radio = this.dom.find('.radio').eq(i);
			radio.find('input').val(opts[i].optionValue);
			radio.find('.label').text(opts[i].optionLabel);
		}
	}
};
/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.DropDownSelect = function(container, options) {
	this._super.constructor.apply(this, arguments);
	this._type = 'dropdown';
};
kks.DropDownSelect.inherit(kks.FormElementBase);

kks.DropDownSelect.prototype.toJson = function() {
	var label = this.dom.find('label').text().trim();
	var ret = {
		'label' : label,
		'name'  : label,
		'fieldOptions' : [],
		'type' : this._type
	};
	this.dom.find('select').children().each(function() {
		ret.fieldOptions.push({
			'optionValue' : $(this).val().trim(),
			'optionLabel' : $(this).text().trim()
		});
	});
	return ret;
};
kks.DropDownSelect.prototype.update = function(o) {
	if(o.label) {
		this.dom.find('label').text(o.label);
	}
	if(o.fieldOptions) {
		var opts = o.fieldOptions,
			i = 0,
			len = opts.length;
		for(; i < len; i++) {
			this.dom.find('option').eq(i)
					.val(opts[i].optionValue)
					.text(opts[i].optionLabel);
		}
	}
};
/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.SelectList = function(container, options) {
	this._super.constructor.apply(this, arguments);
	this._type = 'selectlist';
};
kks.SelectList.inherit(kks.FormElementBase);

kks.SelectList.prototype.toJson = function() {
	var label = this.dom.find('label').text().trim();
	var ret = {
		'label' : label,
		'name'  : label,
		'fieldOptions' : [],
		'type' : this._type
	};
	this.dom.find('select').children().each(function() {
		ret.fieldOptions.push({
			'optionValue' : $(this).val().trim(),
			'optionLabel' : $(this).text().trim()
		});
	});
	return ret;
};
kks.SelectList.prototype.update = function(o) {
	if(o.label) {
		this.dom.find('label').text(o.label);
	}
	if(o.fieldOptions) {
		var opts = o.fieldOptions,
			i = 0,
			len = opts.length;
		for(; i < len; i++) {
			this.dom.find('option').eq(i)
					.val(opts[i].optionValue)
					.text(opts[i].optionLabel);
		}
	}
};
/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.CheckBox = function(container, options) {
	this._super.constructor.apply(this, arguments);
	this._type = 'checkbox';
};
kks.CheckBox.inherit(kks.FormElementBase);
/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.CalculatedField = function(container, options) {
	this._super.constructor.apply(this, arguments);
	this._type = 'calculatedfield';
};
kks.CalculatedField.inherit(kks.FormElementBase);

/**
 * ==========================================================================
 * 
 * ==========================================================================
 */
kks.FormElementBase.getElementConfig = function(type) {
	return kks.FormElementBase.config[type];
};
kks.FormElementBase.config = {
	'inputbox' : {
		'obj' : 'kks.InputBox',
		'value' : '',
		'name' : '',
		'label' : '{replace}',
		'needOptions' : false,
		'title' : 'Input Box'
	},
	'textarea' : {
		'obj' : 'kks.TextArea',
		'value' : '',
		'name' : '',
		'label' : '{replace}',
		'needOptions' : false,
		'title' : 'Text Area'
	},
	'radiogroup' : {
		'obj' : 'kks.RadioGroup',
		'value' : '',
		'name' : '',
		'label' : '{replace}',
		'needOptions' : true,
		'optionId' : 'aradio',
		'title' : 'Radio Group'
	},
	'dropdown' : {
		'obj' : 'kks.DropDownSelect',
		'value' : '',
		'name' : '',
		'label' : '{replace}',
		'needOptions' : true,
		'optionId' : 'anoption',
		'title' : 'Drop-Down Select list'
	},
	'selectlist' : {
		'obj' : 'kks.SelectList',
		'value' : '',
		'name' : '',
		'label' : '{replace}',
		'needOptions' : true,
		'optionId' : 'anoption',
		'title' : 'Multiple Select list'
	},
	'checkbox' : {
		'obj' : 'kks.CheckBox',
		'value' : '{replace}',
		'name' : '',
		'label' : '{replace}',
		'needOptions' : false,
		'title' : 'Checkbox'
	},
	'calculatedfield' : {
		'obj' : 'kks.CalculatedField',
		'value' : '',
		'name' : '',
		'label' : '{replace}',
		'needOptions' : false,
		'title' : 'Calculated Field (Price Per)'
	},
};