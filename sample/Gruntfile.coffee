module.exports = (grunt) ->

    grunt.initConfig
        ibrik:
            main:
                options: {}
                files:
                    '.tmp': ['src/**/*.coffee']
            other:
                files: [{
                    expand: true
                    cwd: 'src'
                    src: '**/*.coffee'
                    dest: '.tmp'
                    ext: '.js'
                }
                ]


    grunt.loadNpmTasks 'grunt-ibrik'

    grunt.registerTask 'default', ['ibrik']