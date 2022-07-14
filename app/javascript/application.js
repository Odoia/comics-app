// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"

$(document).on("turbo:load", () => {
  $('span').on('click', function() {

    let comic_id = $(this).attr('id')
    let favorite_data = $(this).find('img')
    let favorite_value = $(this).find('img').attr('data-favorite')

    $.ajax ({
      beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
      url: '/update_favorite',
      type: 'post',
      dataType: 'script',
      data: {
        comic_id: comic_id,
        favorite_value: favorite_value
      },
      success: () => { 
      }
    })

    if(favorite_value == 'false') {
      $(`#image-${comic_id}`).attr('src', 'heart_on.png')
      favorite_data.attr('data-favorite', true)
    }else{
      $(`#image-${comic_id}`).attr('src', 'heart_off.png')
      favorite_data.attr('data-favorite', false)
    }
  });
})
