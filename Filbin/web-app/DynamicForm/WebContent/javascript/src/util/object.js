
if (!Object.create) {
  (function () {
    function F() {}

    Object.create = function (object) {
      F.prototype = object;
      return new F();
    };
  }());
}

Object.containsKey = function(hash, val){
    for(var each in hash){
        if(each === val){
            return true;
        }
    }
    return false;
};
/**
 *
 * @param {Object) hash
 * @returns the number of elements in the hash
 */
Object.size = function(hash){
    var arr = Object.toArray(hash);
    return arr.length;
};
/**
 * Return an array of the attribute names in a hash
 * @param {Object} object | hash object
 */
if (!Object.keys) {
    Object.keys = function (object) {
        var arr = [];
        for(var each in object){
            arr.push(each);
        }
        return arr;
    };
}
/**
 * Iterate over a hash and
 * apply a function (callback) to each attribute in an Object
 * @param {Object or Function?} object |
 * @param {Function} callback |
 */
Object.each = function(object, callback/*, thisp*/){
    var thisp = arguments[2];
    for(var prop in object){
        callback.call(thisp, prop, object[prop]);
    };
};
/**
 * Merge source object into target object.
 * Any attributes in common are overidden into target
 * @param {Object} target |
 * @param {Object} source |
 * @usage for copy: newobj = Object.extend({}, orginialobject)
 */
Object.extend = function(target/*, source...*/) {
    var i = 1,
        length = arguments.length,
        options;
    target = target || {};

    if (length == i) {
        return target;
    }
    for( ; i < length; i++){
        if( ( options = arguments[i]) != null){
            isrve.each(options, function (prop, val) {
              target[prop] = val;
            });
        }
    }
    return target;
};
/**
 * Convert a hash of objects to a sorted array of objects based on
 * an object attribute's value.
 * This is important when order of the objects is important because the order
 * of the objects in the hash is not reliable between browsers.
 *
 * @param {Object} hash | hash of objects to be sorted on some attribute
 * @param {Function} fn | function used by Array.sort
 *                        This is where the attributed used for sorting is
 *                        identified.
 *                        example:
 *                           function(a,b){
 *                               if(a.tabOrder < b.tabOrder) return -1;
 *                               else return 1;
 *                           }
 * @return {Array}  array of the original objects from the hash, in sorted
 *                  order based on the sorting function.
 */
Object.sortHash = function(hash, fn){
    var ordered = [];
    for(var item in hash){
        hash[item].hashName = item;
        ordered.push(hash[item]);
    }
    ordered.sort(fn);
    return ordered;
};

Object.isArray = function(obj){
    return Object.prototype.toString.call(obj) == "[object Array]";
};

/**
 * Convert a hash of objects to an unsorted array of objects
 *
 * @param {Object} hash | hash of objects to be sorted on some attribute
 * @return {Array}  array of the original objects from the hash,
 */
Object.toArray = function(hash){
    var output = [];
    for(var item in hash){
        hash[item].hashName = item;
        output.push(hash[item]);
    }
    return output;
};