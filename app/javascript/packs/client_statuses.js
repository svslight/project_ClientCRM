$(document).on('turbolinks:load', function(){
  $('.client_statuses').on('click', '.edit-clientstatus-link', function(e) {
    e.preventDefault();    
    $(this).hide();
    var clientstatusId = $(this).data('clientstatusId');
    $('#name-' + clientstatusId).hide();
    $('form#edit-clientstatus-' + clientstatusId).removeClass('hidden');
  });

});
