`import DS from 'ember-data'`


CarrierSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin,

  primaryKey: 'Code'

  attrs:
    Fares: embedded: 'always'

`export default CarrierSerializer`
