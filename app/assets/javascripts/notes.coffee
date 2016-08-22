# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# ----------------------
# NOTEBOOK
# ----------------------

$(document).on "click", ".nav-note-title", ->
  $.ajax '/notes_notebook_show',
    type: 'GET'
    dataType: 'html'
    data: { note_id: $(this).attr("id") }
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX ERROR: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#notebook-show').html("#{data}")
