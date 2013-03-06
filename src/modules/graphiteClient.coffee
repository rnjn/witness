define ['jquery','config/env'], ($,env) ->
  createGraphiteUriFor = (targets) ->
    targets = [targets] if not $.isArray(targets)
    timespan = env.monitoringSpan
    graphiteTargets = targets.join('&target=')
    env.graphiteURI + "/render?from=-#{timespan}&until=now&target=#{graphiteTargets}&format=json&callback=?"

  getData = (target, listener) ->
    $.getJSON(createGraphiteUriFor(target)).success(listener)

  getData : getData
