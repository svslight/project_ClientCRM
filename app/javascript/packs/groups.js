$(document).on('turbolinks:load', function(){
  $('.groups').on('click', '.edit-group-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var groupId = $(this).data('groupId');
    $('form#edit-group-' + groupId).removeClass('hidden');
  });
});
