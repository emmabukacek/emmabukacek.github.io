var EBApp = (function() {
  var displayClass = 'show'
  var hideClass = 'hide'
  var socialMediaWrap = document.getElementById("social-media");

  var updateDescriptionClass = function(classMethod, event, callback) {
    var item = event.target.dataset.show;
    if (!item) { return; }

    document
      .querySelector('[data-item=' + item + ']')
      .classList[classMethod](displayClass);

    callback(item);
  }

  socialMediaWrap.addEventListener('mouseover', function(event) {
    updateDescriptionClass('add', event, function(item) {
      document
        .querySelector('[data-item=default]')
        .classList.remove(displayClass);

      document.body.className = item + '-bg';
    });
  });

  socialMediaWrap.addEventListener('mouseout', function(event) {
    updateDescriptionClass('remove', event, function() {
      document
        .querySelector('[data-item=default]')
        .classList.add(displayClass);

      document.body.className = '';
    });
  });

})();
