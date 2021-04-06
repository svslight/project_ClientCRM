$(document).on('turbolinks:load', function(){
  $('.projects').on('click', '.edit-project-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var projectId = $(this).data('projectId');
    $('#name-' + projectId).hide();
    $('form#edit-project-' + projectId).removeClass('hidden');
  });
});
