/**
 * Build a new array by removing tested items from array.
 * @param {} fun | callback function for test
 * @param {reference optional} thissp | context; window if missing?
 */
if (!Array.prototype.filter){
  Array.prototype.filter = function(fun /*, thisp*/){
    //var scope = thisObj || window;
    var len = this.length;
    if (typeof fun != "function") return [];

    var res = [];
    var thisp = arguments[1];
    for (var i = 0; i < len; i++){
      if (i in this){
        var val = this[i]; // in case fun mutates this
        if (fun.call(thisp, val, i, this))
          res.push(val);
      }
    }
    return res;
  };
}

/**
 * @param {} fun | function to apply to each element
 * @param {reference optional} scope | context; window if missing
 */
if (!Array.prototype.forEach){
  Array.prototype.forEach = function(fun, scope){
    if (typeof fun != "function") return [];
    for(var k = 0, len = this.length; k < len; k++){
        if(k in this)
            fun.call(scope, this[k], k, this);
    }
  };
}
/**
 * Filter rows of an array based on a filter structure.
 * Applies alphanumeric comparisons
 * Dates must be converted externally, e.g., new Date('01/02/2010').valueOf()
 * @param {Array} filter | array of objects, one for each filter item
 *       var val = {};
 *       val.val0 = {name: , value: , logical: , compare: '__eq__'};
 *       val.val1 = {name: , value: , logical: , compare: '__eq__'};
 *
 *       where name = filter field name
 *             value = value of field to filter for
 *             logical = operation between one field and the next (and, or, not[to be done])
 *             compare = how to compare the field value to the search value (eq, ne, etc)
 *
 *       var filter = [val.val0, val.val1];
 */
Array.prototype.compoundFilter = function(filter){
    for(var i = 0; i < filter.length; i++){
        filter[i].allOption = (filter[i].value == '' || filter[i].value == '*');
        //satisfy the comparison needs for an 'all' comparison of two values
        filter[i].logical = (filter[i].allOption) ? '__and__' : filter[i].logical;
    }
    var out = [], t1, t2;
    return this.filter(function(val, i, that){
        t1 = that.compoundFilter.tests[filter[0].compare](val[filter[0].name], filter[0].value) || filter[0].allOption;
        if(!t1) return false; //early exit if false
        for(var k = 1; k < filter.length; k++){
            t2 = that.compoundFilter.tests[filter[k].compare](val[filter[k].name], filter[k].value) || filter[k].allOption;
            t1 = that.compoundFilter.tests[filter[k].logical](t1, t2);
            if(!t1) return false; //early exit if false
        }
        return t1;
    });
};
/*  potential enhancement to distinquish data types for filtering
Array.prototype.compoundFilter.dataTypes = {
    date : function(a){
        return new Date(a).valueOf();
    }
}*/
Array.prototype.compoundFilter.tests = {//a = the data value; b = the filter value
      __eq__ : function(a, b){return a == b;},
      __gt__ : function(a, b){return a > b;},
      __lt__ : function(a, b){return a < b;},
      __and__ : function(a, b){return a && b;},
      __or__ : function(a, b){return a || b;},
      __ge__ : function(a, b){return a >= b;},
      __le__ : function(a, b){return a <= b;},
      __li__ : function(a, b){return true;}, //like operation, wildcards, complex function
      __co__ : function(a, b){return a.indexOf(b) > -1;},  //substring operation, a contains b
      __gtt__:function(a, b){return a >= b;},
      __ltt__:function(a, b){return a <= b;}
};
/**
 * Eliminate duplicate scalar values in an array
 * @returns {Array} the new array
 */
Array.prototype.unique = function(){
    return this.filter(function(v, i, arr){return (arr.indexOf(v) === i);});
};

// Compute the intersection of n arrays with a custom compare
// Example function: function(a1, a2){return (a1 === a2);}
Array.prototype.intersect = function() {
    if (!(arguments.length > 1 )) return [];
    if (typeof arguments[0] != 'function') return [];
    var comp = arguments[0],
        a1 = this,
        a = null,
        a2 = null,
        n = 1;
    while(n < arguments.length) {
        a = [];
        a2 = arguments[n];
        var l = a1.length;
        var l2 = a2.length;
        for(var i=0; i<l; i++) {
            for(var j=0; j<l2; j++) {
                if (comp(a1[i], a2[j]))
                    a.push(a1[i]);
            }
        }
        a1 = a;
        n++;
    }
    return a.unique();
};

/** Compute the complement of an array by either
 *  a compare function or
 *  simple item comparison
 *  Complement is what is not in current array but is in array argument
 *  Example function: function(a1, a2){return (a1 === a2);}
 * return array of indexes or objects?
 */
Array.prototype.complement = function() {
    var complement = [],
        found = false,
        arr;
    if (typeof arguments[0] == 'function'){//compare function and array passed
        var comp = arguments[0];
        arr = arguments[1];
        for(var k = 0; k < arr.length; k++){
            found = false;
            for(var i = 0; i < this.length; i++){
                if(comp(this[i], arr[k])){
                    found = true;
                    break;
                }
            }
            if(!found) complement.push(arr[k]);
        }
    }else{//simple array passed
        arr = arguments[0];
        for(var k = 0; k < arr.length; k++){
            found = false;
            for(var i = 0; i < this.length; i++){
                if(this[i] == arr[k]){
                    found = true;
                    break;
                }
            }
            if(!found){
                complement.push(arr[k]); //value of field not found
            }
        }
    }
    return complement;
};

// Add indexOf function if browser does not support it
if(!Array.indexOf) {
Array.prototype.indexOf = function(item,from){
    if(!from)
        from = 0;
    for(var i=from; i<this.length; i++) {
        if(this[i] === item)
            return i;
    }
    return -1;
};}

Array.prototype.findIndex = function(func, value){
    //can't use forEach; need early exit.
    for(var t=0; t < this.length; t++)
        if(func(this[t], value)) return t;
    return -1;
};

//TODO change this to accept function instead of field
// this would be much more flexible
//  uses in daterange.js, hierarchic.selection.js, tablesort.js, restorequest.js
// Find an entry in a given field of the members of an array
Array.prototype.indexByField = function(field,value){
    for(var t=0; t<this.length; t++) {
        if(this[t][field] == value)
            return t;
    }
    //TODO changing return value; was null used any where?
    //  null is poor because index == 0 is false
    //return null;
    return -1;
};

// Return whether an entry exists in an array
Array.prototype.contains = function(item){
    return this.indexOf(item) != -1;
};
// Copy an array
Array.prototype.copy =
  function() {
    //return this.slice(); should work too
    return this.concat();
  };

// Return elements which are in A but not in arg0 through argn
Array.prototype.diff = function() {
    var a1 = this;
    var a = a2 = null;
    var n = 0;
    while(n < arguments.length) {
      a = [];
      a2 = arguments[n];
      var l = a1.length;
      var l2 = a2.length;
      var diff = true;
      for(var i=0; i<l; i++) {
        for(var j=0; j<l2; j++) {
          if (a1[i] === a2[j]) {
            diff = false;
            break;
          }
        }
        diff ? a.push(a1[i]) : diff = true;
      }
      a1 = a;
      n++;
    }
    return a.unique();
  };
// Adds, removes or toggles a particular value within an array
//  value - value to add
//  mode - +1 to add value, -1 to remove value, 0 to toggle it
Array.prototype.setItem = function(value,mode){
    var p = this.indexOf(value);
    if(mode == 0)
        mode = (p == -1) ? +1 : -1;
    if(mode == +1) {
        if(p == -1)
            this.push(value);
    } else if(mode == -1) {
        if(p != -1)
            this.splice(p,1);
    }
};

//Return whether one of a list of values exists in an array
Array.prototype.containsAny = function(items){
    for(var i=0; i<items.length; i++) {
        if(this.indexOf(items[i]) != -1)
            return true;
    }
    return false;
};

// Return whether all of a list of values exists in an array
Array.prototype.containsAll = function(items){
    for(var i = 0; i<items.length; i++) {
        if(this.indexOf(items[i]) == -1)
            return false;
    }
    return true;
};
/**
 *
 * from MDN
 * not available before IE8
 * @return {Boolean} true = present; false = not present
 */
if (!Array.prototype.some) {
    Array.prototype.some = function(fun /*, thisp */) {
      'use strict';

      if (this == null) {
        throw new TypeError();
      }
      var thisp, i,
          t = Object(this),
          len = t.length >>> 0;
      if (typeof fun !== 'function') {
        throw new TypeError();
      }
      thisp = arguments[1];
      for (i = 0; i < len; i++) {
        if (i in t && fun.call(thisp, t[i], i, t)) {
          return true;
        }
      }
      return false;
    };
}

/**
 * Push a new value into an array only if it is not already present in the array.
 * If the optional unique parameter is false, it reverts to a normal push
 */

Array.prototype.pushUnique = function(item,unique)
{
    if(unique === false) {
        this.push(item);
    } else {
        if(this.indexOf(item) == -1)
            this.push(item);
    }
};

Array.prototype.remove = function(item)
{
    var p = this.indexOf(item);
    if(p != -1)
        this.splice(p,1);
};

/**
 * Removes an item from an array based on the function passed
 * @param {Function} fn | Test case function.
 * @param {} val | Value to test for.
 * @usage
 *      var fn = function(item, val) {
 *          return item.key === val;
 *      };
 *      [].removeSpecial(fn, valueToRemove);
 */
Array.prototype.removeSpecial = function(fn, val) {
    for(var i = 0; i < this.length; i++) {
        if(fn(this[i], val)) {
            var v = this[i];
            this.splice(i, 1);
            return v;
        }
    }
    return -1;
};

if(!Array.prototype.map) {
    Array.prototype.map = function(fn, thisObj){
        var scope = thisObj || window;
        var a = [];
        for(var i=0, j = this.length; i < j; ++i) {
            a.push(fn.call(scope, this[i], i, this));
        }
        return a;
    };
}

/**
* Call the functions in this array; yield between each
* Execute them in sequence.
*
* @param {Array} args | arguments to pass to the functions
*                       required arg but may be empty
* @param {Function} callback | the last function to call when done
*/
Array.prototype.step = function(args, callback){
  var tasks = this.concat();
  setTimeout(function timer(){
      var task = tasks.shift();
      task.apply(null, args || []);
      if (tasks.length > 0){
          setTimeout(timer, 25);
      } else {
          callback();
      }
  }, 25);
};
/**
 * Insert yields into the long processing of an array.
 * From 'How to Process Large Volumnes of Data in JavaScript'
 * By Craig Buckler
 * TODO needs work
 */
Array.prototype.processArray = function(data, handler, callback){
//function ProcessArray(data, handler, callback) {
    var maxtime = 100;      // chunk processing time
    var delay = 2;         // delay between processes
    var queue = data.concat();  // clone original array
//callee is deprecated--change to named function
    setTimeout(function() {
      var endtime = + new Date() + maxtime;
      do {
          handler(queue.shift());
      } while (queue.length > 0 );//&& endtime > + new Date());

      if (queue.length > 0) {
        //callee is deprecated--change to named function
        setTimeout(arguments.callee, delay);
      }
      else {
        if (callback) callback();
      }
    }, delay);
};
//Array.prototype.uniqueObject = function() {
//    var a = [];
//    var l = this.length;
//
//    for(var i = 0; i < this.length; i++) {
//        var isDup = false;
//        for(var j = 0; j < a.length; j++) {
//            isDup = (this[i].filterId == a[j].filterId) &&
//                    (this[i].shareCode == a[j].shareCode);
//            if(isDup) break;
//        }
//        if(!isDup) a.push(this[i]);
//    }
//    return a;
//};

//Array.prototype.pushUniqueObjectByKey = function(obj,key,unique)
//{
//    if(unique === false) {
//        this.push(obj);
//    } else {
//        for(var i = 0; i < this.length; i++) {
//            if(this[i][key] === obj[key]) {
//                return;
//            }
//        }
//        this.push(obj);
//    }
//};

//array static iterator
Array.iterator = function (array) {
   var index = 0;
   return function() {
       return array[index++];
   };
};
/*John Resig?*/
/**
 *
 * John Resig
 * http://ejohn.org/blog/javascript-array-remove/
 */
Array.prototype.remove = function(from, to) {
    var rest = this.slice((to || from) + 1 || this.length);
    this.length = from < 0 ? this.length + from : from;
    return this.push.apply(this, rest);
};

/**
 * Tests whether all elements in the array pass the test
 * implemented by the provided function.
 * MDN
 */
if (!Array.prototype.every) {
    Array.prototype.every = function(fun /*, thisp */) {
        'use strict';
        var t, len, i, thisp;

        if (this == null) {
          throw new TypeError();
        }

        t = Object(this);
        len = t.length >>> 0;
        if (typeof fun !== 'function') {
            throw new TypeError();
        }

        thisp = arguments[1];
        for (i = 0; i < len; i++) {
          if (i in t && !fun.call(thisp, t[i], i, t)) {
            return false;
          }
        }

        return true;
    };
}