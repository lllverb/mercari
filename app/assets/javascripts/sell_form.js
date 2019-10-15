document.addEventListener("turbolinks:load", function() {
  $('#category').on('change', function(e){
    e.preventDefault
    var selected = $('option:selected').val();
    console.log(selected)

    
  })
})