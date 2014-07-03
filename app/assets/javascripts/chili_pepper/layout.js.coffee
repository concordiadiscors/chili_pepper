jQuery ->
  if $('#menu_container').length && $('#menu_container').hasClass('chili_pepper_admin')
    SectionsAdminControls.init_sort()
    ItemsAdminControls.init_sort()
    # MenusAdminControls.init_sort()
