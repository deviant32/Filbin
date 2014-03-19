/**
 * 
 */
kks.FormElementBase = function(container, options) {
	this.dom = container;
	this._options = options;
};
kks.FormElementBase.prototype = {
	constructor : kks.FormElementBase,
	setText : function(text) {
		
	},
	getValue : function() {
		
	},
	setValue : function(val) {
		
	},
	remove : function() {
		this.dom.remove();
	},
	toJson : function() {
		return {
			'value' : this.dom.find('input').val().trim(),
			'label' : this.dom.find('label').text().trim(),
			'name'  : this.dom.find('input').attr('name').trim(),
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
	return {
		'value' : this.dom.find('textarea').val().trim(),
		'label' : this.dom.find('label').text().trim(),
		'name'  : this.dom.find('textarea').attr('name').trim(),
		'type'  : this._type
	};
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
	var ret = {
		'label'   : this.dom.find('label').text().trim(),
		'name'    : this.dom.find('input').first().attr('name').trim(),
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
	var ret = {
		'label' : this.dom.find('.label').text().trim(),
		'name'  : '',
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
	var ret = {
		'label' : this.dom.find('.label').text().trim(),
		'name' : '',
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
kks.FormElementBase.getElementConfig = function(type) {
	return kks.FormElementBase.config[type];
};
kks.FormElementBase.config = {
	'inputbox' : {
		'obj' : 'kks.InputBox',
		'value' : '',
		'name' : '{replace}',
		'label' : '{replace}',
		'needOptions' : false,
		'title' : 'Input Box'
	},
	'textarea' : {
		'obj' : 'kks.TextArea',
		'value' : '',
		'name' : '{replace}',
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
		'name' : '{replace}',
		'label' : '{replace}',
		'needOptions' : false,
		'title' : 'Checkbox'
	}
};