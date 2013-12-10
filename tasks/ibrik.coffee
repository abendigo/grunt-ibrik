ibrik = require 'ibrik'
fs = require 'fs'

module.exports = (grunt) ->

  # Please see the Grunt documentation for more information regarding task
  # creation: http://gruntjs.com/creating-tasks

    grunt.registerMultiTask 'ibrik', 'Code Coverage for CoffeeScript', ->

        # Merge task-specific and/or target-specific options with these defaults.
        options = @options
            punctuation: '.',
            separator: ', '
        console.log 'one', options, @files



        coverageVar = "$$cov_#{Date.now()}$$"
        instrumenter = new ibrik.Instrumenter
            coverageVariable: "__foo__"
            embedSource: false
            noCompact: true



        # Iterate over all specified file groups.
        @files.forEach (f) ->
            console.log 'two', f.src[0], f.dest

            data = fs.readFileSync f.src[0], 'utf8' #, (err, data) ->
#                console.log 'err', err
            console.log '########'
            console.log data
            console.log '########'

            instrumented = instrumenter.instrumentSync data, f.src[0]

            fs.writeFileSync f.dest, instrumented

            console.log instrumented
        #     # Concat specified files.
            # src = f.src.filter (filepath) ->
            #     console.log 'three', filepath
            #     # Warn on and remove invalid source files (if nonull was set).
            #     if (!grunt.file.exists(filepath))
            #         grunt.log.warn "Source file \"#{filepath}\" not found."
            #         return false
            #     else
            #         return true
        #     .map (filepath) ->
        #         # Read file source.
        #         return grunt.file.read(filepath)
        #     .join grunt.util.normalizelf(options.separator)

        #     # Handle options.
        #     src += options.punctuation

        #     # Write the destination file.
        #     grunt.file.write(f.dest, src)

        #     # Print a success message.
        #     grunt.log.writeln "File \"#{f.dest}\" created."

