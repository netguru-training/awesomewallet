#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require bootstrap-datepicker
#= require_tree .

$ ->
  $('.datepicker').datepicker
    format: 'yyyy-mm-dd'
