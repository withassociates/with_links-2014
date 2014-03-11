#= require active_admin/base

saveOrder = (ids) ->
  $.ajax
    type: 'post'
    url: '/admin/themes/sort'
    data: { link_ids: ids }

$ ->
  $('.sort_these').each ->
    el = $ this
    el.disableSelection()
    el.sortable
      axis: 'y'
      cursor: 'move'
      update: ->
        items = el.find '.index-link'
        ids = items.map(-> this.id).get()
        saveOrder ids
