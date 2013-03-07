os = require 'os'
statsdClient = require 'statsd-client'
sc = new statsdClient {
    host: '192.168.56.111',
    port: 8125
}

hostCount = 20
metricPrefix = 'witness.fake.vm.'
machines = (metricPrefix + number for number in [hostCount..1])

sendGauge = (metricName) ->
  randomNumber =  Math.floor((Math.random() * 100) + 1)
  sc.gauge metricName, randomNumber
  [metricName, randomNumber]

logCpu = -> 
  sendGauge machineName + '.cpu.usage' for machineName in machines


logMem = ->
  sendGauge machineName + '.mem.usage' for machineName in machines

send = () ->
  console.log JSON.stringify(logCpu())
  console.log JSON.stringify(logMem())

module.exports = send

