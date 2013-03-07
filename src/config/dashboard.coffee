define ->
  matrices = [{
          title: 'Fake Machines'
          rows: [{
            title: 'cpu usage'
            targets:['stats.gauges.witness.fake.vm.*.cpu.usage']
          },
          {
            title: 'mem usage'
            targets:['stats.gauges.witness.fake.vm.*.mem.usage']
          }]
        }]
  matrices:matrices
