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

$(document).on "click", ".calendar-month-switch", ->
  $.ajax '/update_calendar_month',
    type: 'GET'
    dataType: 'html'
    data: { calendar_month: $(this).attr("id") }
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#middle-top-content').html("#{data}")

$(document).on "click", "#add-longterm-notes-button", ->
  $.ajax '/home_create_note',
    type: 'GET'
    dataType: 'html'
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#add-longterm-notes-content').html("#{data}")

$(document).on "click", "#add-task-button", ->
  $.ajax '/home_create_task',
    type: 'GET'
    dataType: 'html'
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#add-task-content').html("#{data}")

