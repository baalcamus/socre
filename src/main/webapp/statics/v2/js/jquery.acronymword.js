(function($) {
	/**
	 * 隐藏selector.text()内容，当鼠标滑过时显示内容<br>
	 * params:<br>
	 * delay 鼠标滑出后经过 delay 毫秒后隐藏 default 1000<br>
	 * len 超过长度len后缩略 default 20<br>
	 * acronymChar 替代缩略后的字符 default '...'<br>
	 * eg:<br>
	 * $(this).AcronymWord({delay:1000,acronymChar:'...',len:15});<br>
	 */
	$.fn.AcronymWord = function(options) {
		var selector = this;

		var settings = $.extend({
			len : 20,
			delay : 1000,
			acronymChar : '...'
		}, options);
		var len = settings.len;
		var delay = settings.delay;
		var acronymChar = settings.acronymChar;

		if (selector.children().length == 0) {
			var text = $.trim(selector.text());
			if (text.length > len) {
				var hidtText = text.substring(0, len) + acronymChar;
				selector.text(hidtText);
//				selector.mouseover(function() {
//					selector.text(text);
//				});
//				selector.mouseout(function() {
//					setTimeout(function() {
//						selector.text(hidtText);
//					}, delay);
//				});
				var out;
				selector.mouseenter(function() {
					clearTimeout(out);
					selector.text(text);
				});
				selector.mouseleave(function() {
					out = setTimeout(function() {
						selector.text(hidtText);
					}, delay);
				});
			}
		}
		return selector;
	}
})(jQuery);