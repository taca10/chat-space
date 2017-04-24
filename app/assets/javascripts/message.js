$(function() {
  function buildHTML(message) {
    var html = `<ul class="content__right--body--chat"><li class="content__right--body--chat--one"><h3 class="username"> ${message.name} </h3> <p class="date"> ${message.created_at} </p> <p class="message"> ${message.text} </p> </li> </ul>`
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var message = $('#message_text').val();
    var formdata = new FormData($('.js-form').get(0))
    // fd.append('body', $('.form').val())
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
      $('#message_text').val("");
      $('input').prop('disabled', false);
    })
    .fail(function() {
      alert(' メッセージが入力されていません');
    });
      $('#message_text').prop('disabled', false);
  });
});
