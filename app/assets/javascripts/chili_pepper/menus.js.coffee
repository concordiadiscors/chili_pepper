@MenuForm = 
  init: ->
    $('.admin_form form').on 'click', '.remove_fields', (event) ->
      $(this).prev('ul').find('li input[type=hidden]').val('1')
      $(this).parent('li').hide()
      event.preventDefault()
    $('.admin_form form').on 'click', '.add_fields', (event) ->
      time = new Date().getTime()
      regexp = new RegExp($(this).data('id'), 'g')
      $(this).parent('li').before($(this).data('fields').replace(regexp, time))
      event.preventDefault()

@MenusAdminControls =
  init_sort: ->
    if $('.chili_pepper_admin').length
      $('#menu_nav ul').sortable(
        axis: 'x'
        update: ->
         $.post($(this).data('update-url'), $(this).sortable('serialize'))
      )
          