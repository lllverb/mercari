document.addEventListener("turbolinks:load", function() {
  $(function(){
    //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
    $('form').on('change', 'input[type="file"]', function(e) {
      var file = e.target.files[0]
      var reader = new FileReader()
      var theForm = Number(this["id"].replace(/[^0-9]/g, ''))
      if(file.type.indexOf("image") < 0){
        return false;
      }
      reader.onload = (function(file) {
        return function(e) {
          $(".image-area").append($('<img>').attr({
            src: e.target.result,
            class: "preview",
            title: file.name,
            id: theForm
          }));
        };
      })(file)
      reader.readAsDataURL(file);
      $(`#product_product_images_attributes_${theForm}_image`).addClass('hidden')
      if($(`#product_product_images_attributes_${theForm + 1}_image`).val() == ''){
        $(`#product_product_images_attributes_${theForm + 1}_image`).removeClass('hidden')
      }
    });
  });
  $(document).on('click', '.preview', function(e){
    e.preventDefault
    previewID = this['id']
    $(`#${previewID}`).remove()
    $(`#product_product_images_attributes_${previewID}_image`).val('')
    $('input[type="file"]').addClass('hidden')
    $(`#product_product_images_attributes_${previewID}_image`).removeClass('hidden')

  })
  $('#product_product_images_attributes_1_image').addClass('hidden')
  $('#product_product_images_attributes_2_image').addClass('hidden')
  $('#product_product_images_attributes_3_image').addClass('hidden')
  $('#product_product_images_attributes_4_image').addClass('hidden')
  $('#product_product_images_attributes_5_image').addClass('hidden')
  $('#product_product_images_attributes_6_image').addClass('hidden')
  $('#product_product_images_attributes_7_image').addClass('hidden')
  $('#product_product_images_attributes_8_image').addClass('hidden')
  $('#product_product_images_attributes_9_image').addClass('hidden')
})