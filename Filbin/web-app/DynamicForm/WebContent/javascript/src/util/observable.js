(function() {
	function _observers(observable, event) {
		if (!observable.observers) {
			observable.observers = {};
		}
		if (!observable.observers[event]) {
			observable.observers[event] = [];
		}
		return observable.observers[event];
	}
	function observe(event, observer, context) {
		if (typeof observer != "function"
				&& (typeof context != "object" && typeof observer != "string")) {
			throw new TypeError("observer is not function");
		}
		var observer = typeof observer === 'function' ? observer : context[observer];
		var context = (context) ? context : this;

		_observers(this, event).push({
			fn : observer,
			c : context
		});
	}
	function notify(event) {
		var observers = _observers(this, event);
		var args = Array.prototype.slice.call(arguments, 1);

		for (var i = 0, l = observers.length; i < l; i++) {
			try {
				observers[i].fn.apply(observers[i].c, args);
			} catch (e) {}
		}
	}
	kks.observable = {
		observe : observe,
		notify : notify
	};
}());