`import DS from 'ember-data'`
`import Ember from 'ember'`


VariantSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,

  attrs:
    Legs: embedded: 'always'

  normalize: (type, hash)->
    # hash.id = Ember.uuid()

    type.eachRelationship (key, relationship)->
      hash[key].forEach (child_record, index)->
        child_record.id = hash.id + Ember.guidFor(index)

    @_super type, hash


`export default VariantSerializer`
