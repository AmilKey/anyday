`import DS from 'ember-data'`

HashTransform = DS.Transform.extend
  deserialize: (serialized) ->
    serialized

  serialize: (deserialized) ->
    deserialized

`export default HashTransform`
