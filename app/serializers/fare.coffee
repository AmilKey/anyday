`import DS from 'ember-data'`
`import Ember from 'ember'`


FareSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,

  primaryKey: 'Id'

  attrs:
    BonusLevel: embedded: 'always'
    Directions: embedded: 'always'

  normalize: (type, hash)->
    primaryKey = @get 'primaryKey'

    type.eachRelationship (key, relationship) ->
      hash[key].forEach (child_record, index)->
        child_record.id = hash[primaryKey] + Ember.guidFor(index)

    @_super type, hash

`export default FareSerializer`
