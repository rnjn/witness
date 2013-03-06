module.exports = (grunt) ->
  grunt.initConfig
    clean: [
      "public/javascripts/config/*.js", 
      "public/javascripts/modules/*.js",
      "spec/*.js",
    ]

    jshint:
      all: ["grunt.js"]

    coffeelint:
      all:
        options:
          no_trailing_whitespace:
            level: "warn"
          max_line_length: 
            value: 100
            level: "warn"
        files:
          src: ["src/**/*.coffee", "spec/*.coffee"]
    coffee:
      compile:
        options:
          bare:true
        files: [{
          expand: true,
          cwd: 'src'
          src: ['**/*.coffee'],
          dest: 'public/javascripts/'
          ext: '.js'
          },{
          expand: true,
          src: ['spec/*.coffee'],
          ext: '.js'            
          }
        ]
        
    jasmine:
      witness:
        src: "public/javascripts/*.coffee"
        options:
          specs: "spec/*Spec.js"
          helpers: ["public/javascripts/lib/require.js", "spec/lib/jasmine-jquery.js"]
          amd: true
          phantomjs:
            "ignore-ssl-errors": true

          template: require("grunt-template-jasmine-requirejs")
          templateOptions:
            requireConfig:
              paths:
                jquery: "public/javascripts/lib/jquery"
                d3: "public/javascripts/lib/d3.min"
                underscore: "public/javascripts/lib/underscore"
                modules:"public/javascripts/modules"
                config:"public/javascripts/config"

              shim:
                jquery:
                  exports: "jQuery"
                  init: ->
                    jQuery.noConflict true

                d3:
                  exports: "d3"

                underscore:
                  exports: "_"


  grunt.loadNpmTasks "grunt-contrib-jasmine"
  grunt.loadNpmTasks "grunt-contrib-jshint"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-clean"

  grunt.registerTask "build", ["jshint", "coffeelint", "clean", "coffee", "jasmine"]
  grunt.registerTask "default", "build"
