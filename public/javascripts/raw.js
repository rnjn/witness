
requirejs.config({
  paths: {
    jquery: "/javascripts/lib/jquery",
    d3: "/javascripts/lib/d3.min",
    underscore: "/javascripts/lib/underscore",
    modules: "/javascripts/modules",
    config: "/javascripts/config"
  },
  shim: {
    jquery: {
      exports: "jQuery",
      init: function() {
        return jQuery.noConflict(true);
      }
    },
    d3: {
      exports: "d3"
    },
    underscore: {
      exports: "_"
    }
  }
});

require(['jquery', 'lib/domReady', 'modules/graphiteClient'], function($, domReady, graphiteClient) {
  return domReady(function() {
    var listener, target;
    target = 'stats.gauges.witness.fake.vm.*.*.usage';
    listener = function(data) {
      $('#data').append(JSON.stringify(data));
      return $(window).scrollTop(document.body.scrollHeight);
    };
    graphiteClient.getData(target, listener);
    setInterval((function() {
      return graphiteClient.getData(target, listener);
    }), 10000);
    return [];
  });
});
