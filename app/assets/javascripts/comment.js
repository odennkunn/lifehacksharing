$(function(){
  function buildHTML(comment){
    var html = `<div class = 'main__comment__user'>
                  <div class = 'main__comment__user__name'>
                    <span><a href=/users/${comment.user_id}>${comment.user_name}</a><span>
                  </div>
                  <div class = 'main__comment__user__image'>
                  </div>
                  <div class = 'main__comment__user__text'>
                    <span>${comment.text}</span>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')  //フォームの送信先のurlを定義
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,    //dataに指定したオブジェクトをクエリ文字列に変換
      contentType: false     //サーバにデータのファイル形式を伝える
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.main__comment').append(html);
      $('.comment-form').val('');
      $('.comment-send').prop('disabled', false);    //ボタンが押せなくなる属性(disabled)をfalseに
    })
    .fail(function(){
      alert('error');
    })
  })
})