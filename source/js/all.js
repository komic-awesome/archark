//= require_tree .
//= require jquery
$(function() {
  $(document).on('click', 'a[href="#"]', function(e) {
    e.preventDefault()
  })
})

$(function() {
  var hasOpened = false
    , sectionReference = $('.seciton-reference')
    , referenceList = sectionReference.find('.reference-list')

  $('.open-reference').click(function() {
    referenceList[hasOpened ? 'slideUp': 'slideDown']()
    sectionReference.find('.open-reference').html(
      hasOpened ? '书籍来源？': '收起引用'
    )
    hasOpened = !hasOpened
  })
})
