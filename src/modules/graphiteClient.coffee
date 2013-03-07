define ['jquery','config/env'], ($,env) ->
  createGraphiteUriFor = (targets) ->
    targets = [targets] if not $.isArray(targets)
    timespan = env.monitoringSpan
    graphiteTargets = targets.join('&target=')
    query = "/render?from=-#{timespan}&until=now&target=#{graphiteTargets}&format=json&jsonp=?"
    env.graphiteURI + query

  getData = (target, listener) ->
    $.ajax
      url: createGraphiteUriFor(target)
      dataType: 'json'
      jsonp: 'jsonp'
      success: listener

  getData : getData
