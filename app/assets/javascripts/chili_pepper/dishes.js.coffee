@DishForm = 
  act_on_select: ->
    $('#dish_name').bind('railsAutocomplete.select', (event, data) -> 
      section = $('#section_id').val() 
      column = $('.dish_items_column input').val() 
      link = $('#dish_attributes_list').data('engine-root') + '/' + data.item.id + "/edit?section_id=" + section + "&column=" + column;
      window.location.href = link
    )
    
