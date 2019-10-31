(function ($, window, document) {
  'use strict';
  var hideNotice = function(e) {
    $(this).hide();
  }
  $(function(){
    $('.notice').on('click tap', hideNotice);
  });

})(window.jQuery, window, document);
