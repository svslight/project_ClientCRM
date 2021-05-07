$(document).on('turbolinks:load', function(){
  $('.users').on('click', '.edit-user-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var userId = $(this).data('userId');
    $('form#edit-user-' + userId).removeClass('hidden');
  });
});
