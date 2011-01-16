document.observe('dom:loaded', function() {
  setTimeout(hideFlashes, 25000);
});

var hideFlashes = function() {
  $$('.flash .notice', '.flash .warning', '.flash .error').each(function(e) {
    if (e) Effect.Fade(e, { duration: 1.5 });
  })
}
