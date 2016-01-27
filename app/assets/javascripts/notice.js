(function ($, window, document) {
  var hideNotice = function(e) {
    $(this).hide();
  }
  $(function(){
    $('.notice').on('click', hideNotice);
  });

})(window.jQuery, window, document);
