document.addEventListener("turbolinks:load", function() {
  $('.button').click(function() {
    if ($("#user_nickname").val() == "" || $("#user_email").val() == ""|| $("#user_password").val() == ""|| $("#user_password_confirmation").val() == "") {
      alert('全項目入力してください');
      return false;
    }
    if ($("#user_password").val() != $("#user_password_confirmation").val()) {
      alert('ちがうで');
      return false;
    }
  })
})