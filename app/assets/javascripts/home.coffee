# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).on "click", "#calendar-dates-table > tbody > tr > td", ->
#  alert($(this).attr('id'))

$(document).on "click", "#calendar-dates-table > tbody > tr > td", ->
  $.ajax '/update_date',
    type: 'GET'
    dataType: 'html'
    data: { calendar_date: $(this).attr("id") }
    #url: ""
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#right-content-container').html("#{data}")
       #$('#right-content-container').append "#{data}"
