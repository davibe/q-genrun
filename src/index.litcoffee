q-extended
----------

I took liberty to extend `Q.js` by adding a couple of utility
functions to simplify my workflow (I use promises and yield)

You can launch this script using `coffee --nodejs --harmony src/index.coffee`

    Q = require 'q'


A serialized version of `Q.all`

    Q.each = (collection, iterator) ->
      cur = Q()
      promises = collection.map (item) ->
        cur = cur.then ->
          iterator(item)
      Q.all(promises)


A function that turns a generator into a promise

    Q.genrun = (generator) -> Q.async(generator)()


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
      
