$(document).on('turbolinks:load', function(){
  $('.groups').on('click', '.edit-group-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var groupId = $(this).data('groupId');
    $('form#edit-group-' + groupId).removeClass('hidden');
  });

  // $('#group_status').on('click', '.form-check-input', function () { 
  //   console.log('Событие!');
  //   $('#group_status').trigger("submit.rails");
  //   $(this).prop('checked', true);
  // });

  //   $('#group_status').on('ajax:success', function(e) {
  //     $('.groups').html( e.data );
  //   })
  //     .on('ajax:error', function (e) {

  //     });

});
