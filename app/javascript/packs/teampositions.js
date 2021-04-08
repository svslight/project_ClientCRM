$(document).on('turbolinks:load', function(){
  $('.team-positions').on('click', '.edit-teamposition-link', function(e) {
    e.preventDefault();
    console.log('Click!')
    
    $(this).hide();
    var teampositionId = $(this).data('teampositionId');

    $('#name-' + teampositionId).hide();    
    $('form#edit-teamposition-' + teampositionId).removeClass('hidden');    
  });
});
