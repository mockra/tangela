jQuery ->
  $('.best_in_place').best_in_place()

  $('table.notes.sortable tbody').sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      $.post( $('table.notes.sortable').attr( 'url' ), $(this).sortable 'serialize' )

  $('td.note-completed input.checkbox').click ->
    project = $('h1.project').attr 'id'
    note = $(this).attr 'id'
    $.post(
      $('td.note-completed').attr('url'), { project_id: project, id: note }
    )
