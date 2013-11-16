

module.exports = (grunt) ->

    grunt.initConfig
        jshint:
            all: []
            options: {}

        clean:
            tests: ['tmp']

        ibrik:
            default_options:
                options: {}
                files:
                    'tmp/default_options': ['test/fixtures/testing', 'test/fixtures/123']
            custom_options:
                options:
                    separator: ': '
                    punctuation: ' !!!'
                files:
                    'tmp/custom_options': ['test/fixtures/testing', 'test/fixtures/123']

        nodeunit:
            tests: ['test/*_test.js']

    grunt.loadTasks 'tasks'

    # These plugins provide necessary tasks.
    grunt.loadNpmTasks 'grunt-contrib-jshint'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-nodeunit'

    # Whenever the "test" task is run, first clean the "tmp" dir, then run this
    # plugin's task(s), then test the result.
    grunt.registerTask 'test', ['clean', 'ibrik', 'nodeunit']

    # By default, lint and run all tests.
    grunt.registerTask 'default', ['jshint', 'test']

