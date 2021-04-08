$(document).on('turbolinks:load', function(){
  $('.projects').on('click', '.edit-project-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var projectId = $(this).data('projectId');
    $('#name-' + projectId).hide();
    $('form#edit-project-' + projectId).removeClass('hidden');
  });

  $('select#project-new').on('change', function(e) {
    e.preventDefault();
    console.log('New!');
    $('#projects').append($('#project option[value=' + $(this).val() + ']:selected').text() + ' ');
    $('#p_ids').val($(this).val() + ' ' + $('#p_ids').val());
  });

});
