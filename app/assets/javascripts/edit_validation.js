document.addEventListener("turbolinks:load", function() {
  $(document).on('click', '.edit-button', function(){
    $('.validation-area').empty()
    i = 0
    howmany = []
    while (i <= 9){
      if ($(`#product_product_images_attributes_${i}_image`).val() == '' && $(`#product_product_images_attributes_${i}_id`).val() == ''){
        howmany.push(i)
      }
      i += 1
    }
    if (howmany.length == 10) {
      var appendArea = $('.validation-image')
      buildRedImage(appendArea)
    }
    if ($('#product_name').val() == ''){
      var appendArea = $('.validation-name')
      buildRedP(appendArea)
    }
    if ($('#product_detail').val() == ''){
      var appendArea = $('.validation-detail')
      buildRedP(appendArea)
    }
    if (!document.querySelector('#product_category_id')){
      var appendArea = $('.validation-category')
      buildRedChoice(appendArea)
    }
    if ($('#product_category_id').val() == ''){
      var appendArea = $('.validation-category')
      buildRedChoice(appendArea)
    }
    if ($('#product_condition_id').val() == ''){
      var appendArea = $('.validation-condition')
      buildRedChoice(appendArea)
    }
    if ($('#product_shipping_fee_id').val() == ''){
      var appendArea = $('.validation-shipping-fee')
      buildRedChoice(appendArea)
    }
    if ($('#product_shipping_method_id').val() == ''){
      var appendArea = $('.validation-shipping-method')
      buildRedChoice(appendArea)
    }
    if ($('#product_prefecture_id').val() == ''){
      var appendArea = $('.validation-prefecture')
      buildRedChoice(appendArea)
    }
    if ($('#product_deliveryday_id').val() == ''){
      var appendArea = $('.validation-deliveryday')
      buildRedChoice(appendArea)
    }
    if ($('#product_price').val() == '' ||
    Number($('#product_price').val()) < 300 ||
    9999999 < Number($('#product_price').val())){
      var appendArea = $('.validation-price')
      buildRedPrice()
    }
    if ($('#product_name').val() == '' ||
        $('#product_detail').val() == '' ||
        !document.querySelector('#product_category_id') ||
        $('#product_category_id').val() == '' ||
        $('#product_condition_id').val() == '' ||
        $('#product_shipping_fee_id').val() == '' ||
        $('#product_shipping_method_id').val() == '' ||
        $('#product_prefecture_id').val() == '' ||
        $('#product_deliveryday_id').val() == '' ||
        $('#product_price').val() == ''){
      return false
    }
  })
  function buildRedImage(appendArea){
    p = `<p class='red'>画像がありません</p>`
    appendArea.append(p)
  }
  function buildRedP(appendArea){
    p = `<p class='red'>入力してください</p>`
    appendArea.append(p)
  }
  function buildRedChoice(appendArea){
    p = `<p class='red'>選択してください</p>`
    appendArea.append(p)
  }
  function buildRedPrice(appendArea){
    p = `<p class='red'>300以上9999999以下で入力してください</p>`
    appendArea.append(p)
  }
})