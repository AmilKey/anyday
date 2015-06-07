`import DS from 'ember-data'`

{ attr, hasMany } = DS

Variant = DS.Model.extend

  TravelTime: attr 'Number'
  ConfirmState: attr 'Number'
  AdditionalInformations: attr 'hash'
  AtcSupported: attr 'Boolean'


  # Relationships
  Legs: hasMany 'leg'

  # Debug: null


`export default Variant`
