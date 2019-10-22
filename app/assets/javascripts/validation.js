document.addEventListener("turbolinks:load", function() {
  $(document).on('click', '.to-step2-button', function() {
    if ($("#user_nickname").val() == "" ||
        $("#user_email").val() == ""||
        $("#user_password").val() == ""||
        $("#user_password_confirmation").val() == "")
      {
      alert('全部埋めるんやで');
      return false;
    } 
  })
  $(document).on('click', '.to-step2-button', function() {
    if ($("#user_password").val() != $("#user_password_confirmation").val()){
      alert('確認パスワードがちゃうで');
      return false;
    }
  })
  $(document).on('click', '.to-step3-button', function() {
    if (!$("#user_phone_number").val().match(/^\d{10}$|^\d{11}$/)){
      alert('電話番号は半角数字(ハイフン無し)やで');
      return false;
    }
  })
  $(document).on('click', '.to-step4-button', function() {
    if ($("#user_last_name").val() == "" ||
        $("#user_first_name").val() == ""||
        $("#user_last_name_kana").val() == ""||
        $("#user_first_name_kana").val() == ""||
        $("#user_postal_code").val() == ""||
        $("#user_prefecture").val() == ""||
        $("#user_city").val() == ""||
        $("#user_house_number").val() == "")
      {
      alert('必須は全部埋めるんやで');
      return false;
    }
  })
  $(document).on('click', '.to-step4-button', function() {
    if (!$("#user_last_name_kana").val().match(/^([ァ-ン]|ー)+$/) || !$("#user_first_name_kana").val().match(/^([ァ-ン]|ー)+$/) ){
      alert('ふりがなはカタカナやで');
      return false;
    }
  })
  $(document).on('click', '.to-step4-button', function() {
    if (!$("#user_postal_code").val().match(/^[0-9]+$/)){
      alert('郵便番号は半角数字7ケタやで');
      return false;
    }
  })
})