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
       $('#right-top-content').html("#{data}")
       #$('#right-content-container').append "#{data}"
  $.ajax '/update_task_date',
    type: 'GET'
    dataType: 'html'
    data: { calendar_date: $(this).attr("id") }
    #url: ""
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#left-bottom-content').html("#{data}")

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

$(document).on "click", ".planner-entry > .task-checkbox", ->
  $(this).attr("disabled", "disabled")
  $.ajax '/tasks_mark_complete',
    type: 'POST'
    dataType: 'html'
    data: { note_id: $(this).attr("id") }
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->

$(document).on "click", ".right-nav-button", ->
  $.ajax '/update_right_nav',
    type: 'GET'
    dataType: 'html'
    data: { target_page: $(this).attr("id"), today_string : $('#calendar').attr("class") }
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#right-top-content').html("#{data}")

$(document).on "click", ".left-nav-button", ->
  $.ajax '/update_left_nav',
    type: 'GET'
    dataType: 'html'
    data: { target_page: $(this).attr("id"), today_string : $('#calendar').attr("class") }
    error: (jqXHR, textStatus, errorThrown) ->
       $('body').append "AJAX Error: #{textStatus}"
    success: (data, textStatus, jqXHR) ->
       $('#left-top-content').html("#{data}")

