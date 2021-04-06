$(document).on('turbolinks:load', function(){
  $('.group-positions').on('click', '.edit-groupposition-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var grouppositionId = $(this).data('grouppositionId');
    $('#name-' + grouppositionId).hide();
    $('form#edit-groupposition-' + grouppositionId).removeClass('hidden');
  });
});
