q-genrun
----------

You can launch this script using `coffee --nodejs --harmony src/index.coffee`

    Q = require 'q'

A function that turns a generator into a promise

    module.exports = genrun = (generator) -> Q.async(generator)()

Example of combined usage

    if not module.parent

      genrun ->
        console.log 'Counting from 1 to 10'

        for i in [1..10]
          console.log "step #{i}/10"
          yield Q.delay 1000

        yield 'Count has finished'

      .then (message) ->
        console.log message
