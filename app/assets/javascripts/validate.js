// $(function(){
//   $('.button').on('click', function(){
//     if($('#user_nickname').val() === ''){
//       $('#user_nickname').css("background","pink")
//       alert('名前を入力してください！');
//       $('#user_nickname').focus();
//       return false;
//     }
//     alert('送信完了！');
//   });
// });

$(function(){
  $('.button').on('click', function(){
    let isEmpty = false;
    jQuery('#user_nickname, #user_email, #user_password, #user_password_confirmation').each(function(){
      if(jQuery(this).val() === ''){
        alert('必須項目が入力されていません！');
        $('#user_nickname, #user_email, #user_password, #user_password_confirmation').css({"height":"100px","width":"300px", "background":"pink" ,"border":"solid 2px red"})
        $(this).focus();
        isEmpty = true;
        return false;
      }
    });
    if(isEmpty)
      return false;
    else
      alert('送信完了！');
  });
});