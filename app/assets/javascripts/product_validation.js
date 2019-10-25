document.addEventListener("turbolinks:load", function() {
  $(document).on('click', '.sell-button', function(){
    $('.validation-area').empty()
    i = 0
    howmany = []
    while (i <= 9){
      if ($(`#product_product_images_attributes_${i}_image`).val() == ''){
        howmany.push(i)
      }
      i += 1
    }
    if (howmany.length == 10) {
      buildRedImage()
      $('.validation-image').append(p)
    }
    if ($('#product_name').val() == ''){
      buildRedP()
      $('.validation-name').append(p)
    }
    if ($('#product_detail').val() == ''){
      buildRedP()
      $('.validation-detail').append(p)
    }
    if (!document.querySelector('#product_category_grandchildren_id')){
      buildRedChoice()
      $('.validation-category').append(p)
    }
    if ($('#product_category_grandchildren_id').val() == ''){
      buildRedChoice()
      $('.validation-category').append(p)
    }
    if ($('#product_condition_id').val() == ''){
      buildRedChoice()
      $('.validation-condition').append(p)
    }
    if ($('#product_shipping_fee_id').val() == ''){
      buildRedChoice()
      $('.validation-shipping-fee').append(p)
    }
    if ($('#product_shipping_method_id').val() == ''){
      buildRedChoice()
      $('.validation-shipping-method').append(p)
    }
    if ($('#product_prefecture_id').val() == ''){
      buildRedChoice()
      $('.validation-prefecture').append(p)
    }
    if ($('#product_deliveryday_id').val() == ''){
      buildRedChoice()
      $('.validation-deliveryday').append(p)
    }
    if ($('#product_price').val() == '' ||
        Number($('#product_price').val()) < 300 ||
        9999999 < Number($('#product_price').val())){
      buildRedPrice()
      $('.validation-price').append(p)
    }
    if ($('#product_name').val() == '' ||
        $('#product_detail').val() == '' ||
        !document.querySelector('#product_category_grandchildren_id') ||
        $('#product_category_grandchildren_id').val() == '' ||
        $('#product_condition_id').val() == '' ||
        $('#product_shipping_fee_id').val() == '' ||
        $('#product_shipping_method_id').val() == '' ||
        $('#product_prefecture_id').val() == '' ||
        $('#product_deliveryday_id').val() == '' ||
        $('#product_price').val() == ''){
      return false
    }
  })
  function buildRedImage(){
    p = `<p class='red'>画像がありません</p>`
    return p
  }
  function buildRedP(){
    p = `<p class='red'>入力してください</p>`
    return p
  }
  function buildRedChoice(){
    p = `<p class='red'>選択してください</p>`
    return p
  }
  function buildRedPrice(){
    p = `<p class='red'>300以上9999999以下で入力してください</p>`
    return p
  }
})