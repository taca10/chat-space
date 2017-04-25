$(function() {
  function buildHTML(message) {
    var html = `<ul class="content__right--body--chat"><li class="content__right--body--chat--one"><h3 class="username"> ${message.name} </h3> <p class="date"> ${message.created_at} </p> <p class="message"> ${message.text} </p> </li> </ul>`
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var message = $('#form__text-field').val();
    var formdata = new FormData($('.js-form').get(0))
    $.ajax({
      type: 'POST',
      url: location.href,
      data: formdata,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.content__right--body').append(html);
      $('form__text-field').val("");
      $('input').prop('disabled', false);
    })
    .fail(function() {
      alert(' メッセージが入力されていません');
      $('input').prop('disabled', false);
    });
  });
});
