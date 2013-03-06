define ['jquery','config/env','modules/graphiteClient'],($,env,graphiteClient) ->

  describe 'graphite client', ->

    describe 'create URI to access graphite data', ->

      it 'should address server as configured @ env', ->
        env.graphiteURI = 'some.graphite.server'
        ajaxSpy = spyOn($, "getJSON").andReturn  {success : () -> listener}
        listener = jasmine.createSpy()
        graphiteClient.getData 'some.metric', listener
        expect(ajaxSpy.mostRecentCall.args[0]).toMatch 'some.graphite.server'

      it 'should set monitoring span as configured @ env', ->
        env.monitoringSpan = '196hours'
        ajaxSpy = spyOn($, "getJSON").andReturn  {success : () -> listener}
        listener = jasmine.createSpy()
        graphiteClient.getData 'some.metric', listener
        expect(ajaxSpy.mostRecentCall.args[0]).toMatch '196hours'

      it 'should be able to create a graphite query for multiple targets', ->
        ajaxSpy = spyOn($, "getJSON").andReturn  {success : () -> listener}
        listener = jasmine.createSpy()
        graphiteClient.getData ['some.metric','another.metric'], listener
        expect(ajaxSpy.mostRecentCall.args[0]).toMatch '&target=some.metric'
        expect(ajaxSpy.mostRecentCall.args[0]).toMatch '&target=another.metric'
