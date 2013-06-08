#= require raphael
#= require morris

plotIdCounter = 0

plotFactory = (typeName) ->
  switch typeName.toLowerCase()
    when 'line'          then Morris.Line
    when 'bar'           then Morris.Bar
    when 'dounut', 'pie' then Morris.Dounut
    else throw 'Unknow plot type'

$('chart').each ->
  console.log('yep')
  url  = @getAttribute('path')
  type = @getAttribute('type')

  xkey  = @getAttribute('xkey')
  ykeys = (@getAttribute('ykeys') || '').split(',')

  plot   = document.createElement('div')
  plotId = "plot-#{plotIdCounter}"
  plot.setAttribute('id', plotId)
  plot.setAttribute('class', 'plot')
  plotIdCounter += 1

  @appendChild plot

  try
    plotter = plotFactory type
    plotterOptions = {
      xkey: xkey
      ykeys: ykeys
      element: plotId
    }

    $.getJSON url, (data) ->
      plotterOptions.data = data
      plotter(data)
  catch err
    console.err(err)
