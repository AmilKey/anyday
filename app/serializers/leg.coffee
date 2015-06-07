`import DS from 'ember-data'`
`import Ember from 'ember'`


LegSerializer = DS.RESTSerializer.extend

  normalize: (type, hash)->
    # hash.id = Ember.uuid()
    @_super type, hash

`export default LegSerializer`
