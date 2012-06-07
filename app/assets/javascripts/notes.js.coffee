jQuery ->

  $('span.notes').delegate 'tr.note', 'hover', ->
    $('table.notes.sortable tbody').sortable
      axis: 'y'
      handle: '.handle'
      update: ->
        $.post( $('table.notes.sortable').attr( 'url' ), $(this).sortable 'serialize' )
    $('.best_in_place').best_in_place()

  $('span.notes').delegate 'td.note-completed input.checkbox', 'click', ->
    project = $('h1.project-title').attr 'id'
    note = $(this).attr 'id'
    $.ajax({
      type: 'POST',
      url: $('td.note-completed').attr('url'),
      dataType: 'script',
      data: { project_id: project, id: note }
    })
