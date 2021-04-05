$(document).on('turbolinks:load', function(){
  $('.group-statuses').on('click', '.edit-groupstatus-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var groupstatusId = $(this).data('groupstatusId');
    $('#name-' + groupstatusId).hide();
    $('form#edit-groupstatus-' + groupstatusId).removeClass('hidden');
  });
});
