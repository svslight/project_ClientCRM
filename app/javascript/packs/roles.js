$(document).on('turbolinks:load', function(){
  $('.roles').on('click', '.edit-role-link', function(e) {
    e.preventDefault();
    $(this).hide();
    var roleId = $(this).data('roleId');
    $('#name-' + roleId).hide();
    $('form#edit-role-' + roleId).removeClass('hidden');
  });

  t = {
    All: 'Все',
    Role: 'Роли',
    RoleUser: 'Роли пользователя',
    User: 'Пользователи',
    Client: 'Клиенты',
    Status: 'Статусы',
    StatusClient: 'Статус клиента',
    Country: 'Страны',
    GroupStatus: 'Статусы групп',
    Group: 'Группы по городам',
    GroupPosition: 'Должности в группе',
    Project: 'Проекты',
    ProjectTeam: 'Командные проекты',
    TeamPosition: 'Должности в проекте',
    SchemaMigration: 'Схема',
    ArInternalMetadatum: 'Метаданные'
  };

  // Определение прав
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
    $('.models[data-action=' + action + ']').append('<span>' + t[model] + '</span>')
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
