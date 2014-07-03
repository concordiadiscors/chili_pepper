# Section sorting facility

@SectionsAdminControls =
  init_sort: ->
    $('#sections_nav').sortable(
        axis: 'y'
        update: ->
         $.post($(this).data('update-url'), $(this).sortable('serialize'))
      );
      
      
  