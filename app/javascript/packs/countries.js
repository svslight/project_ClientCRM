$(document).on('turbolinks:load', function(){
  $('.countries').on('click', '.edit-country-link', function(e) {
    e.preventDefault();    
    $(this).hide();
    var countryId = $(this).data('countryId');
    $('#name-' + countryId).hide();
    $('form#edit-country-' + countryId).removeClass('hidden');
  });

  $('.countries')
  .on('ajax:success', 'a.cancel-country', function(e) {
    console.log('ajax!');
    var country = e.detail[0];
    var country_id = $(this).data('id')

    $('span#name-' + country_id).text( country.name );
    $('span#name-' + country_id).show();
    $('form#edit-country-' + country_id).addClass('hidden');
    $('a[data-country-id="' + country_id + '"]').show();
  })
  .on('ajax:error', function (e) {
    var errors = e.detail[0];

    $('.country-errors').html(errors);
  })
});
