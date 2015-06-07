`import DS from 'ember-data'`


BonusSerializer = DS.RESTSerializer.extend

  normalize: (type, hash)->
    # hash.id = Ember.uuid()
    @_super type, hash

`export default BonusSerializer`
