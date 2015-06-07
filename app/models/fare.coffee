`import DS from 'ember-data'`
`import Ember from 'ember'`

{ attr, hasMany } = DS

Fare = DS.Model.extend

  BonusAllowed: attr 'boolean'
  TimeToTravel: attr 'Number'
  TravelDuration: attr 'Number'
  TotalAmount: attr 'Number'
  TotalAmountRub: attr 'Number'
  TotalAmountEur: attr 'Number'
  AdultAmountCeiledRub: attr 'Number'
  ChildrenAmountCeiledRub: attr 'Number'
  BabyAmountCeiledRub: attr 'Number'
  IsLowCost: attr 'boolean'
  PromoApplied: attr 'boolean'
  ConfirmState: attr 'Number'
  TotalAmountWithoutSale:    attr 'Number'
  FutureCrossSaleApplicable: attr 'boolean'
  MinAvailSeats:             attr 'Number'


  # Relationships
  BonusLevel: hasMany 'bonus'
  Directions: hasMany 'direction'

  # 'Debug': null
  # 'PromoCodes': []

inflector = Ember.Inflector.inflector
inflector.uncountable('bonus')

`export default Fare`
