@DishForm = 
  act_on_select: ->
    $('#dish_name').on('railsAutocomplete.select', (event, data) -> 
      console.log 'sdf'
      # section = $('#section_id').val();
      # link = "chili_pepper/dishes/" + data.item.id + "/edit?section=" + section;
      # DishForm.redirect_to_edit(link)
    )
  redirect_to_edit: (link) ->

    # $(body).append('<a id="golink" href="' + link + '">*</a>');
    # $('#golink').click();
