`import DS from 'ember-data'`

{ attr, belongsTo } = DS

Leg = DS.Model.extend

  Class: attr 'string'
  ReservationType: attr 'string'
  FlightNumber: attr 'string'
  FlightDuration: attr 'Number'
  DepartureDate: attr 'Number'
  ArrivalDate: attr 'Number'
  DurationOfChange: attr 'Number'
  Stops: attr 'Number'
  StopList: attr 'hash'
  # Debug: null


  # Relationships
  Plane:   belongsTo 'plane'
  Carrier: belongsTo 'carrier'

`export default Leg`
