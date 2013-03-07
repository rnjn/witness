define ['underscore','config/dashboard'], (_,dashboard) ->
  dashboardMatrices = ->
    dashboard.matrices

  allDashboardTargets = ->
    rows = _.flatten(_.pluck dashboard.matrices, 'rows')
    _.flatten(_.pluck rows, 'targets')

  dashboardMatrices: dashboardMatrices
  allDashboardTargets: allDashboardTargets
