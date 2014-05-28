jQuery ->
  
  $('#sortable').sortable(
    axis: 'y'
    items: '.item'
    delay: 150
    handle: ".handle"
    
    # close any open option selections
    start: (e, ui) ->
      $(".toggle").hide 100
    
    # highlight the row on drop to indicate an update
    stop: (e, ui) ->
      ui.item.children('td').effect('highlight', {}, 1000)
    update: (e, ui) ->
      item_id = ui.item.data('item-id')
      position = ui.item.index()
      $.ajax(
        type: 'POST'
        url: $(this).data('updateUrl')
        dataType: 'json'

        # the :thing hash gets passed to @thing.attributes
        # row_order is the default column name expected in ranked-model
        data: { id: item_id, todo: { position: position } }
      )
  )

  $('.alert-success').hide().delay(50).fadeIn(20).delay(2000).fadeOut(500)