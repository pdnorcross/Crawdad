< 0) {
		} else {
			$navigation.find('li:eq('+$index+') a').tab('show');
		}
	};

	this.first = function(e) {
		if($settings.onFirst && typeof $settings.onFirst === 'function' && $settings.onFirst($activeTab, $navigation, obj.firstIndex())===false){
			return false;
		}

		// If the element is disabled then we won't do anything
		if(element.hasClass('disabled')) {
			return false;
		}
		$navigation.find('li:eq(0) a').tab('show');

	};
	this.last = function(e) {
		if($settings.onLast && typeof $settings.onLast === 'function' && $settings.onLast($activeTab, $navigation, obj.lastIndex())===false){
			return false;
		}

		// If the element is disabled then we won't do anything
		if(element.hasClass('disabled')) {
			return false;
		}
		$navigation.find('li:eq('+obj.navigationLength()+') a').tab('show');
	};
	this.currentIndex = function() {
		return $navigation.find('li').index($activeTab);
	};
	this.firstIndex = function() {
		return 0;
	};
	this.lastIndex = function() {
		return obj.navigationLength();
	};
	this.getIndex = function(e) {
		return $navigation.find('li').index(e);
	};
	this.nextIndex = function() {
		return $navigation.find('li').index($activeTab) + 1;
	};
	this.previousIndex = function() {
		return $navigation.find('li').index($activeTab) - 1;
	};
	this.navigationLength = function() {
		return $navigation.find('li').length - 1;
	};
	this.activeTab = function() {
		return $activeTab;
	};
	this.nextTab = function() {
		return $navigation.find('li:eq('+(obj.currentIndex()+1)+')').length ? $navigation.find('li:eq('+(obj.currentIndex()+1)+')') : null;
	};
	this.previousTab = function() {
		if(obj.currentIndex() <= 0) {
			return null;
		}
		return $navigation.find('li:eq('+parseInt(obj.currentIndex()-1)+')');
	};
	this.show = function(index) {
		return element.find('li:eq(' + index + ') a').tab('show');
	};
	this.disable = function(index) {
		$navigation.find('li:eq('+index+')').addClass('disabled');
	};
	this.enable = function(index) {
		$navigation.find('li:eq('+index+')').removeClass('disabled');
	};
	this.hide = function(index) {
		$navigation.find('li:eq('+index+')').hide();
	};
	this.display = function(index) {
		$navigation.find('li:eq('+index+')').show();
	};
	this.remove = function(args) {
		var $index = args[0];
		var $removeTabPane = typeof args[1] != 'undefined' ? args[1] : false;
		var $item = $navigation.find('li:eq('+$index+')');

		// Remove the tab pane first if needed
		if($removeTabPane) {
			var $href = $item.find('a').attr('href');
			$($href).remove();
		}

		// Remove menu item
		$item.remove();
	};

	$navigation = element.find('ul:first', element);
	$activeTab = $navigation.find('li.active', element);

	if(!$navigation.hasClass($settings.tabClass)) {
		$navigation.addClass($settings.tabClass);
	}

	// Load onInit
	if($settings.onInit && typeof $settings.onInit === 'function'){
		$settings.onInit($activeTab, $navigation, 0);
	}

	// Load onShow
	if($settings.onShow && typeof $settings.onShow === 'function'){
		$settings.onShow($activeTab, $navigation, obj.nextIndex());
	}

	// Work the next/previous buttons
	obj.fixNavigationButtons();

	$('a[data-toggle="tab"]', $navigation).on('click', function (e) {
		// Get the index of the clicked tab
		var clickedIndex = $navigation.find('li').index($(e.currentTarget).parent('li'));
		if($settings.onTabClick && typeof $settings.onTabClick === 'function' && $settings.onTabClick($activeTab, $navigation, obj.currentIndex(), clickedIndex)===false){
			return false;
		}
	});

	$('a[data-toggle="tab"]', $navigation).on('shown', function (e) {  // use shown instead of show to help prevent double firing
		$element = $(e.target).parent();
		var nextTab = $navigation.find('li').index($element);

		// If it's disabled then do not change
		if($element.hasClass('disabled')) {
			return false;
		}

		if($settings.onTabChange && typeof $settings.onTabChange === 'function' && $settings.onTabChange($activeTab, $navigation, obj.currentIndex(), nextTab)===false){
				return false;
		}

		$activeTab = $element; // activated tab
		obj.fixNavigationButtons();
	});
};
$.fn.bootstrapWizard = function(options) {
	//expose methods
	if (typeof options == 'string') {
		var args = Array.prototype.slice.call(arguments, 1)
		if(args.length === 1) {
			args.toString();
		}
		return this.data('bootstrapWizard')[options](args);
	}
	return this.each(function(index){
		var element = $(this);
		// Return early if this element already has a plugin instance
		if (element.data('bootstrapWizard')) return;
		// pass options to plugin constructor
		var wizard = new bootstrapWizardCreate(element, options);
		// Store plugin object in this element's data
		element.data('bootstrapWizard', wizard);
	});
};

// expose options
$.fn.bootstrapWizard.defaults = {
	tabClass:         'nav nav-pills',
	nextSelector:     '.wizard li.next',
	previousSelector: '.wizard li.previous',
	firstSelector:    '.wizard li.first',
	lastSelector:     '.wizard li.last',
	onShow:           null,
	onInit:           null,
	onNext:           null,
	onPrevious:       null,
	onLast:           null,
	onFirst:          null,
	onTabChange:      null, 
	onTabClick:       null,
	onTabShow:        null
};

})(jQuery);