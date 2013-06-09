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
  url  = @getAttribute('path')
  type = @getAttribute('type')
  data = @getAttribute('data')

  xkey   = @getAttribute('xkey')
  ykeys  = (@getAttribute('ykeys') || '').split(',')
  labels = (@getAttribute('labels') || '').split(',')

  fill = @getAttribute('fillOpacity')

  axes = @getAttribute('axes')
  grid = @getAttribute('grid')

  preUnits = @getAttribute('preUnits')
  postUnits = @getAttribute('postUnits')

  plot   = document.createElement('div')
  plotId = "plot-#{plotIdCounter}"
  plot.setAttribute('id', plotId)
  plot.setAttribute('class', 'plot')
  plotIdCounter += 1

  @appendChild plot

  try
    plotter = plotFactory type
    plotterOptions = {
      xkey:       xkey
      ykeys:      ykeys
      element:    plotId
      fill:       fill
      axes:       axes
      grid:       grid
      preUnits:   preUnits
      postUnits:  postUnits
    }

    if url
      $.getJSON url, (data) ->
        plotterOptions.data = data
        plotter(plotterOptions)
    else
      plotterOptions.data = data
      plotter(plotterOptions)

  catch err
    console.err(err)
