#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .

$ ->
	$('.datepicker').datepicker
		format: 'yyyy-mm-dd'
