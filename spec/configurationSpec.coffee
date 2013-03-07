define ['config/dashboard','modules/configuration'], (dashboard, configuration) ->
  describe 'configuration reader', ->
    dashboard.matrices = [{
        title: 'Fake Machines'
        rows: [{
          title: 'cpu usage'
          targets:['stats.guages.vm.*.cpu.usage']
        },
        {
          title: 'mem usage'
          targets:['stats.guages.vm.*.mem.usage']
        }]
      }]

    it 'should read matrix configuration from dashboard config', ->
      matrices = configuration.dashboardMatrices()
      expect(matrices.length).toBe 1
      expect(matrices[0].rows.length).toBe 2

    it 'should merge all targets into an array', ->
      targets = configuration.allDashboardTargets()
      expect(targets.length).toBe 2
      expect(targets[0]).toMatch 'stats.guages.vm.*.cpu.usage'
      expect(targets[1]).toMatch 'stats.guages.vm.*.mem.usage'
