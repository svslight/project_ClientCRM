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
    console.log('New project!');
    $('#projects').append($('#project option[value=' + $(this).val() + ']:selected').text() + ' ');
    $('#pids').val($(this).val() + ' ' + $('#pids').val());
  });

  $('select.project-form').on('change', function(e) {
    e.preventDefault();
    console.log('Append project!');
    clientId = $(this).next().data('pclient');
    $('.projects').append($('.project-form option[value=' + $(this).val() + ']:selected').text() + ' ');
    $('.projects').append('<i class="fa fa-times cross" style="font-size: 12px; margin: 0 10px 0 5px; color: red;" data-pclient="' + clientId + '" data-id="' + $(this).val() + '">')
    var inp = $('input[data-pclient=' + clientId + ']');
    console.log('Append project!', inp);
    inp.val($(this).val() + ' ' + inp.val());
  });

  $('i[data-pclient]').on('click', function(e) {
    e.preventDefault();
    clientId = $(this).data('pclient');
    parentDiv = $(this).parent();
    
    $(this).prev().remove();    
    $(this).remove();
    var pids = '';

    for (let i of parentDiv.find('i')) {
      pids += $(i).data('id') + ' ';
    };

    $('input[data-pclient=' + clientId + ']').val(pids)
  });

});
