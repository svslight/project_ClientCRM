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
    console.log('Remove user!');
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

  // ***************************

  $('select.model-form').on('change', function(e) {
    e.preventDefault();
    console.log('Append model!');
    model = $(this).val();
    roleId = $(this).next().data('role')
    action = $(this).data('action')

    console.log('model=', model);
    console.log('roleId=', roleId);
    $(this).next().val($(this).next().val() + ' ' + model)
    console.log('Input=', $(this).next().val());
    $('.models[data-action=' + action + ']').append('<span>' + model + '</span>')
    $('.models[data-action=' + action + ']').append('<i class="fa fa-times cross" style="font-size: 12px; margin: 0 10px 0 5px; color: red;" data-model="' + model + '" data-role="' + roleId + '">')
  });

  $(".models").on('click', 'i[data-model]', function(e) {
    e.preventDefault();
    console.log('Remove model!');
        
    roleId = $(this).data('role');
    parentDiv = $(this).parent();
    action = $(this).data('action');
    
    $(this).prev().remove();    
    $(this).remove();
    var models = '';

    for (let i of parentDiv.find('i')) {
      models += $(i).data('model') + ' ';
    };
    
    console.log('models-del=', models);
    $('input.' + action + '[data-role=' + roleId + ']').val(models)
  });

});
