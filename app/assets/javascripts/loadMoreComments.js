$(document).on('turbolinks:load', function() {
  $('body').on('click', '.more-comments', function() {
    console.log($(this))
    $(this).on('ajax:success', function(event) {
      var postId = $(this).data('post-id')
      $('#comments_' + postId).html(event.detail[2].responseText)
      $('#comments-paginator-' + postId).html(
        "<a id='more-comments' data-post-id=" +
          postId +
          "data-type='html' data-remote='true' href='/posts/" +
          postId +
          '/comments>show more comments</a>'
      )
    })
  })
})
