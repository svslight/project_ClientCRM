$(document).on('turbolinks:load', function(){
  $('.roles').on('click', '.edit-role-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var roleId = $(this).data('roleId');
    $('#name-' + roleId).hide();
    $('form#edit-role-' + roleId).removeClass('hidden');
  });

  $('select.role-form').on('change', function(e) {
    e.preventDefault();
    console.log('Append role!');
    userId = $(this).next().data('user');
    $('.roles').append($('.role-form option[value=' + $(this).val() + ']:selected').text() + ' ');
    $('.roles').append('<i class="fa fa-times cross" style="font-size: 12px; margin: 0 10px 0 5px; color: red;" data-user="' + userId + '" data-id="' + $(this).val() + '">')
    var inp = $('input[data-user=' + userId + ']');
    console.log('Append role!', inp);
    inp.val($(this).val() + ' ' + inp.val());
  });

  $('i[data-user]').on('click', function(e) {
    e.preventDefault();
    userId = $(this).data('user');
    parentDiv = $(this).parent();
    
    $(this).prev().remove();    
    $(this).remove();
    var rids = '';

    for (let i of parentDiv.find('i')) {
      rids += $(i).data('id') + ' ';
    };

    $('input[data-user=' + userId + ']').val(rids)
  });

});
