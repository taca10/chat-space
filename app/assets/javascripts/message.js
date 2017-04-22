$(function() {
  function buildHTML(message) {
    var html = $('<ul class="content__right--body--chat">').append('<li class="content__right--body--chat--one"> </li>').append('<h3 class="date"> </h3>').append('<p class="date"> </p>').append('<p class="message"> </p>');
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var message = textField.val();

    // var fd = new FormData($('.js_form').get(0))
    // fd.append('body', $('.form').val())
    $.ajax({
      type: 'POST',
      url: location.href
      data: {
        message: {
          text: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.content__right--body').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
