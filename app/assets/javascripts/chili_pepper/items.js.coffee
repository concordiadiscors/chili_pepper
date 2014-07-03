# Javascript sorting functino for dish items

@ItemsAdminControls =
  init_sort: ->
    $('#menu_dishes ul.column').sortable(
      items: "> li.item"
      connectWith: '#menu_dishes ul.column'
      update: ->
        $.post($(this).data('update-url'), {item: $(this).sortable('toArray'), column_number: $(this).data('column-number')})
    )