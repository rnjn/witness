requirejs.config
  paths:
    jquery: "/javascripts/lib/jquery"
    d3: "/javascripts/lib/d3.min"
    underscore: "/javascripts/lib/underscore"
    modules:"/javascripts/modules"
    config:"/javascripts/config"

  shim:
    jquery:
      exports: "jQuery"
      init: ->
        jQuery.noConflict true
    d3:
      exports: "d3"
    underscore:
      exports: "_"

require ['jquery','lib/domReady', 'modules/graphiteClient'], ($,domReady,graphiteClient) ->
  domReady () ->
    target = 'stats.gauges.witness.fake.vm.*.*.usage'
    listener = (data) -> 
      $('#data').append JSON.stringify(data)
      $(window).scrollTop(document.body.scrollHeight)

    graphiteClient.getData target, listener
    setInterval (->
      graphiteClient.getData target, listener
      ), 10000
    []
