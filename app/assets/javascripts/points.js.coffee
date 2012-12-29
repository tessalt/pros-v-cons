# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".points textarea").keypress (e) ->
    if e.keyCode is 13
      $(this).parent("form").submit()
      false

  $("#pros, #cons").sortable (
    axis: 'y'
    update: -> 
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
    )

  $(".best_in_place").bind "ajax:success", ->
    weight = $(this).text()
    $(this).parent("li").addClass "weight-" + weight
 