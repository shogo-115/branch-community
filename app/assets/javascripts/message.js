$(function(){
  function buildHTML(message){
    let html =
      `<div class="messageContents">
        <div class="messageContents__rightMessage">
          ${message.content}
        </div>
        <div class="messageContents__rightMessageDate">
          ${message.created_at}
        </div>
      </div>`
      return html;
  }

  $('.new_message').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.chatContents__field').append(html);
      $('.chatContents__field').animate({ scrollTop: $('.chatContents__field')[0].scrollHeight});
      $('form')[0].reset();
    })
    .fail(function() {
      alert("メッセージを100文字以内で入力してください");
    })
    .always(function(){
      $('.actionField__text').prop('disabled', false);
    })
  });
});