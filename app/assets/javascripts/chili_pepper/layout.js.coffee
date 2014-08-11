jQuery ->
  if $('#menu_container').length && $('#menu_container').hasClass('chili_pepper_admin')
    SectionsAdminControls.init_sort()
    ItemsAdminControls.init_sort()

  
  if $('#new_dish').length
    DishForm.act_on_select()

  MenuForm.init()
  MenusAdminControls.init_sort()

  $('#dish_name').on 'autocompleteresponse', (event, ui) ->
    if ui.content?[0].id.length == 0 || $('.edit_dish').length
      $(this).autocomplete('close')



