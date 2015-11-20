q-genrun
----------

You can launch this script using `coffee --nodejs --harmony src/index.coffee`

    Q = require 'q'
    genrun = require 'q-genrun'

A function that turns a generator into a promise

    Q.genrun = (generator) -> Q.async(generator)()

    module.exports = Q

Example of combined usage

    if not module.parent

      Q.genrun ->
        console.log 'Counting from 1 to 10'

        for i in [1..10]
          console.log "step #{i}/10"
          yield Q.delay 1000

        yield 'Count has finished'

      .then (message) ->
        console.log message
