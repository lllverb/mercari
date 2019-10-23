document.addEventListener("turbolinks:load", function() {
  function buildChildrenSelect() {
    childrenSelect = `<select id="product_category_children_id">
                      </select>`
    $('.category-second').append(childrenSelect);
  }
  function buildChildrenOption(child){
    childrenOption = `<option value="${child.id}">${child.name}</option>`
    $('#product_category_children_id').append(childrenOption);
  }
  function buildGrandchildrenSelect() {
    grandchildrenSelect =  `<select name="product[category_id]" id="product_category_grandchildren_id">
                            </select>`
    $('.category-third').append(grandchildrenSelect);
  }
  function buildGrandchildrenOption(grandchild){
    grandchildrenOption = `<option value="${grandchild.id}">${grandchild.name}</option>`
    $('#product_category_grandchildren_id').append(grandchildrenOption);
  }
  $(document).on('change', '#product_category', function(e){
    e.preventDefault;
    var categoryFirst = $('#product_category option:selected').val();
    $.ajax({
      url: '/products/category_children',
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
      url: '/products/category_grandchildren',
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
  function setPrices(){
    var data = $('.price').val(); // val()でフォームのvalueを取得(数値)
    if( 300 <= data && data <= 9999999) {
      var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
      var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
      $('.center--right').html(fee.toLocaleString()) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
      $('.center--right').prepend('¥') // 手数料の前に¥マークを付けたいので
      $('.lower--right').html(profit.toLocaleString())
      $('.lower--right').prepend('¥')
      $('.lower--right').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    } else {
      $('.center--right').html('-')
      $('.lower--right').html('-')
    }
    if(data == '') {   // もし､計算結果が''なら表示も消す｡
    $('.center--right').html('-');
    $('.lower--right').html('-');
    }
  }
  $('.price').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
      setPrices();
  })
  setPrices();
})