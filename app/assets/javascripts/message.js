$(document).on('turbolinks:load', function(){
  function buildHTML(message) {
    if (message.image) {
      var image = `<img src= ${ message.image } >`
    } else {
      var image = ''
    };

    var html = `<ul class="content__right--body--chat"><li class="content__right--body--chat--one"><h3 class="username"> ${ message.name } </h3> <p class="date"> ${ message.created_at } </p> <p class="message"> ${ message.text } </p> ${ image } </li> </ul>`
    return html;
  };

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var formdata = new FormData($('.js-form').get(0))
    $.ajax({
      type:        'POST',
      url:         location.href,
      data:        formdata,
      dataType:    'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.content__right--body').append(html);
      $('#message_text').val("");
      $('#message_image').val("");
      $('input').prop('disabled', false);
    })
    .fail(function() {
      alert(' メッセージが入力されていません');
      $('input').prop('disabled', false);
    });
  });
});
