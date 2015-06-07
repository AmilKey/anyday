`import DS from 'ember-data'`

{ attr, belongsTo } = DS

Point = DS.Model.extend

  DepartureCode:     attr 'string'
  DepartureTerminal: attr 'string'
  ArrivalTerminal:   attr 'string'

  ArrivalCode:       belongsTo 'airport'

`export default Point`
