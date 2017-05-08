$(document).on('turbolinks:load', function(){
  $(function() {
    function buildHTML(user) {
       var html =  `<li class = "add-user clearfix">
                   <div class = "chat-group-user__name"> ${user.name}  </div>
                  <a id ="add_button"  data-user-name = "${ user.name }" data-user-id = "${user.id}" > 追加 </a>
                  </li>`
      return html
    };

     function AddUserHtml(id, name){
      var html =  `<li class = "remove-user clearfix">
                   <input type = "hidden" name = "group[user_ids][]" value = " ${ id } ">
                   <p class = "chat-group-user__name"> ${ name } </p>
                   <a id = "remove_button"> 削除 </a>
                   </li>`;

      return html;
    }


    $('#user-search-field').on("keyup", function(e) {
      input = $.trim($("#user-search-field").val());
      $(".add-user").remove();
      if (input.length !== 0) {
        $.ajax({
          type: 'GET',
          url: '/users/search',
          data: ("name=" + input),
          dataType: 'json',
        })
        .done(function(data){
          $.each(data, function(i, data){
            html = buildHTML(data);
            $('#list').append(html);

          });
        })
        .fail(function(json){
          alert("グループを作成してください。");
        });

        };
      });
      $(document).on('click', '#add_button', function(){
        var id = $(this).data('user-id');
        var name = $(this).data('user-name');
        var user = $(this).parent();
        $(user).remove();
        var new_html = AddUserHtml(id, name);
        $('#chat-group-users').append(new_html);
      });

      $(document).on('click','#remove_button',function(){
      $(this).parent().remove();
      });
  });
});
