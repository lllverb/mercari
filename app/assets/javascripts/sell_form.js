document.addEventListener("turbolinks:load", function() {
  function buildChildrenSelect() {
    childrenSelect = `<select name="product[category_children_id]" id="product_category_children_id">
                      </select>`
    $('.category-second').append(childrenSelect);
  }
  function buildChildrenOption(child){
    childrenOption = `<option value="${child.id}">${child.name}</option>`
    $('#product_category_children_id').append(childrenOption);
  }
  function buildGrandchildrenSelect() {
    grandchildrenSelect = `<select name="product[category_grandchildren_id]" id="product_category_grandchildren_id">
                      </select>`
    $('.category-third').append(grandchildrenSelect);
  }
  function buildGrandchildrenOption(grandchild){
    grandchildrenOption = `<option value="${grandchild.id}">${grandchild.name}</option>`
    $('#product_category_grandchildren_id').append(grandchildrenOption);
  }
  $(document).on('change', '#product_category_id', function(e){
    e.preventDefault;
    var categoryFirst = $('#product_category_id option:selected').val();
    $.ajax({
      url: 'category_children',
      type: 'GET',
      dataType: 'json',
      data: {categoryFirst_id: categoryFirst}
    })
    .done(function(children){
      $('.category-second').empty()
      $('.category-third').empty()
      buildChildrenSelect()
      children.forEach(function(child){
        buildChildrenOption(child)
      })
    })
    .fail(function(){
    })
    
  })
  $(document).on('change','#product_category_children_id', function(e){
    e.preventDefault;
    var categorySecond = $('#product_category_children_id option:selected').val();
    $.ajax({
      url: 'category_grandchildren',
      type: 'GET',
      dataType: 'json',
      data: {categorySecond_id: categorySecond}
    })
    .done(function(grandchildren){
      $('.category-third').empty()
      buildGrandchildrenSelect()
      grandchildren.forEach(function(grandchild){
        buildGrandchildrenOption(grandchild)
      })
    })
    .fail(function(){
    })
    
  })
})