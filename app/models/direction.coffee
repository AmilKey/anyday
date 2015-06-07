`import DS from 'ember-data'`

{ attr, hasMany } = DS

Direction = DS.Model.extend

  ChangeIndicator: attr 'string'

  # Relationships
  Points:   hasMany 'point'
  Variants: hasMany 'variant'


`export default Direction`
