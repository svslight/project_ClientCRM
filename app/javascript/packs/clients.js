$(document).on('turbolinks:load', function(){
  $('.clients').on('click', '.edit-client-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var clientId = $(this).data('clientId');
    $('form#edit-client-' + clientId).removeClass('hidden');
  });
});
