document.addEventListener('turbolinks:load', function() {
  $(document).on('mouseenter', '.icon', function(){
    if ( $('.image')['0']['style']['background-image'] != this['style']['background-image']){
      $('.image').remove()
      $('.product-container__inner--center--left').prepend("<div class='image' style=''>")
      $('.image')['0']['style']['background-image'] = this['style']['background-image']
      $('.icon').addClass('opacity')
      $(this).removeClass('opacity')
    }
  })
  $('.icon:first-child').removeClass('opacity')
})