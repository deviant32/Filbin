//from Test Driven JavaScript Development; tdd.js
if (!Function.prototype.inherit) {
  (function () {
    function F() {}
    Function.prototype.inherit = function (superFn){
        F.prototype = superFn.prototype;
        this.prototype = new F();
        this.prototype.constructor = this;
        this.prototype._super = superFn.prototype;
    };
  }());
}


if (!Function.prototype.bind) {
  (function () {
    var slice = Array.prototype.slice;
    Function.prototype.bind = function (thisObj) {
      var target = this;
      if (arguments.length > 1) {
        var args = slice.call(arguments, 1);
        return function () {
          var allArgs = args;
          if (arguments.length > 0) {
            allArgs = args.concat(slice.call(arguments));
          }
          return target.apply(thisObj, allArgs);
        };
      }
      return function () {
        if (arguments.length > 0) {
          return target.apply(thisObj, arguments);
        }
        return target.call(thisObj);
      };
    };
  }());
}

(function($) {
	$.fn.exists = function() {
		return this.length > 0;
	};
})(jQuery);