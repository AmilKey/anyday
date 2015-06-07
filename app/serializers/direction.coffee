`import DS from 'ember-data'`
`import Ember from 'ember'`


DirectionSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,

  attrs:
    Points:   embedded: 'always'
    Variants: embedded: 'always'

  normalize: (type, hash)->
    type.eachRelationship (key, relationship)->
      hash[key].forEach (child_record, index)->
        child_record.id = hash.id + Ember.guidFor(index)
    @_super type, hash

`export default DirectionSerializer`
