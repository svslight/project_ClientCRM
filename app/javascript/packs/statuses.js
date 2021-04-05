$(document).on('turbolinks:load', function(){
  $('.statuses').on('click', '.edit-status-link', function(e) {
    e.preventDefault();    
    $(this).hide();
    var statusId = $(this).data('statusId');
    $('#name-' + statusId).hide();
    $('form#edit-status-' + statusId).removeClass('hidden');
  });

  $('select#status-new').on('change', function(e) {
    e.preventDefault();
    console.log('New!');
    $('#statuses').append($('#status option[value=' + $(this).val() + ']:selected').text() + ' ');
    $('#ids').val($(this).val() + ' ' + $('#ids').val());
  });

  $('select.status-form').on('change', function(e) {
    e.preventDefault();
    console.log('Changed!');
    clientId = $(this).next().data('client');
    $('.statuses').append($('.status-form option[value=' + $(this).val() + ']:selected').text() + ' ');
    $('.statuses').append('<i class="fa fa-times cross" style="font-size: 12px; margin: 0 10px 0 5px; color: red;" data-client=' + clientId + 'data-id=' + $(this).val() + '>')
    const inp = $('input[data-client=' + clientId + ']');
    inp.val($(this).val() + ' ' + inp.val());
  });

  $('i[data-client]').on('click', function(e) {
    e.preventDefault();
    clientId = $(this).data('client');
    parentDiv = $(this).parent();
    
    $(this).prev().remove();    
    $(this).remove();
    var ids = '';

    for (let i of parentDiv.find('i')) {
      ids += $(i).data('id') + ' ';
    };

    $('input[data-client=' + clientId + ']').val(ids)
  });

});
