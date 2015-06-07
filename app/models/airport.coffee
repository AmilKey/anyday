`import DS from 'ember-data'`

{ attr } = DS

Airport = DS.Model.extend

  Name:        attr 'string'
  Country:     attr 'string'
  CountryCode: attr 'string'
  City:        attr 'string'
  CityCode:    attr 'string'
  Latitude:    attr 'number'
  Longitude:   attr 'number'

`export default Airport`
